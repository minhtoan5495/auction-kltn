package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.exception.CategoryNotFoundExeption;

import java.util.List;

public interface CategoryService {

	List<Category> getAll();
	Category findOne(String idcategory);
	List<Category> getCategoryParent();
	List<Category> getCategoryChildren(String parentid);
	void save(Category category);
	void delete(String categoryId) throws CategoryNotFoundExeption;
}
