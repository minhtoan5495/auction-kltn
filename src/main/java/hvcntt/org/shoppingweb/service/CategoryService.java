package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.dto.CategoryDto;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.exception.CategoryNotFoundExeption;

import java.util.List;

public interface CategoryService {

    List<Category> getAll();

    Category findOne(String idcategory);

    void update(Category category);

    void save(CategoryDto categoryDto);

    void delete(Category category) throws CategoryNotFoundExeption;

    List<Category> findByParent(Parent parent);

    Category findByCategoryName(String categoryName);
}
