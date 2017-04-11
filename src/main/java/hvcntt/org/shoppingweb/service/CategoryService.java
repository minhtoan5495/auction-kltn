package hvcntt.org.shoppingweb.service;

import java.util.List;

public interface CategoryService {

	List<Category> getAll();
	Category findOne(String idcategory);
	List<Category> getCategoryParent();
	List<Category> getCategoryChildren(String parentid);
}
