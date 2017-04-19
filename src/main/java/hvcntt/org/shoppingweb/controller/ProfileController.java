package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
//import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
//import hvcntt.org.shoppingweb.dao.entity.InvoiceStatus;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	InvoiceDetailService invoiceDetailService;
	@Autowired
	private UserService userService;
	@Autowired
	InvoiceStatusService invoiceStatusService;
	@RequestMapping(value="/profile")
	public String profile(Model model,Principal principal) throws UserNotFoundException {
		String username=principal.getName();
		model.addAttribute("user", userService.findByUsername(username));
		model.addAttribute("invoice", invoiceService.getAll());
		return "profile";
	}
	@RequestMapping(value="/orderdetail")
	public String getOrderDetail(Model model,@RequestParam("invoiceId")String invoiceId,Principal principal) throws UserNotFoundException{
		Invoice invoice=invoiceService.findOne(invoiceId);
		String username=principal.getName();
		model.addAttribute("user", userService.findByUsername(username));
		model.addAttribute("invoice", invoiceService.getAll());
		model.addAttribute("invoices",invoice );
		return "orderdetail";
	}
	@RequestMapping("/cancelOrder")
	public String cancelOrder(@RequestParam("invoiceId")String invoiceId){
		Invoice invoice=invoiceService.findOne(invoiceId);
		invoice.setInvoiceStatus(invoiceStatusService.findByName("Đã hủy đơn hàng"));
		invoiceService.save(invoice);
		return "redirect:/orderdetail?invoiceId="+invoiceId;
	}
}
