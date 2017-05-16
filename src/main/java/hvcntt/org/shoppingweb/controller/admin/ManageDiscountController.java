package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;
import java.util.*;

import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;
import hvcntt.org.shoppingweb.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hvcntt.org.shoppingweb.dao.dto.DiscountDto;
import hvcntt.org.shoppingweb.dao.entity.Discount;
import hvcntt.org.shoppingweb.service.DiscountService;

@Controller
public class ManageDiscountController {
    @Autowired
    DiscountService discountService;

    @Autowired
    ProductService productService;

    @Autowired
    TransactionTypeService transactionTypeService;

    @RequestMapping(value = "/admin/manageDiscount")
    public String getAllDiscount(Model model, @RequestParam(value = "message", required = false) String message) {
        if ("saveSuccess".equals(message)) {
            model.addAttribute("message", "Saved auction successfully !!");
        }
        model.addAttribute("discounts", discountService.getAll());
        return "manageDiscount";
    }

    @RequestMapping(value = "/admin/addDiscount", method = RequestMethod.GET)
    public String addDiscount(Model model) {
        TransactionType transactionType = transactionTypeService.findByName("Sale");
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.findByProductTransactionType(transactionType)));
        model.addAttribute("discount", new Discount());
        return "addDiscount";
    }

    @RequestMapping(value = "/admin/saveDiscount", method = RequestMethod.GET)
    public @ResponseBody String saveDiscount(@RequestParam("discountTitle") String discountTitle, @RequestParam("discountContent") String discountContent,
                             @RequestParam("discountPercent") int discountPercent, @RequestParam("startDate") String startDate,
                             @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        discountService.create(discountTitle, discountContent, discountPercent, startDate, endDate, productIds);
        return "saveSuccess";
    }

    @RequestMapping(value = "/admin/multiselect")
    public String multiselect() {
        return "multiselect";
    }

    @RequestMapping(value="/admin/deleteDiscount", method = RequestMethod.GET)
    public @ResponseBody String deleteDiscount(@RequestParam("discountId") String discountId){
        discountService.deleteDiscount(discountId);
        return "Deleted discount with id " + discountId + " success !!";
    }
//
//    @RequestMapping(value = "/admin/updateDiscount", method = RequestMethod.GET)
//    public @ResponseBody String updateDiscount(@RequestParam("discountId") String discountId, @RequestParam("discountTitle") String discountTitle, @RequestParam("discountContent") String discountContent,
//                               @RequestParam("discountPercent") int discountPercent) throws ParseException {
//        discountService.update(discountTitle, discountContent, discountPercent, discountId);
//        return "Updated discount with id " + discountId + " success !!";
//    }

    @RequestMapping(value = "/admin/discountDetail", method = RequestMethod.GET)
    public String discountDetail(@RequestParam(value = "discountId") String discountId, Model model){
        Discount discount = discountService.findByDiscountId(discountId);
        model.addAttribute("discount", discount);
        Set<String> productIdsSet = new HashSet<>();
        for(Product product : discount.getProducts()){
            productIdsSet.add(product.getProductId());
        }
        List<Product> products = new ArrayList<>();
        for(String productId : productIdsSet){
            products.add(productService.findOne(productId));
        }
        model.addAttribute("products", products);
        return "discountDetail";
    }

    @RequestMapping(value = "/admin/deleteProductInDiscount", method = RequestMethod.GET)
    public @ResponseBody String deleteProductInDiscount(@RequestParam(value = "productId") String productId, @RequestParam(value = "discountId") String discountId, Model model){
        Discount discount = discountService.findByDiscountId(discountId);
        Set<Product> productSet = new HashSet<>();
        productSet.addAll(discount.getProducts());
        List<Product> products = new ArrayList<>();
        for(Product product : productSet){
            if(!productId.equals(product.getProductId())){
                products.add(product);
            }
        }
        discount.setProducts(products);
        discountService.save(discount);
        return "success";
    }
}
