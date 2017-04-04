package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.model.Category;

public interface CategoryService {
	public List<Category> getAll();
	Category findOne(String idcategory);
	List<Category> getCategoryParent();
}
