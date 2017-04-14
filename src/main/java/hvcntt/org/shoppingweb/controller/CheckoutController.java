package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.entity.InvoiceDetail;
import hvcntt.org.shoppingweb.dao.entity.InvoiceStatus;
import hvcntt.org.shoppingweb.dao.entity.ShippingInfo;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hvcntt.org.shoppingweb.service.CityService;
import hvcntt.org.shoppingweb.service.DistrictService;
import hvcntt.org.shoppingweb.service.InvoiceDetailService;
import hvcntt.org.shoppingweb.service.InvoiceService;
import hvcntt.org.shoppingweb.service.InvoiceStatusService;
import hvcntt.org.shoppingweb.service.ShippingInfoService;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class CheckoutController {

    @Autowired
    private UserService userService;
    @Autowired
    private InvoiceStatusService invoiceStatusService;
    @Autowired
    private InvoiceDetailService invoiceDetailService;
    @Autowired
    private DistrictService districtService;
    @Autowired
    private CityService cityService;
    @Autowired
    ShippingInfoService shippingService;
    @Autowired
    InvoiceService invoiceService;
    @RequestMapping(value = "/checkoutsuccess", method = RequestMethod.GET)
    public String checkoutSuccess(Model model) {
        return "checkoutsuccess";
    }
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkoutPage(Model model,Principal principal) throws UserNotFoundException, ParseException{
    	model.addAttribute("district", districtService.getAll());
    	model.addAttribute("city", cityService.getAll());
    	model.addAttribute("shipping", new ShippingInfo());
        return "checkout";
    }
    @RequestMapping(value="/checkout",method=RequestMethod.POST)
    public String checkoutSuccess(Model model,@ModelAttribute("shipping")ShippingInfo shippingInfo,Principal principal,HttpSession session,HttpServletRequest request) throws UserNotFoundException{
    	String username=principal.getName();
    	User user= userService.findByUsername(username);
    	Invoice invoice=new Invoice();
    	InvoiceStatus invoiceStatus=invoiceStatusService.findByName("Đang xử lý");
    	invoice.setCreateDate(new Date());
    	invoice.setInvoiceStatus(invoiceStatus);
    	invoice.setShipDate(null);
    	invoice.setUsername(user.getUsername());
    	shippingInfo.setInvoice(invoice);
    	invoiceService.create(invoice);
    	shippingService.create(shippingInfo);
    	@SuppressWarnings("unchecked")
		List<CartItem> listCartItems=(List<CartItem>) session.getAttribute("cart");
    	for(int i=0;i<listCartItems.size();i++){
    		InvoiceDetail invoiceDetail=new InvoiceDetail(listCartItems.get(i).getProduct().getPrice()*listCartItems.get(i).getQuantity(), listCartItems.get(i).getQuantity(), shippingInfo.getInvoice(), listCartItems.get(i).getProduct());
    		invoiceDetailService.add(invoiceDetail);
    	}
    	model.addAttribute("addShip", shippingInfo);
    	return "checkoutsuccess";
    	
    }
}
 