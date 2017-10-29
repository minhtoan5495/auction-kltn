package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import hvcntt.org.shoppingweb.dao.dto.Constant;
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

import javax.servlet.http.HttpSession;

@Controller
public class ManageDiscountController {

    @Autowired
    DiscountService discountService;

    @Autowired
    ProductService productService;

    @Autowired
    TransactionTypeService transactionTypeService;

    @RequestMapping(value = "/admin/manageDiscount")
    public String getAllDiscount(Model model, HttpSession session) {
        if ("saveSuccess".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.SAVE_SUCCESSFULLY);
        }
        model.addAttribute("discounts", discountService.getAll());
        return "manageDiscount";
    }

    @RequestMapping(value = "/admin/addDiscount", method = RequestMethod.GET)
    public String addDiscount(@RequestParam(value = "message", required = false) String message, Model model) {
        if ("invalidForm".equals(message)) {
            model.addAttribute("error", Constant.ERROR_FORM);
        }
        if ("invalidDate".equals(message)) {
            model.addAttribute("error", Constant.INVALID_DATE);
        }
        TransactionType transactionType = transactionTypeService.findByName("Sale");
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.findByProductTransactionType(transactionType)));
        model.addAttribute("discount", new Discount());
        return "addDiscount";
    }

    @RequestMapping(value = "/admin/saveDiscount", method = RequestMethod.GET)
    public
    @ResponseBody
    String saveDiscount(@RequestParam("discountTitle") String discountTitle, @RequestParam("discountContent") String discountContent,
                        @RequestParam("discountPercent") int discountPercent, HttpSession session, @RequestParam("startDate") String startDate,
                        @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        if (formatStringToDate(endDate).before(new Date()) || formatStringToDate(endDate).before(formatStringToDate(startDate))) {
            return "invalidDate";
        }
        discountService.create(discountTitle, discountContent, discountPercent, startDate, endDate, productIds);
        return "saveSuccess";
    }

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("hh:mm - yyyy-MM-dd");
        return format.parse(date);
    }

    @RequestMapping(value = "/admin/multiselect")
    public String multiselect() {
        return "multiselect";
    }

    @RequestMapping(value = "/admin/deleteDiscount", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteDiscount(@RequestParam("discountId") String discountId) {
        discountService.deleteDiscount(discountId);
        return "Deleted discount with id " + discountId + " success !!";
    }

    @RequestMapping(value = "/admin/discountDetail", method = RequestMethod.GET)
    public String discountDetail(@RequestParam(value = "discountId") String discountId, Model model) {
        Discount discount = discountService.findByDiscountId(discountId);
        model.addAttribute("discount", discount);
        Set<String> productIdsSet = discount.getProducts().stream().map(Product::getProductId).collect(Collectors.toSet());
        List<Product> products = productIdsSet.stream().map(productService::findOne).collect(Collectors.toList());
        model.addAttribute("products", products);
        return "discountDetail";
    }

    @RequestMapping(value = "/admin/deleteProductInDiscount", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteProductInDiscount(@RequestParam(value = "productId") String productId, @RequestParam(value = "discountId") String discountId, Model model) {
        Discount discount = discountService.findByDiscountId(discountId);
        Set<Product> productSet = new HashSet<>();
        productSet.addAll(discount.getProducts());
        List<Product> products = productSet.stream().filter(product -> !productId.equals(product.getProductId())).collect(Collectors.toList());
        discount.setProducts(products);
        discountService.save(discount);
        return "success";
    }
}
