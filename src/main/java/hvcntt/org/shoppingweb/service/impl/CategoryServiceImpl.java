package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import hvcntt.org.shoppingweb.dao.dto.CategoryDto;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.dao.repository.ParentRepository;
import hvcntt.org.shoppingweb.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.CategoryRepository;
import hvcntt.org.shoppingweb.exception.CategoryNotFoundExeption;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ParentRepository parentRepository;

    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category findOne(String categoryId) {
        return categoryRepository.findOne(categoryId);
    }

    @Override
    public void update(Category category) {
        categoryRepository.save(category);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(CategoryDto categoryDto) {
        Category category;
        if(categoryDto.getCategoryId() != ""){
            category = categoryRepository.findOne(categoryDto.getCategoryId());
        } else {
            category = new Category();
        }
        category.setCategoryName(categoryDto.getCategoryName());
        category.setParent(parentRepository.findOne(categoryDto.getParentId()));
        categoryRepository.save(category);

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void delete(Category category) throws CategoryNotFoundExeption {
        categoryRepository.delete(category);
    }

    @Override
    public List<Category> findByParent(Parent parent) {
        return categoryRepository.findByParent(parent);
    }

    @Override
    public Category findByCategoryName(String categoryName) {
        return categoryRepository.findByCategoryName(categoryName);
    }

}
