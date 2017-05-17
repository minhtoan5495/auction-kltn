package hvcntt.org.shoppingweb.controller.admin;

import java.security.Principal;
import java.text.ParseException;

import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.service.InvoiceStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.InvoiceService;
import hvcntt.org.shoppingweb.service.UserService;

import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManageInvoiceController {
    @Autowired
    InvoiceService invoiceService;

    @Autowired
    UserService userService;

    @Autowired
    InvoiceStatusService invoiceStatusService;

    @RequestMapping(value = "/admin/manageInvoice")
    public String getAllInvoice(Model model, @RequestParam(value = "message", required = false) String message) {
        if("updateInvoice".equals(message)){
            model.addAttribute("message", "Saved invoice successfully !!");
        }
        model.addAttribute("invoices", invoiceService.findByOrderByCreateDateDesc());
        return "manageInvoice";
    }

    @RequestMapping(value = "/admin/showDetailInvoice")
    public String showDetailInvoice(Model model, @RequestParam("invoiceId") String invoiceId) throws UserNotFoundException {
        Invoice invoice = invoiceService.findOne(invoiceId);
        model.addAttribute("invoice", invoiceService.findOne(invoiceId));
        model.addAttribute("user", userService.findByUsername(invoice.getUsername()));
        return "invoiceDetail";
    }

    @RequestMapping(value = "/admin/deleteInvoice")
    public @ResponseBody
    String
    deleteInvoice(@RequestParam("invoiceId") String invoiceId) {
        invoiceService.delete(invoiceId);
        return "Deleted invoice with id : " + invoiceId + " !!";
    }

    @RequestMapping(value = "/admin/editInvoiceStatus", method = RequestMethod.GET)
    public String editInvoiceStatus(@RequestParam("invoiceId") String invoiceId, Model model, @RequestParam(value = "message", required = false) String message) throws UserNotFoundException {
        model.addAttribute("invoiceStatus", invoiceStatusService.getAll());
        model.addAttribute("invoice", invoiceService.findOne(invoiceId));
        return "editInvoice";
    }

    @RequestMapping(value = "/admin/updateInvoice", method = RequestMethod.POST)
    public String updateInvoice(HttpServletRequest request) throws ParseException, InvoiceStatusNotFoundException {
        String invoiceStatusId = request.getParameter("invoiceStatusId");
        String invoiceId = request.getParameter("invoiceId");
        invoiceService.save(invoiceId, invoiceStatusId);
        return "redirect:/admin/manageInvoice?message=updateInvoice";
    }
}
