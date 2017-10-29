package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.dto.AuctionStatus;
import hvcntt.org.shoppingweb.dao.dto.Constant;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.UserAuctionService;
import hvcntt.org.shoppingweb.utils.Helper;
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

    @Autowired
    UserAuctionService userAuctionService;

    @RequestMapping(value = "/admin/manageAuction")
    public String getAllAuction(Model model, @RequestParam(value = "message", required = false) String message) {
        if ("saveSuccess".equals(message)) {
            model.addAttribute("message", Constant.SAVE_SUCCESSFULLY);
        }
        List<Auction> auctions = auctionService.getAll();
        model.addAttribute("auctions", auctions);
        return "manageAuction";
    }

    @RequestMapping(value = "/admin/addAuction", method = RequestMethod.GET)
    public String addAuction(HttpSession session, Model model, @RequestParam(value = "message", required = false) String message) {
        if ("requiredAuction".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.MUST_CREATE_AUCTION);
            session.removeAttribute("message");
        }
        if ("invalidForm".equals(session.getAttribute("error"))) {
            model.addAttribute("error", Constant.ERROR_FORM);
            session.removeAttribute("error");

        }
        if ("invalidDate".equals(message)) {
            model.addAttribute("error", Constant.INVALID_DATE);
        }
        TransactionType transactionType = transactionTypeService.findByName("Auction");
        model.addAttribute("products", JsonUtil.convertObjectToJson(productService.findByTransactionType(transactionType)));
        model.addAttribute("auction", new AuctionDto());
        return "addAuction";
    }

    @RequestMapping(value = "/admin/saveAuction", method = RequestMethod.GET)
    public
    @ResponseBody
    String saveAuction(@RequestParam("startDate") String startDate,
                       @RequestParam("endDate") String endDate, @RequestParam("productIds") List<String> productIds) throws ParseException {
        if (formatStringToDate(endDate).getTime() < (new Date().getTime()) || formatStringToDate(endDate).getTime() < (formatStringToDate(startDate).getTime())) {
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
    public
    @ResponseBody
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
        AuctionStatus auctionStatus = Helper.getAuctionStatus(request.getParameter("auctionStatus"));
        String auctionId = request.getParameter("auctionId");
        auctionService.update(auctionId, auctionStatus);
        session.setAttribute("message", "saveSuccess");
        return "redirect:/admin/manageAuction";
    }

    @RequestMapping(value = "/admin/showAuctionDetail", method = RequestMethod.GET)
    public String showAuctionDetail(@RequestParam(name = "auctionId") String auctionId, Model model) {
        model.addAttribute("userAuctions", userAuctionService.findByAuctionId(auctionId));
        return "showAuctionDetail";
    }
}