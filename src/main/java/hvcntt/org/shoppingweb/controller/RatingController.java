package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.dao.dto.RatingDto;
import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RatingController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private RatingService ratingService;

    @RequestMapping(value = "/rating/{idproduct}", method = RequestMethod.POST)
    public String createComment(@PathVariable("idproduct") String productId,
                                @ModelAttribute RatingDto ratingDto, Principal principal) throws UserNotFoundException {
        Product product = productService.findOne(productId);
        String username = principal.getName();
        User user = userService.findByUsername(username);
        ratingService.save(ratingDto, product, user);
        return "redirect:/detail?idproduct=" + productId;
    }

    @RequestMapping(value = "/rating/{idproduct}", method = RequestMethod.GET)
    @Secured(value = {"ROLE_USER","ROLE_ADMIN"})
    public String comment(@PathVariable("idproduct") String productId,
                                @ModelAttribute RatingDto ratingDto) throws UserNotFoundException {
        return "redirect:/detail?idproduct=" + productId;
    }
}
