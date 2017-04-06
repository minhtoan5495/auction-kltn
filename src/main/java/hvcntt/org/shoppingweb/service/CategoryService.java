package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Category;

public interface CategoryService {

	List<Category> getAll();
	Category findOne(String idcategory);
	List<Category> getCategoryParent();
	List<Category> getCategoryChildren(String parentid);
}
