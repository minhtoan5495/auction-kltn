package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;

import java.security.Principal;
import java.text.ParseException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CheckoutController {

	@Autowired
	UserService userService;

	@Autowired
	DistrictService districtService;

	@Autowired
	CityService cityService;

	@Autowired
	InvoiceService invoiceService;

	@Autowired
	ParentService parentService;

	@Autowired
	ProductService productService;
	@ModelAttribute("parents")
	public List<Parent> parent(){
		return parentService.findAll();
	}

	@RequestMapping(value = "/checkoutSuccess", method = RequestMethod.GET)
	public String checkoutSuccess() {
		return "checkoutSuccess";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkoutPage(Model model, Principal principal) throws UserNotFoundException, ParseException {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		model.addAttribute("district", districtService.getAll());
		model.addAttribute("city", cityService.getAll());
		model.addAttribute("user", user);
		model.addAttribute("shipping", new ShippingInfo());
		return "checkout";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkoutSuccess(Model model, @ModelAttribute("shipping") ShippingInfo shippingInfo,
								  HttpSession session,HttpServletRequest request)
			throws UserNotFoundException, ParseException {
		@SuppressWarnings("unchecked")
		List<CartItem> cartItems = (List<CartItem>) session.getAttribute("carts");
		for (CartItem cartItem : cartItems) {
			Product product = productService.findOne(cartItem.getProduct().getProductId());
			product.setStockQuantity(product.getStockQuantity() - cartItem.getQuantity());
			productService.save(product);
		}
		invoiceService.checkOut(shippingInfo, cartItems);
		model.addAttribute("invoice", shippingInfo.getInvoice());
		model.addAttribute("addShip", shippingInfo);
		session.removeAttribute("carts");
		return "checkoutSuccess";

	}
}
