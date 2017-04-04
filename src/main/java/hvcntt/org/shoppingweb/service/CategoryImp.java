package hvcntt.org.shoppingweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.Category;
import hvcntt.org.shoppingweb.repository.CategoryRepository;
@Service
public class CategoryImp implements CategoryService{
	@Autowired
	CategoryRepository categoryrepo;
	@Override
	public List<Category> getAll() {
		// TODO Auto-generated method stub
		return categoryrepo.findAll();
	}
	@Override
	public Category findOne(String idcategory) {
		// TODO Auto-generated method stub
		return categoryrepo.findOne(idcategory);
	}
//	@Override
//	public List<Category> getCategoryParent(int parentid) {
//		// TODO Auto-generated method stub
//		return categoryrepo.findByCategory(parentid);
//	}
	@Override
	public List<Category> getCategoryParent() {
		// TODO Auto-generated method stub
		return categoryrepo.findByCategory();
	}
	
}
