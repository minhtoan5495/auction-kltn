package hvcntt.org.shoppingweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    CategoryService categoryservice;

    @Autowired
    ProductService productservice;

    @Autowired
    TransactionTypeService transactionService;

    @Autowired
    AuctionService auctionService;

    @Autowired
    ParentService parentService;

    @ModelAttribute("parents")
    public List<Parent> parent(){
        return parentService.findAll();
    }


    @Autowired
    SupplierService supplierService;
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/home")
    public String homePage(Model model, HttpSession session) {
        @SuppressWarnings("unused")
        List<CartItem> inFo = (List<CartItem>) session.getAttribute("cart");
        model.addAttribute("parents", parentService.findAll());
        TransactionType transactionType = transactionService.findByName("Sale");
        model.addAttribute("listProduct", productservice.findByProductTransactionType(transactionType));
        TransactionType transactionType2 = transactionService.findByName("Auction");
        model.addAttribute("listProduct2", productservice.findByProductTransactionType(transactionType2));
        model.addAttribute("listSupplier",supplierService.getAll() );
        return "home";
    }

    @RequestMapping(value = "/searchname")
    public String searchPage(@RequestParam("name") String name, Model model) {
        model.addAttribute("parents", parentService.findAll());
        model.addAttribute("listProduct", productservice.findByNameContaining(name));
        model.addAttribute("message", "có " + productservice.findByNameContaining(name).size() + " sản phẩm được tìm thấy");
        return "resultSearch";
    }

    @RequestMapping(value = "/{pagenumber}")
    public String getPaging(@PathVariable int pagenumber, Model model) {
        TransactionType transactionType = transactionService.findByName("Sale");
        Page<Product> pageProduct = productservice.findProductPaging(transactionType, new PageRequest(pagenumber, 4, Direction.ASC, "price"));
        List<Product> stackProduct = pageProduct.getContent();
        int totalPage = pageProduct.getTotalPages();
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("listProduct", stackProduct);
        model.addAttribute("listAuction", auctionService.getAll());
        return "home";
    }
    @RequestMapping(value="/supplier")
    public String getSupplier(Model model,@RequestParam("supplierId")String supplierId){
    	Supplier supplier=supplierService.findOne(supplierId);
    	model.addAttribute("listProduct", productservice.findBySupplier(supplier));
    	model.addAttribute("message", "có " + productservice.findBySupplier(supplier).size() + " sản phẩm được tìm thấy");
    	return "resultSearch";
    }
    @RequestMapping(value = "/priceHightoLower")
    public String getPriceHigh(Model model){
    	TransactionType transactionType=transactionService.findByName("Sale");
    	model.addAttribute("listProduct", productservice.findByTransactionType(transactionType, new Sort(Direction.ASC, "price")));
    	return "resultSearch";
    }
//    @RequestMapping(value = "/filterpriceHightoLower")
//    public String filterPriceHigh(Model model,HttpServletRequest request){
//    	String name=request.getParameter("name");
//    	List<Product> products=productservice.findByNameContaining(name);
//    	TransactionType transactionType=transactionService.findByName("Sale");
//    	model.addAttribute("listProduct", productservice.findByTransactionType(products, transactionType, new Sort(Direction.ASC, "price")));
//    	return "resultSearch";
//    }
}

