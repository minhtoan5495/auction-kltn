package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.dto.ProductDto;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.exception.ProductNotFoundException;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

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

    @Autowired
    ParentService parentService;

    @RequestMapping(value = "/admin/manageProduct", method = RequestMethod.GET)
    public String getAllProduct(Model model, @RequestParam(value = "message", required = false) String message, HttpServletRequest request) {
        if ("saveProductSale".equals(message)) {
            model.addAttribute("message", "Saved product successfully !!");
        }
        if ("updateProduct".equals(message)) {
            model.addAttribute("message", "Updated product with id : " + request.getParameter("productId") + " !!");
        }
        model.addAttribute("products", productservice.getAll());
        return "manageProduct";
    }

    @RequestMapping(value = "/admin/deleteProduct", method = RequestMethod.GET)
    public @ResponseBody
    String deleteProduct(@RequestParam(value = "productId") String productId) throws ProductNotFoundException {
        productservice.deleteProduct(productId);
        return "Deleted product with id : " + productId + " !!";
    }

    @RequestMapping(value = "/admin/addProduct", method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("productDto", new ProductDto());
        model.addAttribute("transactionTypes", transactionTypeService.getAll());
        model.addAttribute("suppliers", supplierService.getAll());
        model.addAttribute("parents", parentService.findAll());
        return "addProduct";
    }

    @RequestMapping(value = "/admin/editProduct", method = RequestMethod.GET)
    public String editProduct(@RequestParam(value = "productId") String productId, Model model) {
        model.addAttribute("productDto", new ProductDto());
        model.addAttribute("transactionTypes", transactionTypeService.getAll());
        model.addAttribute("suppliers", supplierService.getAll());
        model.addAttribute("categories", categoryService.getAll());
        model.addAttribute("product", productservice.findOne(productId));
        return "editProduct";
    }

    @RequestMapping(value = "/admin/saveProduct", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute(value = "productDto") ProductDto productDto) throws ParseException {
        productservice.save(productDto);
        TransactionType transactionType = transactionTypeService.findById(productDto.getTransactionTypeId());
        if (transactionType.getTransactionTypeName().equals("Sale")) {
            return "redirect:/admin/manageProduct?message=saveProductSale";
        } else {
            return "redirect:/admin/addAuction?message=requiredAuction";
        }

    }

    @RequestMapping(value = "/admin/updateProduct", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute(value = "productDto") ProductDto productDto, HttpServletRequest request) throws ParseException {
        String productId = request.getParameter("productId");
        productservice.update(productDto, productId);
        return "redirect:/admin/manageProduct?message=updateSuccess&productId=" + productDto.getName();
    }

    @RequestMapping(value = "/admin/getCategoryByParent", method = RequestMethod.GET)
    public @ResponseBody
    List<Category> getCategoryByParent(@RequestParam(value = "parentId") String parentId) {
        Parent parent = parentService.findById(parentId);
        List<Category> categories = categoryService.findByParent(parent);
        return categories;
    }
}
