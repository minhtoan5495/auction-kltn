package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;

import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hvcntt.org.shoppingweb.dao.dto.DiscountDto;
import hvcntt.org.shoppingweb.dao.entity.Discount;
import hvcntt.org.shoppingweb.service.DiscountService;

@Controller
public class ManageDiscountController {
    @Autowired
    private DiscountService discountService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/admin/manageDiscount")
    public String getAllDiscount(Model model) {
        model.addAttribute("discounts", discountService.getAll());
        return "manageDiscount";
    }

    @RequestMapping(value = "/admin/addDiscount", method = RequestMethod.GET)
    public String addDiscount(Model model) {
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.getAll()));
        model.addAttribute("discount", new Discount());
        return "addOrEditDiscount";
    }

    @RequestMapping(value = "/admin/saveDiscount", method = RequestMethod.POST)
    public String saveDiscount(Model model, @ModelAttribute("discount") DiscountDto discountDto) throws ParseException {
        discountService.create(discountDto);
        return "redirect:/admin/manageDiscount";
    }

    @RequestMapping(value="admin/multiselect")
    public String multiselect(){
        return "multiselect";
    }
}
