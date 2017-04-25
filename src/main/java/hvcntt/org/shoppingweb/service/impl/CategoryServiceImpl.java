package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.CategoryRepository;
import hvcntt.org.shoppingweb.exception.CategoryNotFoundExeption;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryrepo;

	@Override
	public List<Category> getAll() {
		return categoryrepo.findAll();
	}
	@Override
	public Category findOne(String idcategory) {
		return categoryrepo.findOne(idcategory);
	}

	@Override
	public List<Category> getCategoryChildren(String parentid) {
		return categoryrepo.findByCategory(parentid);
	}

	@Override
	public List<Category> getCategoryParent() {
		String parent = null;
		return categoryrepo.findByCategory(parent);
	}
	@Override
	@Transactional
	public void save(Category category) {
		// TODO Auto-generated method stub
		categoryrepo.save(category);
		
	}
	@Override
	@Transactional
	public void delete(String categoryId) throws CategoryNotFoundExeption{
		if(categoryrepo.findOne(categoryId)!=null){
			categoryrepo.delete(categoryId);
		}
		else{
			throw new CategoryNotFoundExeption("Category not found with id"+categoryrepo.findOne(categoryId));
		}
		
	}
	
}
