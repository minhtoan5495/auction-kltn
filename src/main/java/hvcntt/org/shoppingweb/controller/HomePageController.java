package hvcntt.org.shoppingweb.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.model.Category;
import hvcntt.org.shoppingweb.service.CategoryService;
import hvcntt.org.shoppingweb.service.ProductService;

@Controller
public class HomePageController {
	@Autowired
	CategoryService categoryservice;
	@Autowired
	ProductService productservice;
	@RequestMapping(value="/home")
	public String homePage(Model model){
		List<Category> listMenu=categoryservice.getCategoryParent();
		model.addAttribute("listMenu",listMenu);
		model.addAttribute("listProduct", productservice.getAll());
		return "home";
	}
	@RequestMapping(value="/searchname")
	public String searchPage(@RequestParam("name")String name,Model model){
		model.addAttribute("listMenu",categoryservice.getAll() );
		model.addAttribute("listProduct", productservice.findByNameContaining(name));
		model.addAttribute("message","có "+ productservice.findByNameContaining(name).size()+" sản phẩm được tìm thấy");
		return "home";
	}
}

