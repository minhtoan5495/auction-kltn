package hvcntt.org.shoppingweb.controller;

import java.util.Date;
import java.util.HashSet;
//import java.security.Principal;
import java.util.List;
import java.util.Set;

//import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.dao.dto.AuctionStatus;
import hvcntt.org.shoppingweb.dao.dto.RatingDto;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import hvcntt.org.shoppingweb.dao.dto.CommentDto;
//import hvcntt.org.shoppingweb.model.Comment;
//import hvcntt.org.shoppingweb.model.User;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DetailPageController {

    @Autowired
    ImageService imageservice;

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    RatingService ratingService;

    @Autowired
    ParentService parentService;

    @Autowired
    AuctionService auctionService;

    @Autowired
    UserAuctionService userAuctionService;

    @ModelAttribute("parents")
    public List<Parent> parent() {
        return parentService.findAll();
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detailPage(Model model, @RequestParam("productId") String productId) {
        Product product = productService.findOne(productId);
        if ("Auction".equals(product.getTransactionType().getTransactionTypeName())) {
            Auction auction = auctionService.findByProductAndStatus(product, AuctionStatus.AUCTIONING);
            UserAuction userAuction = userAuctionService.findFirstByAuctionOrderByPriceDesc(auction);
            Set<UserAuction> userAuctions = userAuctionService.findTop5ByAuction(auction);
            model.addAttribute("auction",auction);
            model.addAttribute("product", product);
            model.addAttribute("userAuction", userAuction);
            model.addAttribute("userAuctions", userAuctions);
        } else {
            model.addAttribute("product", product);
        }
        if (existId(productId)) {
            productService.updateView(productId);
        }
        Category category = categoryService.findOne(product.getCategory().getCategoryId());
        List<Product> relateProducts = productService.findByCategoryAndPriceBetweenAndProductIdNotIn(category, (product.getPrice() - 10000), (product.getPrice() + 10000), product.getProductId());
        model.addAttribute("relateProducts", relateProducts);
        List<Image> images = imageservice.findByProduct(product);
        int rating = getAverage(product.getRatings());
        model.addAttribute("ratingNumber", rating);
        model.addAttribute("ratingDto", new RatingDto());
        model.addAttribute("image", images);
        model.addAttribute("ratings", ratingService.getByProduct(product));
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        return "detailPage";
    }

    private int getAverage(List<Rating> ratings) {
        int ratingTotal = 0;
        if (ratings.size() == 0) {
            return ratingTotal;
        } else {
            for (Rating rating : ratings
                    ) {
                ratingTotal += rating.getRating();
            }
            return ratingTotal / ratings.size();
        }
    }

    private boolean existId(String productId) {
        List<Product> products = productService.getAll();
        for (Product product : products) {
            if (product.getProductId().equals(productId)) {
                return true;
            }
        }
        return false;
    }
}
