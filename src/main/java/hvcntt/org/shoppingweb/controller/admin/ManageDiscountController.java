package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

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
    private DiscountService discountService;

    @Autowired
    private ProductService productService;

    @Autowired
    private TransactionTypeService transactionTypeService;

    @RequestMapping(value = "/admin/manageDiscount")
    public String getAllDiscount(Model model) {
        model.addAttribute("discounts", discountService.getAll());
        return "manageDiscount";
    }

    @RequestMapping(value = "/admin/addDiscount", method = RequestMethod.GET)
    public String addDiscount(Model model) {
        TransactionType transactionType = transactionTypeService.findByName("Sale");
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.findByProductTransactionType(transactionType)));
        model.addAttribute("discount", new Discount());
        return "addOrEditDiscount";
    }

    @RequestMapping(value = "/admin/saveDiscount", method = RequestMethod.GET)
    public void saveDiscount(@RequestParam("discountTitle") String discountTitle, @RequestParam("discountContent") String discountContent,
                             @RequestParam("discountPercent") int discountPercent, @RequestParam("startDate") String startDate,
                             @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        discountService.create(discountTitle, discountContent, discountPercent, startDate, endDate, productIds);
    }

    @RequestMapping(value = "admin/multiselect")
    public String multiselect() {
        return "multiselect";
    }
}
