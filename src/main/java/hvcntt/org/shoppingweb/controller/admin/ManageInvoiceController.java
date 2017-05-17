package hvcntt.org.shoppingweb.controller.admin;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.InvoiceService;
import hvcntt.org.shoppingweb.service.UserService;

import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ManageInvoiceController {
	@Autowired
	InvoiceService invoiceService;
	@Autowired
	UserService userService;
	@RequestMapping(value="/admin/manageInvoice")
	public String getAllInvoice(Model model){
		model.addAttribute("invoices", invoiceService.findByOrderByCreateDateDesc());
		return "manageInvoice";
	}
	@RequestMapping(value="/admin/showDetailInvoice")
	public String showDetailInvoice(Model model,@RequestParam("invoiceId")String invoiceId,Principal principal) throws UserNotFoundException{
		Invoice invoice=invoiceService.findOne(invoiceId);
		model.addAttribute("invoice", invoiceService.findOne(invoiceId));
		model.addAttribute("user", userService.findByUsername(invoice.getUsername()));
		return "invoiceDetail";
	}
	@RequestMapping(value="/admin/deleteInvoice")
	public @ResponseBody String
	deleteInvoice(@RequestParam("invoiceId")String invoiceId){
		invoiceService.delete(invoiceId);
		return "Deleted invoice with id : " + invoiceId + " !!";
	}
}
