package hvcntt.org.shoppingweb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.service.CategoryService;

@Controller
public class MenuController {

	@Autowired
	private CategoryService categoryservice;

	@RequestMapping(value="/category")
	public String findByCategory(@RequestParam("idcategory")String idcategory, Model model){
		Category category = categoryservice.findOne(idcategory);
		model.addAttribute("listProduct", category);
		model.addAttribute("message","có "+ category.getListProduct().size()+" sản phẩm được tìm thấy");
		return "listProduct";
	}
}
