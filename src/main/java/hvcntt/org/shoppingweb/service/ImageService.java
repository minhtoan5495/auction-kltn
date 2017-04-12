package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;

import java.util.List;

public interface ImageService {

	List<Image> getAll();
	List<Image> findByProduct(Product product);
}
