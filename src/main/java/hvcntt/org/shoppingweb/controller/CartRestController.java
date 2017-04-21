package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by toannguyen on 19/04/2017.
 */
@RestController
public class CartRestController {

//    @SuppressWarnings("unchecked")
//    @RequestMapping(value = "/cartShow", method = RequestMethod.GET)
//    public String cartPage(Model model, HttpSession session) {
//        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
//        List<Product> products = new ArrayList<>();
//        for (CartItem cartItem: items) {
//
//        }
//        model.addAttribute("carts", JsonUtil.convertObjectToJson(items));
//        return "cart";
//    }
}
