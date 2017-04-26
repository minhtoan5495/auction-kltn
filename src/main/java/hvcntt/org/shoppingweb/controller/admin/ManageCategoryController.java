package hvcntt.org.shoppingweb.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.exception.CategoryNotFoundExeption;
import hvcntt.org.shoppingweb.service.CategoryService;

@Controller
public class ManageCategoryController {
	@Autowired
	CategoryService categoryService;
	@RequestMapping(value="/admin/manageCategory")
	public String getAllCategory(Model model){
		model.addAttribute("categories", categoryService.getAll());
		return "manageCategory";
	}
	@RequestMapping(value="/admin/addCategory",method=RequestMethod.GET)
	public String addCategory(Model model){
		model.addAttribute("category", new Category());
		return "addOrEditCategory";
	}
	@RequestMapping(value="/admin/saveCategory",method=RequestMethod.POST)
	public String addedCategory(@ModelAttribute("category") Category category){
		categoryService.save(category);
		return "redirect:/admin/manageCategory";
	}
	@RequestMapping(value="/admin/deleteCategory",method=RequestMethod.GET)
	public void deleteCategory(@RequestParam("categoryId")String categoryId) throws CategoryNotFoundExeption{
		categoryService.delete(categoryId);
//		return "redirect:/admin/manageCategory";
	}
	@RequestMapping(value="/admin/editCategory",method=RequestMethod.GET)
	public String editCategory(Model model,@RequestParam("categoryId")String categoryId){
		Category category=categoryService.findOne(categoryId);
		model.addAttribute("category", category);
		return "addOrEditCategory";
	}
	@RequestMapping(value="/admin/saveCategory")
	public String editCategory(@ModelAttribute("category") Category category){
		categoryService.save(category);
		return "redirect:/admin/manageCategory";
	}
}
