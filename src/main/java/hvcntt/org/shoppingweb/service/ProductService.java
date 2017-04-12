package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.Product;

import java.util.List;

public interface ProductService {

	List<Product> getAll();
	Product findOne(String idproduct);
	List<Product> findByNameContaining(String name);
	void updateView(String idproduct);
}
