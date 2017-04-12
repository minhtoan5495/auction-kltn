package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

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
//	@Override
//	public void updateView(String idproduct) {
//		// TODO Auto-generated method stub
//		 productrepo.updateView(idproduct);
//	}

}
