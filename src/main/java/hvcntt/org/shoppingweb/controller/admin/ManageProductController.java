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
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    public String getAllProduct(Model model, HttpSession session, HttpServletRequest request) {
        if ("saveProductSale".equals(session.getAttribute("message"))) {
            model.addAttribute("message", "Saved product successfully !!");
            session.removeAttribute("message");
        }
        if ("updateProduct".equals(session.getAttribute("message"))) {
            model.addAttribute("message", "Updated product with id : " + request.getParameter("productId") + " !!");
            session.removeAttribute("message");
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
    public String addProduct(Model model, HttpSession session) {
        if("invalidName".equals(session.getAttribute("error"))){
            model.addAttribute("error","Name of product is exist !!");
        }
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
        Product product = productservice.findOne(productId);
        model.addAttribute("product", product);
        Set<Image> images = new HashSet<>();
        images.addAll(product.getImages());
        model.addAttribute("images",new ArrayList<>(images));
        return "editProduct";
    }

    @RequestMapping(value = "/admin/saveProduct", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute(value = "productDto") ProductDto productDto, HttpSession session) throws ParseException {
        if(productservice.findByName(productDto.getName()) != null){
            session.setAttribute("error","invalidName");
            return "redirect:/admin/addProduct";
        }
        productservice.save(productDto);
        TransactionType transactionType = transactionTypeService.findById(productDto.getTransactionTypeId());
        if (transactionType.getTransactionTypeName().equals("Sale")) {
            session.setAttribute("message", "saveProductSale");
            return "redirect:/admin/manageProduct";
        } else {
            session.setAttribute("message", "requiredAuction");
            return "redirect:/admin/addAuction";
        }

    }

    @RequestMapping(value = "/admin/updateProduct", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute(value = "productDto") ProductDto productDto, HttpSession session, HttpServletRequest request) throws ParseException {
        String productId = request.getParameter("productId");
        String description = request.getParameter("description");
        productDto.setDescription(description);
        productservice.update(productDto, productId);
        session.setAttribute("message", "updateSuccess");
        return "redirect:/admin/manageProduct?productId=" + productDto.getName();
    }

    @RequestMapping(value = "/admin/getCategoryByParent", method = RequestMethod.GET)
    public @ResponseBody
    List<Category> getCategoryByParent(@RequestParam(value = "parentId") String parentId) {
        Parent parent = parentService.findById(parentId);
        List<Category> categories = categoryService.findByParent(parent);
        return categories;
    }
}
