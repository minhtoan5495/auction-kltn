package hvcntt.org.shoppingweb.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.service.CategoryService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;

@Controller
public class HomePageController {
	@Autowired
	CategoryService categoryservice;
	@Autowired
	ProductService productservice;
	@Autowired
	TransactionTypeService transactionService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/home")
	public String homePage(Model model,HttpSession session,HttpServletRequest request){
		@SuppressWarnings("unused")
		List<CartItem> inFo= (List<CartItem>) session.getAttribute("cart");
		List<Category> listMenu=categoryservice.getCategoryParent();
		model.addAttribute("listMenu",listMenu);
		TransactionType transactionType=transactionService.findByName("Sale");
		model.addAttribute("listProduct", productservice.findByProductTransactionType(transactionType));
		TransactionType transactionType2=transactionService.findByName("Auction");
		model.addAttribute("listProduct2", productservice.findByProductTransactionType(transactionType2));
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

