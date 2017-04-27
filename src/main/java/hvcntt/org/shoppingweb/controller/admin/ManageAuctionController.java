package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.dto.AuctionDto;
import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.service.AuctionService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;

@Controller
public class ManageAuctionController {
	@Autowired
	AuctionService auctionService;
	@Autowired
	ProductService productService;
	@Autowired 
	TransactionTypeService transactionTypeService;
	@RequestMapping(value="/admin/manageAuction")
	public String getAllAuction(Model model){
		model.addAttribute("auctions", auctionService.getAll());
		return "manageAuction";
	}
	@RequestMapping(value="/admin/addAuction",method=RequestMethod.GET)
	public String addAuction(Model model){
		TransactionType transactionType=transactionTypeService.findByName("Auction");
		model.addAttribute("products", productService.findByTransactionType(transactionType));
		model.addAttribute("auction", new AuctionDto());
		return "addAuction";
	}
	@RequestMapping(value="/admin/saveAuction",method=RequestMethod.POST)
	public String saveAuction(Model model,@ModelAttribute("auction")AuctionDto auctionDto) throws ParseException{
		auctionService.save(auctionDto);
		return "redirect:/admin/manageAuction";
	}
	@RequestMapping(value="/admin/deleteAuction",method=RequestMethod.GET)
	public void deleteAuction(Model model,@RequestParam("auctionId")String auctionId){
		auctionService.delete(auctionId);
	}
	@RequestMapping(value="/admin/updateAuction",method=RequestMethod.GET)
	public String editAuction(Model model,@RequestParam("auctionId")String auctionId){
		TransactionType transactionType=transactionTypeService.findByName("Auction");
		model.addAttribute("products", productService.findByTransactionType(transactionType));
		model.addAttribute("auctionDto", new AuctionDto());
		Auction auction=auctionService.findOne(auctionId);
		model.addAttribute("auction", auction);
		return "EditAuction";
	}
	@RequestMapping(value="/admin/updateAuction",method=RequestMethod.POST)
	public String updateAuction(Model model,@ModelAttribute("auctionDto")AuctionDto auctionDto,HttpServletRequest request) throws ParseException{
		String auctionId=request.getParameter("auctionId");
		auctionService.update(auctionDto, auctionId);
		return "redirect:/admin/manageAuction";
	}
}
