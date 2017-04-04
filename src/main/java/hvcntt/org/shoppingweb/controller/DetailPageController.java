package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.util.List;

//import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dto.CommentDto;
//import hvcntt.org.shoppingweb.model.Comment;
import hvcntt.org.shoppingweb.model.Image;
import hvcntt.org.shoppingweb.model.Product;
//import hvcntt.org.shoppingweb.model.User;
import hvcntt.org.shoppingweb.service.CommentService;
import hvcntt.org.shoppingweb.service.ImageService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class DetailPageController {
	@Autowired
	ProductService productservice;
	@Autowired
	ImageService imageservice;
	@Autowired
	CommentService commentService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detailPage(Model model,@RequestParam("idproduct") String idproduct,Principal principal){
		Product product= productservice.findOne(idproduct);
		if(existId(idproduct)){
			productservice.updateView(idproduct);
		}
		List<Image> imgs= imageservice.findByProduct(product);
		model.addAttribute("CommentDto", new CommentDto());
		model.addAttribute("image", imgs);
		model.addAttribute("singleProduct", product);
		return "detailpage";
	}
	private boolean existId(String idproduct){
		List<Product> listP= productservice.getAll();
		for(int i=0;i<listP.size();i++){
			if(listP.get(i).getIdproduct()==idproduct){
				return true;
			}
		}
		return false;
	}
//	@RequestMapping(value="/detail",method=RequestMethod.POST)
//	public String createComment(@ModelAttribute("comment")Comment comment){
//		commentService.create(comment);;
//		return "redirect:/home";
//	}
}
