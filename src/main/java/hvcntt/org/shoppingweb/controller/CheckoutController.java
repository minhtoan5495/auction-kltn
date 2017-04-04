package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hvcntt.org.shoppingweb.model.ShippingInfor;
import hvcntt.org.shoppingweb.model.CartItem;
//import hvcntt.org.shoppingweb.model.Information;
import hvcntt.org.shoppingweb.model.Invoice_Detail;
import hvcntt.org.shoppingweb.model.User;
import hvcntt.org.shoppingweb.service.AddressShipService;
//import hvcntt.org.shoppingweb.service.InformationService;
import hvcntt.org.shoppingweb.service.PayMentService;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class CheckoutController {
	@Autowired
	UserService userService;
	@Autowired
	PayMentService payMentService;
	@Autowired
	AddressShipService addressService;
//	@Autowired
//	InformationService informationService;
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public String checkoutPage(Model model){
		return "checkout";
	}
	@RequestMapping(value="/checkout",method=RequestMethod.POST)
	public String checkouted(HttpSession session,Principal principal,HttpServletRequest request){
		String username=principal.getName();
		User user= userService.findByUsername(username);
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
//		String email=request.getParameter("email");
//		String age=request.getParameter("age");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String streetname=request.getParameter("streetname");
		String housenumber=request.getParameter("housenumber");
		String city=request.getParameter("city");
		String district=request.getParameter("district");
		User userShip = new User(firstname, lastname, phone, address);
		ShippingInfor addresShipping= new ShippingInfor(streetname, housenumber, city, district, user);
		addressService.create(addresShipping);
		userService.save(userShip);
		//informationService.create(information);
		@SuppressWarnings("unchecked")
		List<CartItem> cartItems= (List<CartItem>) session.getAttribute("cart");
		for(int i=0;i<cartItems.size();i++){
			Invoice_Detail payMents= new Invoice_Detail(cartItems.get(i).getQuantity()*cartItems.get(i).getProduct().getPrice(), cartItems.get(i).getQuantity(), new Date(), null, user, cartItems.get(i).getProduct());
			payMentService.create(payMents);
		}
		return "redirect:/home";
	}
}
 