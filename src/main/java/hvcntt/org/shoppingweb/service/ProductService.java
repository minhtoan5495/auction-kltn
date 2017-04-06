package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Product;

public interface ProductService {

	List<Product> getAll();
	Product findOne(String idproduct);
	List<Product> findByNameContaining(String name);
	void updateView(String idproduct);
}
