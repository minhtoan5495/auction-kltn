package hvcntt.org.shoppingweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.service.AuctionService;

@Controller
public class ManageAuctionController {
	@Autowired
	AuctionService auctionService;
	@RequestMapping(value="/admin/manageAuction")
	public String getAllAuction(Model model){
		model.addAttribute("auctions", auctionService.getAll());
		return "manageAuction";
	}
	@RequestMapping(value="/admin/addAuction",method=RequestMethod.GET)
	public String addAuction(Model model){
		model.addAttribute("auction", new Auction());
		return "manageAuction";
	}
	@RequestMapping(value="/admin/saveAuction",method=RequestMethod.POST)
	public String saveAuction(Model model,@ModelAttribute("auction")Auction auction){
		auctionService.create(auction);
		return "redirect:/admin/manageAuction";
	}
}
