package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.model.Image;
import hvcntt.org.shoppingweb.model.Product;

public interface ImageService {
	List<Image> getAll();
	List<Image> findByProduct(Product product);
}
