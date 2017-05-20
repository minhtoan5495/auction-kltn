package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.exception.UserNotFoundException;

@Controller
public class AuctionController {
	@Autowired
	ProductService productService;

	@Autowired
	AuctionService auctionService;

	@Autowired
	UserService userService;

	@Autowired
	UserAuctionService userAuctionService;

	@Autowired
	InvoiceService invoiceService;

	@RequestMapping(value = "/addAuction")
	public String doAuction(Principal principal,
			HttpServletRequest request) throws UserNotFoundException, ParseException {
		String productId = request.getParameter("productId");
		Product product = productService.findOne(productId);
		Auction auction = auctionService.findByProduct(product);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		UserAuction userAuction = new UserAuction();
		userAuction.setAuction(auction);
		userAuction.setUser(user);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		userAuction.setBidtime(dateFormat.parse(dateFormat.format(date)));
		String price = request.getParameter("price");
		userAuction.setPrice(Float.parseFloat(price));
		userAuctionService.create(userAuction);
		return "redirect:/detail?productId=" + productId;
	}

	@RequestMapping(value = "/updateAuction")
	public void updateAuction(@RequestParam(value = "auctionId") String auctionId) throws ParseException {
		Auction auction = auctionService.findOne(auctionId);
		auctionService.update(auctionId, "KẾT THÚC ĐẤU GIÁ");
		invoiceService.addProductForUserWinInAuction(auction);
	}
}
