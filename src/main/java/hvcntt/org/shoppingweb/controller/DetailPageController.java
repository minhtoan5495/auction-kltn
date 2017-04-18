package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.util.List;

//import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.dao.dto.RatingDto;
import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.dao.dto.CommentDto;
//import hvcntt.org.shoppingweb.model.Comment;
//import hvcntt.org.shoppingweb.model.User;
import hvcntt.org.shoppingweb.service.ImageService;
import hvcntt.org.shoppingweb.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class DetailPageController {
    @Autowired
    private ImageService imageservice;

    @Autowired
    private ProductService productService;

    @Autowired
    private RatingService ratingService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detailPage(Model model, @RequestParam("idproduct") String productId, HttpServletRequest request) {
        setRememberMeTargetUrlToSession(request, productId);
        Product product = productService.findOne(productId);
        if (existId(productId)) {
        	productService.updateView(productId);
        }
        List<Image> imgs = imageservice.findByProduct(product);
        model.addAttribute("ratingDto", new RatingDto());
        model.addAttribute("image", imgs);
        model.addAttribute("singleProduct", product);
        return "detailpage";
    }

    private boolean existId(String idproduct) {
        List<Product> listP = productService.getAll();
        for (int i = 0; i < listP.size(); i++) {
            if (listP.get(i).getProductId().equals(idproduct) ) {
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
private void setRememberMeTargetUrlToSession(HttpServletRequest request, String productId){
    HttpSession session = request.getSession(false);
    if(session!=null){
        session.setAttribute("targetUrl", "/detail/" + productId);
    }
}
}
