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
    DiscountService discountService;

    @Autowired
    ProductService productService;

    @Autowired
    TransactionTypeService transactionTypeService;

    @RequestMapping(value = "/admin/manageDiscount")
    public String getAllDiscount(Model model) {
        model.addAttribute("discounts", JsonUtil.convertObjectToJson(discountService.getAll()));
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
    public String saveDiscount(@RequestParam("discountTitle") String discountTitle, @RequestParam("discountContent") String discountContent,
                             @RequestParam("discountPercent") int discountPercent, @RequestParam("startDate") String startDate,
                             @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        discountService.create(discountTitle, discountContent, discountPercent, startDate, endDate, productIds);
        return "redirect:/admin/manageDiscount";
    }

    @RequestMapping(value = "/admin/multiselect")
    public String multiselect() {
        return "multiselect";
    }

    @RequestMapping(value="/admin/deleteDiscount", method = RequestMethod.GET)
    public void deleteDiscount(@RequestParam("discountId") String discountId){
        discountService.deleteDiscount(discountId);
    }

    @RequestMapping(value = "/admin/updateDiscount", method = RequestMethod.GET)
    public void updateDiscount(@RequestParam("discountId") String discountId, @RequestParam("discountTitle") String discountTitle, @RequestParam("discountContent") String discountContent,
                               @RequestParam("discountPercent") int discountPercent) throws ParseException {
        discountService.update(discountTitle, discountContent, discountPercent, discountId);
    }
}
