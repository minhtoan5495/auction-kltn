package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.exception.SupplierNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.service.SupplierService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ManageSupplierController {
    @Autowired
    SupplierService supplierService;

    @RequestMapping(value = "/admin/manageSupplier")
    public String getAllSupplier(Model model, HttpSession session, HttpServletRequest request) {
        if("saveSupplier".equals(session.getAttribute("message"))){
            model.addAttribute("message", "Saved supplier with id : " + request.getParameter("supplierId") + " !!");
            session.removeAttribute("message");
        }
        if("updateSupplier".equals(session.getAttribute("message"))){
            model.addAttribute("message", "Updated supplier with id : " + request.getParameter("supplierId") + " !!");
            session.removeAttribute("message");
        }
        model.addAttribute("supplies", supplierService.getAll());
        return "manageSupplier";
    }

    @RequestMapping(value = "/admin/addSupplier", method = RequestMethod.GET)
    public String addSupplier(Model model, HttpSession session) {
        if("invalidName".equals(session.getAttribute("message"))){
            model.addAttribute("error", "Supplier name is exist !!");
            session.removeAttribute("message");
        }
        if("nullName".equals(session.getAttribute("message"))){
            model.addAttribute("error", "Supplier name is null !!");
            session.removeAttribute("message");
        }
        model.addAttribute("supplier", new Supplier());
        return "addOrEditSupplier";
    }

    @RequestMapping(value = "/admin/saveSupplier", method = RequestMethod.POST)
    public String addSupplier(@ModelAttribute("supplier") Supplier supplier, HttpSession session) {
        if(supplier.getSupplierName().isEmpty()){
            session.setAttribute("message","nullName");
            return "redirect:/admin/addSupplier";
        }
        if(supplierService.findBySupplierName(supplier.getSupplierName()) != null){
            session.setAttribute("message","invalidName");
            return "redirect:/admin/addSupplier";
        }
        supplierService.save(supplier);
        session.setAttribute("message","saveSupplier");
        return "redirect:/admin/manageSupplier?supplierId=" + supplier.getSupplierId();
    }

    @RequestMapping(value = "/admin/deleteSupplier", method = RequestMethod.GET)
    public @ResponseBody String deleteSupplier(@RequestParam("supplierId") String supplierId) throws SupplierNotFoundException {
        Supplier supplier = supplierService.findOne(supplierId);
        if(supplier != null){
            supplierService.delete(supplier);
        }else {
            throw new SupplierNotFoundException("Can't find supplier with id : " + supplierId);
        }
        return "Deleted supplier with id : " + supplier.getSupplierId() + " !!";
    }

    @RequestMapping(value = "/admin/editSupplier", method = RequestMethod.GET)
    public String editSupplier(Model model, @RequestParam("supplierId") String supplierId) {
        Supplier supplier = supplierService.findOne(supplierId);
        model.addAttribute("supplier", supplier);
        return "addOrEditSupplier";
    }

    @RequestMapping(value = "/admin/saveSupplier")
    public String editSupplier(@ModelAttribute("supplier") Supplier supplier, HttpSession session) {
        supplierService.save(supplier);
        session.setAttribute("message","updateSupplier");
        return "redirect:/admin/manageSupplier?supplierId=" + supplier.getSupplierId();
    }
}
