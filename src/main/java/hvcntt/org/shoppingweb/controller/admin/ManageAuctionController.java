package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

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
    public String getAllAuction(Model model, HttpSession session) {
        if ("saveSuccess".equals(session.getAttribute("message"))) {
            model.addAttribute("message", "Saved auction successfully !!");
            session.removeAttribute("message");
        }
        List<Auction> auctions = auctionService.getAll();
        model.addAttribute("auctions", auctions);
        return "manageAuction";
    }

    @RequestMapping(value = "/admin/addAuction", method = RequestMethod.GET)
    public String addAuction(HttpSession session, Model model) {
        if ("requiredAuction".equals(session.getAttribute("message"))) {
            model.addAttribute("message", "Let's create the auction for product that you're just created !!");
            session.removeAttribute("message");
        }
        if ("invalidForm".equals(session.getAttribute("error"))) {
            model.addAttribute("error", "All field is required !!");
            session.removeAttribute("error");

        }
        if ("invalidDate".equals(session.getAttribute("error"))) {
            model.addAttribute("error", "The start date can't less than today and the end date can't great than the start date !!");
            session.removeAttribute("error");
        }
        TransactionType transactionType = transactionTypeService.findByName("Auction");
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.findByTransactionType(transactionType)));
        model.addAttribute("auction", new AuctionDto());
        return "addAuction";
    }

    @RequestMapping(value = "/admin/saveAuction", method = RequestMethod.GET)
    public @ResponseBody
    String saveAuction(@RequestParam("startDate") String startDate,
                       @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        if (formatStringToDate(startDate).before(new Date()) || formatStringToDate(endDate).before(formatStringToDate(startDate))){
            return "invalidDate";
        }
        auctionService.save(startDate, endDate, productIds);
        return "saveSuccess";
    }

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("hh:mm - yyyy-MM-dd");
        return format.parse(date);
    }

    @RequestMapping(value = "/admin/deleteAuction", method = RequestMethod.GET)
    public @ResponseBody
    String deleteAuction(@RequestParam("auctionId") String auctionId) {
        auctionService.delete(auctionId);
        return "Deleted auction with id " + auctionId + " success !!";
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
    public String updateAuction(HttpServletRequest request, HttpSession session) throws ParseException {
        String auctionStatus = request.getParameter("auctionStatus");
        String auctionId = request.getParameter("auctionId");
        auctionService.update(auctionId, auctionStatus);
        session.setAttribute("message","saveSuccess");
        return "redirect:/admin/manageAuction";
    }
}