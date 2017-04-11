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

import hvcntt.org.shoppingweb.dao.dto.CommentDto;
//import hvcntt.org.shoppingweb.model.Comment;
import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
//import hvcntt.org.shoppingweb.model.User;
import hvcntt.org.shoppingweb.service.CommentService;
import hvcntt.org.shoppingweb.service.ImageService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class DetailPageController {

    @Autowired
    private ProductService productservice;

    @Autowired
    private ImageService imageservice;

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detailPage(Model model, @RequestParam("idproduct") String idproduct, Principal principal) {
        Product product = productservice.findOne(idproduct);
        if (existId(idproduct)) {
            productservice.updateView(idproduct);
        }
        List<Image> imgs = imageservice.findByProduct(product);
        model.addAttribute("CommentDto", new CommentDto());
        model.addAttribute("image", imgs);
        model.addAttribute("singleProduct", product);
        return "detailpage";
    }

    private boolean existId(String idproduct) {
        List<Product> listP = productservice.getAll();
        for (int i = 0; i < listP.size(); i++) {
            if (listP.get(i).getProductId() == idproduct) {
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
