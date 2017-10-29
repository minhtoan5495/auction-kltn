package hvcntt.org.shoppingweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ParentService;
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
    ParentService parentService;

    @ModelAttribute("parents")
    public List<Parent> parent(){
        return parentService.findAll();
    }

    @Autowired
    ProductService productservice;

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/addCart", method = RequestMethod.GET)
    public String cartPage(@RequestParam("productId") String productId, HttpSession session) {
        Product product = productservice.findOne(productId);
        List<CartItem> cartItems = new ArrayList<>();
        if (session.getAttribute("carts") == null) {
            cartItems.add(new CartItem(1, product, product.getImages().get(0)));
            session.setAttribute("carts", cartItems);
        } else {
            cartItems = (List<CartItem>) session.getAttribute("carts");
            int index = isExist(productId, session);
            if (index == -1) {
                cartItems.add(new CartItem(1, product, product.getImages().get(0)));
            } else {
                int quantity = cartItems.get(index).getQuantity() + 1;
                if(quantity < product.getStockQuantity()){
                    cartItems.get(index).setQuantity(quantity);
                }else{
                    return "redirect:/viewCart";
                }
            }
            session.setAttribute("carts", cartItems);
        }
        session.setAttribute("cartAngular", JsonUtil.convertObjectToJson(cartItems));
        session.setAttribute("message","addCartSuccess");
        return "redirect:/home";
    }

    private int isExist(String productId, HttpSession session) {
        @SuppressWarnings("unchecked")
        List<CartItem> items = (List<CartItem>) session.getAttribute("carts");
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getProduct().getProductId().equals(productId)) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping(value = "/removeCart")
    public BaseResponse<?> removeItems(HttpSession session, @RequestParam("productId") String productId) {
        @SuppressWarnings("unchecked")
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("carts");
        int index = isExist(productId, session);
        cartItems.remove(index);
        session.setAttribute("cartAngular", JsonUtil.convertObjectToJson(cartItems));
        return new BaseResponse<>(null);
    }

    @RequestMapping(value = "/viewCart")
    public String viewCart(HttpSession session) {
        @SuppressWarnings({"unchecked", "unused"})
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("carts");
        if(cartItems == null){
            session.setAttribute("cartAngular", JsonUtil.convertObjectToJson(new ArrayList<>()));
        }else{
            session.setAttribute("cartAngular", JsonUtil.convertObjectToJson(cartItems));
        }
        return "cart";
    }

    @RequestMapping(value = "/updateCart")
    public BaseResponse<?> cartUpdate(@RequestParam("quantity") int quantity, @RequestParam("productId") String productId, Model model, HttpSession session) {
        @SuppressWarnings("unchecked")
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        int index = isExist(productId, session);
        carts.get(index).setQuantity(quantity);
        session.setAttribute("carts", carts);
        model.addAttribute("cartAngular", JsonUtil.convertObjectToJson(carts));
        return new BaseResponse<>(null);
    }
}