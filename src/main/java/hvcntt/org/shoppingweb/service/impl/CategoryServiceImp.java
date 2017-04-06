package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import hvcntt.org.shoppingweb.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.repository.CategoryRepository;

@Service
public class CategoryServiceImp implements CategoryService {

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
	
}
