package hvcntt.org.shoppingweb.service.impl;

import java.util.List;
import java.util.Set;

import hvcntt.org.shoppingweb.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
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

    @Autowired
    AuctionService auctionService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public UserAuction create(UserAuction userAuction) {
        return userAuctionRepository.save(userAuction);
    }

    @Override
    public List<UserAuction> findByUser(User user) {
        return userAuctionRepository.findByUser(user);
    }

    @Override
    public List<UserAuction> findByAuction(Auction auction) {
        return userAuctionRepository.findByAuction(auction, new PageRequest(0, 1, Direction.DESC, "price")).getContent();
    }

    @Override
    public List<UserAuction> findByAuctionId(String auctionId) {
        return userAuctionRepository.findByAuction(auctionService.findOne(auctionId));
    }

    @Override
    public List<UserAuction> findTop5ByAuction(Auction auction) {
        return userAuctionRepository.findDistinctTop5ByAuctionOrderByPriceDesc(auction);
    }

    @Override
    public UserAuction findFirstByAuctionOrderByPriceDesc(Auction auction) {
        return userAuctionRepository.findFirstByAuctionOrderByPriceDesc(auction);
    }

}
