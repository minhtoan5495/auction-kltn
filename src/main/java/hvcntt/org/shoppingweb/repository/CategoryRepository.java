package hvcntt.org.shoppingweb.repository;


import java.util.List;

//import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;

import hvcntt.org.shoppingweb.model.Category;

public interface CategoryRepository extends JpaRepository<Category, String> {
	@Query("Select c from Category c where c.category = null")
	List<Category> findByCategory();
	

}
