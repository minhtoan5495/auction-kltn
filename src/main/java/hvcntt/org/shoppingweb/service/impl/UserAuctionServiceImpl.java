package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.entity.UserAuction;
import hvcntt.org.shoppingweb.dao.repository.UserAuctionRepository;
import hvcntt.org.shoppingweb.service.UserAuctionService;

@Service
public class UserAuctionServiceImpl implements UserAuctionService {
	@Autowired
	UserAuctionRepository userAuctionRepository;
	@Override
	public UserAuction create(UserAuction userAuction) {
		// TODO Auto-generated method stub
		return userAuctionRepository.save(userAuction);
	}
	@Override
	public List<Auction> findByUser(User user) {
		// TODO Auto-generated method stub
		return userAuctionRepository.findByUser(user);
	}

}
