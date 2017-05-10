package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.Auction;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.entity.UserAuction;
import hvcntt.org.shoppingweb.dao.repository.UserAuctionRepository;
import hvcntt.org.shoppingweb.service.UserAuctionService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserAuctionServiceImpl implements UserAuctionService {
    @Autowired
    UserAuctionRepository userAuctionRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public UserAuction create(UserAuction userAuction) {
        return userAuctionRepository.save(userAuction);
    }

    @Override
    public List<Auction> findByUser(User user) {
        return userAuctionRepository.findByUser(user);
    }

}
