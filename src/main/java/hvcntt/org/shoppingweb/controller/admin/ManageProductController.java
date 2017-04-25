package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.dto.ProductDto;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.exception.ProductNotFoundException;
import hvcntt.org.shoppingweb.service.CategoryService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.SupplierService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;

/**
 * Created by toannguyen on 25/04/2017.
 */
@Controller
public class ManageProductController {

    @Autowired
    ProductService productservice;

    @Autowired
    TransactionTypeService transactionTypeService;

    @Autowired
    SupplierService supplierService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/admin/manageProduct", method = RequestMethod.GET)
    public String getAllProduct(Model model){
        model.addAttribute("products", productservice.getAll());
        return "manageProduct";
    }

    @RequestMapping(value = "/admin/deleteProduct", method = RequestMethod.GET)
    public void deleteProduct(@RequestParam(value = "productId") String productId) throws ProductNotFoundException {
        productservice.deleteProduct(productId);
    }

    @RequestMapping(value = "/admin/addProduct", method = RequestMethod.GET)
    public String addProduct(Model model){
        model.addAttribute("productDto", new ProductDto());
        model.addAttribute("transactionTypes", transactionTypeService.getAll());
        model.addAttribute("suppliers", supplierService.getAll());
        model.addAttribute("categories", categoryService.getAll());
        return "addOrEditProduct";
    }

    @RequestMapping(value = "/admin/saveProduct", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute(value = "productDto") ProductDto productDto) throws ParseException {
        productservice.save(productDto);
        return "redirect:/admin/manageProduct";
    }
}
