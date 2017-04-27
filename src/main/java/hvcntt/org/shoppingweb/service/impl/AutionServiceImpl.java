package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.repository.AuctionRepository;
import hvcntt.org.shoppingweb.service.AuctionService;
import hvcntt.org.shoppingweb.service.ProductService;
import hvcntt.org.shoppingweb.service.TransactionTypeService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AutionServiceImpl implements AuctionService {
	@Autowired
	AuctionRepository auctionRepository;
	@Autowired
	TransactionTypeService transactionTypeService;
	@Autowired
	ProductService productService;
	@Override
	public Auction create(Auction auction) {
		TransactionType transactionType=transactionTypeService.findByName("Auction");
		Product product=productService.findByTransactionType(transactionType);
		auction.setProduct(product);
		return auctionRepository.save(auction);
	}
	@Override
	public Auction findByProduct(Product product) {
		// TODO Auto-generated method stub
		return auctionRepository.findByProduct(product);
	}
	@Override
	public List<Auction> getAll() {
		// TODO Auto-generated method stub
		return auctionRepository.findAll();
	}

}
