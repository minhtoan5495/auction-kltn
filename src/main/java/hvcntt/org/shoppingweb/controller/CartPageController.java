package hvcntt.org.shoppingweb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ProductService;

@Controller
public class CartPageController {

	@Autowired
	private ProductService productservice;

	@RequestMapping(value="/cart")
	public String cartPage(@RequestParam("idproduct")String idproduct,Model model,HttpSession session){
		Product product = productservice.findOne(idproduct);
		if(session.getAttribute("cart") == null){
			List<CartItem> cartItem= new ArrayList<>();
			cartItem.add(new CartItem(1,product));
			session.setAttribute("cart", cartItem);
		}
		else{
			@SuppressWarnings("unchecked")
			List<CartItem> items= (List<CartItem>) session.getAttribute("cart");
			int index=isExist(idproduct, session);
			if(index==-1){
				items.add(new CartItem(1,product));
			}
			else{
				int quantity=items.get(index).getQuantity()+1;
				items.get(index).setQuantity(quantity);
			}
		}
		return "cart";
	}

	private int isExist(String idproduct,HttpSession session){
		@SuppressWarnings("unchecked")
		List<CartItem> items= (List<CartItem>) session.getAttribute("cart");
		for(int i=0;i<items.size();i++){
			if(items.get(i).getProduct().getIdproduct()==idproduct){
				return i;
			}
		}
		return -1;
	}
	@RequestMapping(value="/removeCart")
	public String removeItems(HttpSession session,@RequestParam("idproduct")String idproduct){
		@SuppressWarnings("unchecked")
		List<CartItem> cartItems= (List<CartItem>) session.getAttribute("cart");
		int index= isExist(idproduct, session);
		cartItems.remove(index);
		return "cart";
	}
	@RequestMapping(value="/viewcart")
	private String viewCart(HttpSession session){
		@SuppressWarnings({ "unchecked", "unused" })
		List<CartItem> listItems= (List<CartItem>) session.getAttribute("cart");
		return "cart";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String cartUpdate(HttpServletRequest request, HttpSession session){
		@SuppressWarnings("unchecked")
		List<CartItem> carts = (List<CartItem>)session.getAttribute("cart");
		String []quantity = request.getParameterValues("quantity");
		for(int i = 0; i < carts.size(); i++){
			carts.get(i).setQuantity(Integer.parseInt(quantity[i]));
		}
		session.setAttribute("cart", carts);
		return "cart";
	}
}
