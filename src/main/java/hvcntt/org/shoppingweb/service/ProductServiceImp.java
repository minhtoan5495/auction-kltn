package hvcntt.org.shoppingweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.Product;
import hvcntt.org.shoppingweb.repository.ProductRepository;
@Service
public class ProductServiceImp implements ProductService{
	@Autowired
	ProductRepository productrepo;
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

}
