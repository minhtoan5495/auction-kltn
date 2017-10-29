package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.service.ParentService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ParentService parentService;

    @Autowired
    ProductService productService;

    @Autowired
    TransactionTypeService transactionTypeService;

    @ModelAttribute("parents")
    public List<Parent> parent() {
        return parentService.findAll();
    }

    @RequestMapping(value = "/productByCategory/{categoryId}", method = RequestMethod.GET)
    public String findProductByCategory(@PathVariable String categoryId, Model model){
        List<Product> products = productService.findByCategory(categoryId);
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("resultList", products);
        return "resultSearch";
    }

    @RequestMapping(value = "/productByTypeAuction", method = RequestMethod.GET)
    public String productByTypeAuction(Model model){
        TransactionType transactionType = transactionTypeService.findByName("Auction");
        List<Product> products = productService.findByProductTransactionType(transactionType);
        model.addAttribute("resultList", products);
        Date currentDate=new Date();
        model.addAttribute("currentDate", currentDate);
        return "resultSearch";
    }
}
