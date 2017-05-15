package hvcntt.org.shoppingweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.service.InvoiceService;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ManageInvoiceController {
	@Autowired
	InvoiceService invoiceService;
	@RequestMapping(value="/admin/manageInvoice")
	public String getAllInvoice(Model model){
		model.addAttribute("invoices", invoiceService.getAll());
		return "manageInvoice";
	}
	@RequestMapping(value="/admin/showDetailInvoice")
	public String showDetailInvoice(Model model,@RequestParam("invoiceId")String invoiceId){
		model.addAttribute("invoice", invoiceService.findOne(invoiceId));
		return "invoiceDetail";
	}
	@RequestMapping(value="/admin/deleteInvoice")
	public @ResponseBody String
	deleteInvoice(@RequestParam("invoiceId")String invoiceId){
		invoiceService.delete(invoiceId);
		return "Deleted invoice with id : " + invoiceId + " !!";
	}
}
