package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.RatingDto;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.Rating;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.repository.RatingRepository;
import hvcntt.org.shoppingweb.service.AuctionService;
import hvcntt.org.shoppingweb.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingServiceImpl implements RatingService {

    @Autowired
    private RatingRepository ratingRepository;

    @Override
    public void save(RatingDto ratingDto, Product product, User user) {
        Rating rating = convertDtoToEntity(ratingDto, product, user);
        ratingRepository.save(rating);
    }

    @Override
    public List<Rating> findAll() {
        return ratingRepository.findAll();
    }

    @Override
    public List<Rating> getByProduct(Product product) {
        return ratingRepository.findByProduct(product);
    }

    private Rating convertDtoToEntity(RatingDto ratingDto, Product product, User user) {
        Rating rating = new Rating();
        rating.setProduct(product);
        rating.setUser(user);
        rating.setRating(ratingDto.getRating());
        rating.setRatingTitle(ratingDto.getTitle());
        rating.setRatingContent(ratingDto.getContent());
        return rating;
    }
}
