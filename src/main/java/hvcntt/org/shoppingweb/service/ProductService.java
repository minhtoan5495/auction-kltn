package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;

import java.util.List;

public interface ProductService {

	List<Product> getAll();
	Product findOne(String idproduct);
	List<Product> findByNameContaining(String name);
	void updateView(String idproduct);
	List<Product> findByProductTransactionType(TransactionType transactionType);
}
