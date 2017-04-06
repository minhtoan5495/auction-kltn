package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;

public interface ImageService {

	List<Image> getAll();
	List<Image> findByProduct(Product product);
}
