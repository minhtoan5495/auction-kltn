package hvcntt.org.shoppingweb.service;

import java.util.List;

public interface ImageService {

	List<Image> getAll();
	List<Image> findByProduct(Product product);
}
