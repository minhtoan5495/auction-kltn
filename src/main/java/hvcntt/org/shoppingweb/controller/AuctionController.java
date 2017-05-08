package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.entity.UserAuction;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.AuctionService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;
import hvcntt.org.shoppingweb.service.UserAuctionService;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class AuctionController {
	@Autowired
	ProductService productService;

	@Autowired
	AuctionService auctionService;

	@Autowired
	UserService userService;

	@Autowired
	TransactionTypeService transactionTypeService;

	@Autowired
	UserAuctionService userAuctionService;

	@RequestMapping(value = "/addAuction")
	public String doAuction(Model model, Principal principal,
			HttpServletRequest request) throws UserNotFoundException, ParseException {
		String productId = request.getParameter("productId");
		Product product = productService.findOne(productId);
		Auction auction = auctionService.findByProduct(product);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		UserAuction userAuction = new UserAuction();
		userAuction.setAuction(auction);
		userAuction.setUser(user);
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String bidtime = sdf.format(c.getTime());
		userAuction.setBidtime(sdf.parse(bidtime));
		String price = request.getParameter("price");
		userAuction.setPrice(Double.parseDouble(price));
		userAuctionService.create(userAuction);
		return "redirect:/detail?idproduct=" + productId;

	}
}
