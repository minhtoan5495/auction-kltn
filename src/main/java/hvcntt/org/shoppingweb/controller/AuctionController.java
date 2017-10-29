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

import hvcntt.org.shoppingweb.dao.dto.AuctionStatus;
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
	AuctionService auctionService;

	@Autowired
	InvoiceService invoiceService;

	@RequestMapping(value = "/addAuction")
	public String doAuction(Principal principal,
			HttpServletRequest request) throws UserNotFoundException, ParseException {
		auctionService.addAuction(request, principal);
		return "redirect:/detail?productId=" + request.getParameter("productId");
	}

	@RequestMapping(value = "/updateAuction")
	public void updateAuction(@RequestParam(value = "auctionId") String auctionId) throws ParseException {
		Auction auction = auctionService.findOne(auctionId);
		auctionService.update(auctionId, AuctionStatus.ENDED);
		invoiceService.addProductForUserWinInAuction(auction);
	}
}
