package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.dto.ProductDto;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;

import java.text.ParseException;
import java.util.List;

import hvcntt.org.shoppingweb.exception.ProductNotFoundException;
import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Pageable;

public interface ProductService {

	List<Product> getAll();
	Product findOne(String idproduct);
	List<Product> findByNameContaining(String name);
	void updateView(String idproduct);
	List<Product> findByProductTransactionType(TransactionType transactionType);
	Page<Product> findProductPaging(TransactionType transactionType,Pageable pageable);
	List<Product> findByCategoryAndPrice(Category category,float minPrice,float maxPrice);
	List<Product> findByCategoryAndPriceBetweenAndProductIdNotIn(Category category,float minPrice,float maxPrice,String productId);
	Page<Product> getProductPaging(int pagenumber);
	void deleteProduct(String productId) throws ProductNotFoundException;

    void save(ProductDto productDto) throws ParseException;
	void update(ProductDto productDto, String productId) throws ParseException;
//	List<Product> findByProductTransactionType(TransactionType);
	List<Product> findByTransactionType(TransactionType transactionType);
}
