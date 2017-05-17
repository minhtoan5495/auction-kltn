package hvcntt.org.shoppingweb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;

@Controller
public class HomePageController {

    @Autowired
    ProductService productService;

    @Autowired
    TransactionTypeService transactionService;

    @Autowired
    SupplierService supplierService;

    @Autowired
    AuctionService auctionService;

    @Autowired
    ParentService parentService;

    public static final String SALE = "Sale";

    public static final String AUCTION = "Auction";

    public static final String MESSAGE_RESULT = " sản phẩm được tìm thấy";

    @ModelAttribute("parents")
    public List<Parent> parent() {
        return parentService.findAll();
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping(value = "/home")
    public String homePage(Model model, HttpSession session, HttpServletRequest request) {
        @SuppressWarnings("unused")
        List<CartItem> inFo = (List<CartItem>) session.getAttribute("cart");
        model.addAttribute("parents", parentService.findAll());
        TransactionType transactionType = transactionService.findByName("Sale");
        PagedListHolder productSalePage = new PagedListHolder(productService.findByProductTransactionType(transactionType));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        productSalePage.setPage(page);
        productSalePage.setPageSize(4);
        model.addAttribute("productSalePage", productSalePage);
        TransactionType transactionType2 = transactionService.findByName("Auction");
        PagedListHolder productAuctionPage = new PagedListHolder(productService.findByProductTransactionType(transactionType2));
        int pageAuction = ServletRequestUtils.getIntParameter(request, "page", 0);
        productAuctionPage.setPage(pageAuction);
        productAuctionPage.setPageSize(4);
        model.addAttribute("productAuctionPage", productAuctionPage);
        model.addAttribute("listSupplier", supplierService.getAll());
        model.addAttribute("listProductHighView", productService.getHighView());
        TransactionType transactionTypeSale = transactionService.findByName(SALE);
        model.addAttribute("productSales", productService.findByProductTransactionType(transactionTypeSale));
        TransactionType transactionTypeAuction = transactionService.findByName(AUCTION);
        model.addAttribute("productAuctions", productService.findByProductTransactionType(transactionTypeAuction));
        model.addAttribute("suppliers", supplierService.getAll());
        model.addAttribute("productHighViews", productService.getHighView());
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        return "home";
    }

    @RequestMapping(value = "/searchName")
    public String searchPage(Model model, HttpServletRequest request) {
        String name = request.getParameter("name");
        List<Product> listProductByName = productService.findByNameContaining(name);
        model.addAttribute("resultList", listProductByName);
        model.addAttribute("message", "có " + productService.findByNameContaining(name).size() + MESSAGE_RESULT);
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("name", name);
        return "resultSearch";
    }

    @RequestMapping(value = "/searchNameBySort")
    public String searchPageSort(Model model, @RequestParam("name") String name
            , @RequestParam("sortby") String sortBy) {
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
        model.addAttribute("message", "có " + productService.findByNameContaining(name).size() + MESSAGE_RESULT);
        ;
        return "resultSearch";
    }

    @RequestMapping(value = "/supplier")
    public String getSupplier(Model model, @RequestParam("supplierId") String supplierId, HttpServletRequest request) {
        Supplier supplier = supplierService.findOne(supplierId);
        List<Product> listProductSuppliers = productService.findBySupplier(supplier);
        model.addAttribute("resultList", listProductSuppliers);
        model.addAttribute("message", "Có " + productService.findBySupplier(supplier).size() + MESSAGE_RESULT);
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        return "resultSearch";
    }
}

