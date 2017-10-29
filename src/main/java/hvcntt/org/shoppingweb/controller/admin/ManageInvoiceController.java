package hvcntt.org.shoppingweb.controller.admin;

import java.text.ParseException;

import hvcntt.org.shoppingweb.dao.dto.Constant;
import hvcntt.org.shoppingweb.dao.dto.InvoiceStatus;
import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.utils.Helper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.InvoiceService;
import hvcntt.org.shoppingweb.service.UserService;

import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ManageInvoiceController {

    @Autowired
    InvoiceService invoiceService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/admin/manageInvoice")
    public String getAllInvoice(Model model, HttpSession session) {
        if ("updateInvoice".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.SAVE_SUCCESSFULLY);
            session.removeAttribute("message");
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
    public
    @ResponseBody
    String
    deleteInvoice(@RequestParam("invoiceId") String invoiceId) {
        invoiceService.delete(invoiceId);
        return "Deleted invoice with id : " + invoiceId + " !!";
    }

    @RequestMapping(value = "/admin/editInvoiceStatus", method = RequestMethod.GET)
    public String editInvoiceStatus(@RequestParam("invoiceId") String invoiceId, Model model) throws UserNotFoundException {
        model.addAttribute("invoiceStatus", "");
        model.addAttribute("invoice", invoiceService.findOne(invoiceId));
        return "editInvoice";
    }

    @RequestMapping(value = "/admin/updateInvoice", method = RequestMethod.POST)
    public String updateInvoice(HttpServletRequest request, HttpSession session) throws ParseException, InvoiceStatusNotFoundException {
        InvoiceStatus invoiceStatus = Helper.getInvoiceStatus(request.getParameter("invoiceStatus"));
        String invoiceId = request.getParameter("invoiceId");
        invoiceService.save(invoiceId, invoiceStatus);
        session.setAttribute("message", "updateInvoice");
        return "redirect:/admin/manageInvoice";
    }
}
