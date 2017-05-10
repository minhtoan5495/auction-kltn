package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.AuctionDto;
import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.Product;
//import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.repository.AuctionRepository;
import hvcntt.org.shoppingweb.dao.repository.ProductRepository;
import hvcntt.org.shoppingweb.service.AuctionService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AutionServiceImpl implements AuctionService {
    @Autowired
    AuctionRepository auctionRepository;

    @Autowired
    ProductRepository productRepository;

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
        auction.setStatus(auctionDto.getStatus());
        auction.setEndTime(formatStringToDate(auctionDto.getStartTime()));
        auction.setStartTime(formatStringToDate(auctionDto.getStartTime()));
        auction.setProduct(productRepository.getOne(auctionDto.getProductId()));
        auctionRepository.save(auction);
    }

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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
    public void update(AuctionDto auctionDto, String auctionId) throws ParseException {
        Auction auction = auctionRepository.findOne(auctionId);
        auction.setStatus(auctionDto.getStatus());
        auction.setStartTime(formatStringToDate(auctionDto.getStartTime()));
        auction.setEndTime(formatStringToDate(auctionDto.getEndTime()));
        auction.setProduct(productRepository.getOne(auctionDto.getProductId()));
        auctionRepository.save(auction);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(String startDate, String endDate, List<String> productIds) throws ParseException {
        for (String productId : productIds) {
            int beginIndex = productId.indexOf("productId\":\"");
            int endIndex = productId.indexOf("\"}");
            String productIdNew = productId.substring(beginIndex + 12, endIndex);
            Auction auction = new Auction();
            auction.setStatus("ĐANG ĐẤU GIÁ");
            auction.setEndTime(formatStringToDate(startDate));
            auction.setStartTime(formatStringToDate(endDate));
            auction.setProduct(productRepository.getOne(productIdNew));
            auctionRepository.save(auction);
        }
    }
}
