package hvcntt.org.shoppingweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Category;
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

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/home")
    public String homePage(Model model, HttpSession session, HttpServletRequest request) {
        @SuppressWarnings("unused")
        List<CartItem> inFo = (List<CartItem>) session.getAttribute("cart");
        model.addAttribute("parents", parentService.findAll());
        TransactionType transactionType = transactionService.findByName("Sale");
        PagedListHolder pagedListHolder = new PagedListHolder(productService.findByProductTransactionType(transactionType));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(4);
        model.addAttribute("pagedListHolder", pagedListHolder);
        TransactionType transactionType2 = transactionService.findByName("Auction");
        PagedListHolder pagedListHolder1 = new PagedListHolder(productService.findByProductTransactionType(transactionType2));
        int pageAuction = ServletRequestUtils.getIntParameter(request, "page", 0);
        pagedListHolder1.setPage(pageAuction);
        pagedListHolder1.setPageSize(4);
        model.addAttribute("pagedListHolder1", pagedListHolder1);
        model.addAttribute("listSupplier", supplierService.getAll());
        model.addAttribute("listProductHighView", productService.getHighView());
        TransactionType transactionTypeSale = transactionService.findByName(SALE);
        model.addAttribute("productSales", productService.findByProductTransactionType(transactionTypeSale));
        TransactionType transactionTypeAuction = transactionService.findByName(AUCTION);
        model.addAttribute("productAuctions", productService.findByProductTransactionType(transactionTypeAuction));
        model.addAttribute("suppliers", supplierService.getAll());
        model.addAttribute("productHighViews", productService.getHighView());
        return "home";
    }

    @RequestMapping(value = "/searchName")
    public String searchPage(@RequestParam("name") String name, Model model,HttpServletRequest request) {
        model.addAttribute("parents", parentService.findAll());
        PagedListHolder pagedListHolder = new PagedListHolder(productService.findByNameContaining(name));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(4);
        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("message", "có " + productService.findByNameContaining(name).size() + MESSAGE_RESULT);
        return "resultSearch";
    }

    @RequestMapping(value = "/{pageNumber}")
    public String getPaging(@PathVariable int pageNumber, Model model) {
        TransactionType transactionType = transactionService.findByName(SALE);
        Page<Product> pageProduct = productService.findProductPaging(transactionType, new PageRequest(pageNumber, 4, Direction.ASC, "price"));
        List<Product> stackProduct = pageProduct.getContent();
        int totalPage = pageProduct.getTotalPages();
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("products", stackProduct);
        model.addAttribute("auctions", auctionService.getAll());
        return "home";
    }

    @RequestMapping(value = "/supplier")
    public String getSupplier(Model model, @RequestParam("supplierId") String supplierId) {
        Supplier supplier = supplierService.findOne(supplierId);
        model.addAttribute("products", productService.findBySupplier(supplier));
        model.addAttribute("suppliers", supplierService.getAll());
        model.addAttribute("message", "Có " + productService.findBySupplier(supplier).size() + MESSAGE_RESULT);
        return "resultSearch";
    }

    @RequestMapping(value = "/priceHighToLower")
    public String getPriceHigh(Model model, HttpServletRequest request) {
        PagedListHolder pagedListHolder = new PagedListHolder(productService.getPriceLowerToHighest());
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(4);
        model.addAttribute("pagedListHolder", pagedListHolder);
        return "resultSearch";
    }

    @RequestMapping(value = "/priceLowerToHigh")
    public String getPriceLower(Model model,HttpServletRequest request) {
    	  PagedListHolder pagedListHolder = new PagedListHolder(productService.getPriceHighestToLower());
          int page = ServletRequestUtils.getIntParameter(request, "p", 0);
          pagedListHolder.setPage(page);
          pagedListHolder.setPageSize(4);
          model.addAttribute("pagedListHolder", pagedListHolder);
        return "resultSearch";
    }
}

