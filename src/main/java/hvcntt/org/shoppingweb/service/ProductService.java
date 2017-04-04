package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.model.Product;

public interface ProductService {
	public List<Product> getAll();
	public Product findOne(String idproduct);
	public List<Product> findByNameContaining(String name);
	public void updateView(String idproduct);
}
