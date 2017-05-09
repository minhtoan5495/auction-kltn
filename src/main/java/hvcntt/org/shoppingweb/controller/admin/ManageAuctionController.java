package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.utils.JsonUtil;
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

    @RequestMapping(value = "/admin/manageAuction")
    public String getAllAuction(Model model) {
        model.addAttribute("auctions", JsonUtil.convertObjectToJson(auctionService.getAll()));
        return "manageAuction";
    }

    @RequestMapping(value = "/admin/addAuction", method = RequestMethod.GET)
    public String addAuction(Model model) {
        TransactionType transactionType = transactionTypeService.findByName("Auction");
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.findByTransactionType(transactionType)));
        model.addAttribute("auction", new AuctionDto());
        return "addAuction";
    }

    @RequestMapping(value = "/admin/saveAuction", method = RequestMethod.GET)
    public String saveAuction(@RequestParam("startDate") String startDate,
                              @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        auctionService.save(startDate, endDate, productIds);
        return "redirect:/admin/manageAuction";
    }

    @RequestMapping(value = "/admin/deleteAuction", method = RequestMethod.GET)
    public void deleteAuction(@RequestParam("auctionId") String auctionId) {
        auctionService.delete(auctionId);
    }

    @RequestMapping(value = "/admin/updateAuction", method = RequestMethod.GET)
    public String editAuction(Model model, @RequestParam("auctionId") String auctionId) {
        TransactionType transactionType = transactionTypeService.findByName("Auction");
        model.addAttribute("products", productService.findByTransactionType(transactionType));
        model.addAttribute("auctionDto", new AuctionDto());
        Auction auction = auctionService.findOne(auctionId);
        model.addAttribute("auction", auction);
        return "editAuction";
    }

    @RequestMapping(value = "/admin/updateAuction", method = RequestMethod.POST)
    public String updateAuction(@ModelAttribute("auctionDto") AuctionDto auctionDto, HttpServletRequest request) throws ParseException {
        String auctionId = request.getParameter("auctionId");
        auctionService.update(auctionDto, auctionId);
        return "redirect:/admin/manageAuction";
    }
}
