package hvcntt.org.shoppingweb.service;import hvcntt.org.shoppingweb.dao.dto.RatingDto;import hvcntt.org.shoppingweb.dao.entity.Product;import hvcntt.org.shoppingweb.dao.entity.Rating;import hvcntt.org.shoppingweb.dao.entity.User;import java.util.List;public interface RatingService {    void save(RatingDto ratingDto, Product product, User user);    List<Rating> findAll();    List<Rating> getByProduct(Product product);    void deleteRating(String ratingId);}