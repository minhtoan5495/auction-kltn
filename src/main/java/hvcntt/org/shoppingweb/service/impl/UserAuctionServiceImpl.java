package hvcntt.org.shoppingweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}