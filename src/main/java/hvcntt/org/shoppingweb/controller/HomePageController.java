package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.Constant;
import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.service.ParentService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.SupplierService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class HomePageController {

    @Autowired
    ProductService productService;

    @Autowired
    TransactionTypeService transactionService;

    @Autowired
    SupplierService supplierService;

    @Autowired
    ParentService parentService;

    public static final String SALE = "Sale";

    public static final String AUCTION = "Auction";

    @ModelAttribute("parents")
    public List<Parent> parent() {
        return parentService.findAll();
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/home")
    public String homePage(Model model, HttpSession session, HttpServletRequest request, @RequestParam(value = "message", required = false) String message) {
        if("loginSuccess".equals(message)){
            model.addAttribute("message", Constant.LOGIN_SUCCESS);
        }
        if("addCartSuccess".equals(session.getAttribute("message"))){
            model.addAttribute("message", Constant.ADD_TO_CART);
            session.removeAttribute("message");
        }
        model.addAttribute("parents", parentService.findAll());
        TransactionType transactionType = transactionService.findByName(SALE);
        PagedListHolder productSalePage = new PagedListHolder(productService.findByProductTransactionType(transactionType));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        productSalePage.setPage(page);
        productSalePage.setPageSize(8);
        model.addAttribute("productSalePage", productSalePage);
        TransactionType transactionType2 = transactionService.findByName(AUCTION);
        PagedListHolder productAuctionPage = new PagedListHolder(productService.findByProductTransactionType(transactionType2));
        int pageAuction = ServletRequestUtils.getIntParameter(request, "page", 0);
        productAuctionPage.setPage(pageAuction);
        productAuctionPage.setPageSize(8);
        model.addAttribute("productAuctionPage", productAuctionPage);
        model.addAttribute("listSupplier", supplierService.getAll());
        model.addAttribute("listProductHighView", productService.getNewProduct());
        Calendar endTime = Calendar.getInstance();
        Date timeNow=endTime.getTime();
        endTime.add(Calendar.DAY_OF_MONTH, -2);
        Date currentDate = endTime.getTime();
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("timeNow", timeNow);
        return "home";
    }

    @RequestMapping(value = "/searchName")
    public String searchPage(Model model, HttpServletRequest request) {
        String name = request.getParameter("name");
        List<Product> listProductByName = productService.findByNameContaining(name);
        model.addAttribute("resultList", listProductByName);
        model.addAttribute("message", "Search result : " + productService.findByNameContaining(name).size());
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("name", name);
        return "resultSearch";
    }

    @RequestMapping(value = "/searchNameBySort")
    public String searchPageSort(Model model, @RequestParam("name") String name
            , @RequestParam("sortBy") String sortBy) {
        if (sortBy.equals("desc")) {
            List<Product> listProductPriceDesc = productService.findByContainingnameAndDescPrice(name);
            model.addAttribute("resultList", listProductPriceDesc);
        }
        if (sortBy.equals("asc")) {
            List<Product> listProductPriceAsc = productService.findByContainingnameAndAscPrice(name);
            model.addAttribute("resultList", listProductPriceAsc);
        }
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("name", name);
        model.addAttribute("message", "Search result : " + productService.findByNameContaining(name).size());
        return "resultSearch";
    }

    @RequestMapping(value = "/supplier")
    public String getSupplier(Model model, @RequestParam("supplierId") String supplierId) {
        Supplier supplier = supplierService.findOne(supplierId);
        List<Product> listProductSuppliers = productService.findBySupplier(supplier);
        model.addAttribute("resultList", listProductSuppliers);
        model.addAttribute("message", "Search result : " + productService.findBySupplier(supplier).size());
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        return "resultSearch";
    }
}

