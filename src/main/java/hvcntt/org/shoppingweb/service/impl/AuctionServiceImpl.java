package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.AuctionDto;
import hvcntt.org.shoppingweb.dao.dto.AuctionStatus;
import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.Product;
//import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.entity.UserAuction;
import hvcntt.org.shoppingweb.dao.repository.AuctionRepository;
import hvcntt.org.shoppingweb.dao.repository.ProductRepository;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.*;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

@Service
public class AuctionServiceImpl implements AuctionService {

    @Autowired
    AuctionRepository auctionRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @Autowired
    UserAuctionService userAuctionService;

    @Override
    public Auction create(Auction auction) {
        return auctionRepository.save(auction);
    }

    @Override
    public Auction findByProduct(Product product) {
        return auctionRepository.findByProduct(product);
    }

    @Override
    public List<Auction> getAll() {
        return auctionRepository.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(AuctionDto auctionDto) throws ParseException {
        Auction auction = new Auction();
        auction.setAuctionStatus(auctionDto.getAuctionStatus());
        auction.setEndTime(formatStringToDate(auctionDto.getStartTime()));
        auction.setStartTime(formatStringToDate(auctionDto.getStartTime()));
        auction.setProduct(productRepository.getOne(auctionDto.getProductId()));
        auctionRepository.save(auction);
    }

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("hh:mm - yyyy-MM-dd");
        return format.parse(date);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void delete(String auctionId) {
        Auction auction = auctionRepository.findOne(auctionId);
        auctionRepository.delete(auction);
    }

    @Override
    public Auction findOne(String auctionId) {
        return auctionRepository.findOne(auctionId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void update(String auctionId, AuctionStatus auctionStatus) throws ParseException {
        Auction auction = auctionRepository.findOne(auctionId);
        Product product = auction.getProduct();
        auctionRepository.updateAuctionByProductAndAuctionStatusIsAuctioning(product, AuctionStatus.AUCTIONING);
        auction.setAuctionStatus(auctionStatus);
        auctionRepository.save(auction);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(String startDate, String endDate, List<String> productIds) throws ParseException {
        for (String productId : productIds) {
            Product product = productRepository.findOne(productId);
            auctionRepository.updateAuctionByProductAndAuctionStatusIsAuctioning(product, AuctionStatus.AUCTIONING);
            Auction auction = new Auction();
            auction.setAuctionStatus(AuctionStatus.AUCTIONING);
            auction.setEndTime(formatStringToDate(endDate));
            auction.setStartTime(formatStringToDate(startDate));
            auction.setProduct(product);
            auctionRepository.save(auction);
        }
    }

    @Override
    public void save(Auction auction) {
        auctionRepository.save(auction);
    }

    @Override
    public Auction findByProductAndStatus(Product product, AuctionStatus auctionStatus) {
        return auctionRepository.findByProductAndAuctionStatus(product, auctionStatus);
    }

    @Override
    public void addAuction(HttpServletRequest request, Principal principal) throws ParseException, UserNotFoundException {
        String productId = request.getParameter("productId");
        String username = principal.getName();
        Product product = productService.findOne(productId);
        Auction auction = this.findByProductAndStatus(product, AuctionStatus.AUCTIONING);
        User user = userService.findByUsername(username);
        UserAuction userAuction = new UserAuction();
        userAuction.setAuction(auction);
        userAuction.setUser(user);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        userAuction.setBidtime(dateFormat.parse(dateFormat.format(date)));
        String price = request.getParameter("price");
        userAuction.setPrice(Float.parseFloat(price));
        userAuctionService.create(userAuction);
    }
}
