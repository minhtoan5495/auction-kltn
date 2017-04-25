package hvcntt.org.shoppingweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.service.SupplierService;

@Controller
public class ManageSupplierController {
	@Autowired
	SupplierService supplierService;
	@RequestMapping(value="/admin/manageSupplier")
	public String getAllSupplier(Model model){
		model.addAttribute("supplies", supplierService.getAll());
		return "manageSupplier";
	}
	@RequestMapping(value="/admin/addSupplier",method=RequestMethod.GET)
	public String addSupplier(Model model){
		model.addAttribute("supplier", new Supplier());
		return "addOrEditSupplier";
	}
	@RequestMapping(value="/admin/saveSupplier",method=RequestMethod.POST)
	public String addedSupplier(@ModelAttribute("supplier") Supplier supplier){
		supplierService.save(supplier);
		return "redirect:/admin/manageSupplier";
	}
	@RequestMapping(value="/admin/deleteSupplier",method=RequestMethod.GET)
	public String deleteSupplier(@RequestParam("supplierId")String supplierId){
		supplierService.delete(supplierId);
		return "redirect:/admin/manageSupplier";
	}
	@RequestMapping(value="/admin/editSupplier",method=RequestMethod.GET)
	public String editSupplier(Model model,@RequestParam("supplierId")String supplierId){
		Supplier supplier=supplierService.findOne(supplierId);
		model.addAttribute("supplier", supplier);
		return "addOrEditSupplier";
	}
	@RequestMapping(value="/admin/saveSupplier")
	public String editSupplier(@ModelAttribute("supplier") Supplier supplier){
		supplierService.save(supplier);
		return "redirect:/admin/manageSupplier";
	}
}
