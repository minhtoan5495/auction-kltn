package hvcntt.org.shoppingweb.controller;

import java.util.ArrayList;
import java.util.HashSet;
//import java.security.Principal;
import java.util.List;
import java.util.Set;

//import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.dao.dto.RatingDto;
import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.Rating;
import hvcntt.org.shoppingweb.dao.entity.UserAuction;
import hvcntt.org.shoppingweb.service.RatingService;
import hvcntt.org.shoppingweb.service.UserAuctionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hvcntt.org.shoppingweb.service.CategoryService;
//import hvcntt.org.shoppingweb.dao.dto.CommentDto;
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
    private CategoryService categoryService;

    @SuppressWarnings("unused")
	@Autowired
    private RatingService ratingService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detailPage(Model model, @RequestParam("idproduct") String productId, HttpServletRequest request) {
        Product product = productService.findOne(productId);
        if (existId(productId)) {
            productService.updateView(productId);
        }
        Category category=categoryService.findOne(product.getCategory().getCategoryId());
        List<Product> getRelateProduct=productService.findByCategoryAndPriceBetweenAndProductIdNotIn(category, (product.getPrice()-10000), (product.getPrice()+10000), product.getProductId());
        model.addAttribute("getRelateProduct", getRelateProduct);
        List<Image> imgs = imageservice.findByProduct(product);
        int rating = getAverage(product.getRatings());
        model.addAttribute("ratingNumber", rating);
        model.addAttribute("ratingDto", new RatingDto());
        model.addAttribute("image", imgs);
        Set<UserAuction> userAuctions  = new HashSet<>();
        List<Auction> auctions = product.getAuctions();
        for(Auction auction : auctions){
        	if(auction.getStatus().equals("Đang đấu giá") && auction.getProduct().getProductId().equals(productId)){
        		userAuctions.addAll(auction.getUserAuctions());
        	}
        }
        model.addAttribute("userAuctions",userAuctions);
        model.addAttribute("singleProduct", product);
        model.addAttribute("ratings",ratingService.getByProduct(product));
        return "detailPage";
    }

    private int getAverage(List<Rating> ratings) {
        int ratingTotal = 0;
        if(ratings.size() == 0){
            return ratingTotal;
        }else {
            for (Rating rating : ratings
                    ) {
                ratingTotal += rating.getRating();
            }

            return ratingTotal / ratings.size();
        }
    }

    private boolean existId(String idproduct) {
        List<Product> listP = productService.getAll();
        for (int i = 0; i < listP.size(); i++) {
            if (listP.get(i).getProductId().equals(idproduct)) {
                return true;
            }
        }
        return false;
    }

//    private void setRememberMeTargetUrlToSession(HttpServletRequest request, String productId) {
//        HttpSession session = request.getSession(false);
//        if (session != null) {
//            session.setAttribute("targetUrl", "/rating/" + productId);
//        }
//    }
}
