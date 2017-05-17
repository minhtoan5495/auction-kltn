package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.exception.SupplierNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.service.SupplierService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ManageSupplierController {
    @Autowired
    SupplierService supplierService;

    @RequestMapping(value = "/admin/manageSupplier")
    public String getAllSupplier(Model model, @RequestParam(value = "message", required = false) String message, HttpServletRequest request) {
        if("saveSupplier".equals(message)){
            model.addAttribute("message", "Saved supplier with id : " + request.getParameter("supplierId") + " !!");
        }
        if("updateSupplier".equals(message)){
            model.addAttribute("message", "Updated supplier with id : " + request.getParameter("supplierId") + " !!");
        }
        model.addAttribute("supplies", supplierService.getAll());
        return "manageSupplier";
    }

    @RequestMapping(value = "/admin/addSupplier", method = RequestMethod.GET)
    public String addSupplier(Model model, @RequestParam(value = "message", required = false) String message) {
        if("invalidName".equals(message)){
            model.addAttribute("error", "Supplier name is exist !!");
        }
        if("nullName".equals(message)){
            model.addAttribute("error", "Supplier name is null !!");
        }
        model.addAttribute("supplier", new Supplier());
        return "addOrEditSupplier";
    }

    @RequestMapping(value = "/admin/saveSupplier", method = RequestMethod.POST)
    public String addSupplier(@ModelAttribute("supplier") Supplier supplier) {
        if(supplier.getSupplierName().isEmpty()){
            return "redirect:/admin/addSupplier?message=nullName";
        }
        if(supplierService.findBySupplierName(supplier.getSupplierName()) != null){
            return "redirect:/admin/addSupplier?message=invalidName";
        }
        supplierService.save(supplier);
        return "redirect:/admin/manageSupplier?message=saveSupplier&supplierId=" + supplier.getSupplierId();
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
    public String editSupplier(@ModelAttribute("supplier") Supplier supplier) {
        supplierService.save(supplier);
        return "redirect:/admin/manageSupplier?message=updateSupplier&supplierId=" + supplier.getSupplierId();
    }
}
