package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	private static final int PAGE_SIZE=8;

	@Autowired
	private ProductRepository productrepo;

	@Override
	public List<Product> getAll() {
		// TODO Auto-generated method stub
		return productrepo.findAll();
	}
	@Override
	public Product findOne(String idproduct) {
		// TODO Auto-generated method stub
		return productrepo.findOne(idproduct);
	}
	@Override
	public List<Product> findByNameContaining(String name) {
		// TODO Auto-generated method stub
		return productrepo.findByNameContaining(name);
	}
	@Override
	public void updateView(String idproduct) {
		// TODO Auto-generated method stub
		 productrepo.updateView(idproduct);
	}
	@Override
	public List<Product> findByProductTransactionType(TransactionType transactionType) {
		// TODO Auto-generated method stub
		return productrepo.findByTransactionType(transactionType, new PageRequest(0, 12)).getContent();
	}
	@Override
	public List<Product> findByCategoryAndPrice(Category category, float minPrice, float maxPrice) {
		// TODO Auto-generated method stub
		return productrepo.findByCategoryAndPriceBetween(category, minPrice, maxPrice);
	}
	@Override
	public List<Product> findByCategoryAndPriceBetweenAndProductIdNotIn(Category category, float minPrice,
			float maxPrice, String productId) {
		// TODO Auto-generated method stub
		return productrepo.findByCategoryAndPriceBetweenAndProductIdNotIn(category, minPrice, maxPrice, productId);
	}
	@Override
	public Page<Product> getProductPaging(int pagenumber) {
		PageRequest request=new PageRequest(pagenumber-1,PAGE_SIZE);
		return productrepo.findAll(request);
	}
	@Override
	public Page<Product> findProductPaging(TransactionType transactionType, Pageable pageable) {
		// TODO Auto-generated method stub
		return productrepo.findByTransactionType(transactionType, pageable);
	}

	

}
