package hvcntt.org.shoppingweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.utils.BaseResponse;
import hvcntt.org.shoppingweb.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.service.ProductService;

@Controller
public class CartPageController {

    @Autowired
    private ProductService productservice;

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/addCart", method = RequestMethod.GET)
    public String cartPage(@RequestParam("idproduct") String idproduct, Model model, HttpSession session) {
        Product product = productservice.findOne(idproduct);
        List<CartItem> items = new ArrayList<>();
        if (session.getAttribute("cart") == null) {
            items.add(new CartItem(1, product));
            session.setAttribute("cart", items);
        } else {
            items = (List<CartItem>) session.getAttribute("cart");
            int index = isExist(idproduct, session);
            if (index == -1) {
                items.add(new CartItem(1, product));
            } else {
                int quantity = items.get(index).getQuantity() + 1;
                items.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", items);
        }
        model.addAttribute("carts", JsonUtil.convertObjectToJson(items));
        return "cart";
    }

    private int isExist(String idproduct, HttpSession session) {
        @SuppressWarnings("unchecked")
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getProduct().getProductId().equals(idproduct)) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping(value = "/removeCart", method = RequestMethod.POST)
    public void removeItems(HttpSession session, Model model, @RequestBody String productId) {
        @SuppressWarnings("unchecked")
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
        int index = isExist(productId, session);
        cartItems.remove(index);
        model.addAttribute("carts", JsonUtil.convertObjectToJson(cartItems));
    }

    @RequestMapping(value = "/viewcart")
    private String viewCart(HttpSession session, Model model) {
        @SuppressWarnings({"unchecked", "unused"})
        List<CartItem> listItems = (List<CartItem>) session.getAttribute("cart");
        model.addAttribute("carts", JsonUtil.convertObjectToJson(listItems));
        return "cart";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void cartUpdate(@RequestBody String quantity, Model model, HttpSession session) {
        @SuppressWarnings("unchecked")
        List<CartItem> carts = (List<CartItem>) session.getAttribute("cart");
        for (int i = 0; i < carts.size(); i++) {
            carts.get(i).setQuantity(Integer.parseInt(quantity));
        }
        session.setAttribute("cart", carts);
        model.addAttribute("carts", JsonUtil.convertObjectToJson(carts));
    }
}
