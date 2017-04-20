package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/cartShow", method = RequestMethod.GET)
    @ResponseBody
    public List<CartItem> cartPage(HttpSession session) {
        List<CartItem> items = (List<CartItem>) session.getAttribute("cart");
        return items;
    }
}
