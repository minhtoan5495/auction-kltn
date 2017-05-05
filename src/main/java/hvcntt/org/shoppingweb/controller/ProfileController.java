package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
//import java.util.List;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.entity.User;
//import hvcntt.org.shoppingweb.dao.entity.InvoiceStatus;
import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.service.InvoiceDetailService;
import hvcntt.org.shoppingweb.service.InvoiceService;
import hvcntt.org.shoppingweb.service.InvoiceStatusService;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class ProfileController {
    @Autowired
    InvoiceService invoiceService;
    @Autowired
    UserService userService;
    @Autowired
    InvoiceStatusService invoiceStatusService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @RequestMapping(value = "/profile")
    public String profile(Model model, Principal principal) throws UserNotFoundException {
        String username = principal.getName();
        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("invoices", invoiceService.getAll());
        model.addAttribute("ordered", invoiceService.findByUsername(username));
        return "profile";
    }

    @RequestMapping(value = "/orderDetail")
    public String getOrderDetail(Model model, @RequestParam("invoiceId") String invoiceId, Principal principal) throws UserNotFoundException {
        Invoice invoice = invoiceService.findOne(invoiceId);
        String username = principal.getName();
        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("invoice", invoiceService.getAll());
        model.addAttribute("invoices", invoice);
        return "orderDetail";
    }

    @RequestMapping("/cancelOrder")
    public String cancelOrder(@RequestParam("invoiceId") String invoiceId) throws InvoiceStatusNotFoundException {
        Invoice invoice = invoiceService.findOne(invoiceId);
        invoice.setInvoiceStatus(invoiceStatusService.findByName("Đã hủy đơn hàng"));
        invoiceService.save(invoice);
        return "redirect:/orderDetail?invoiceId=" + invoiceId;
    }
    @RequestMapping(value="/resetPassword",method=RequestMethod.GET)
    public String resetPassword(Model model,Principal principal) throws UserNotFoundException{
    	String username=principal.getName();
    	User user=userService.findByUsername(username);
    	model.addAttribute("model", user);
    	return "resetPassword";
    }
    @RequestMapping(value="/resetPassword",method=RequestMethod.POST)
    public String resetPassword(Principal principal,UserDto userDto) throws UserNotFoundException{
    	userService.resetPassword(userDto);
    	return "redirect:/home";
    }
}
