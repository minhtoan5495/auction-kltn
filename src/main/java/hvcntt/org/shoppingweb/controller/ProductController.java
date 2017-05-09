package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by toannguyen on 09/05/2017.
 */
@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/productByCategory", method = RequestMethod.GET)
    public String findProductByCategory(@RequestParam(value = "categoryId") String categoryId, Model model){
        List<Product> products = productService.findByCategory(categoryId);
        model.addAttribute("products", products);
        return "resultSearch";
    }
}
