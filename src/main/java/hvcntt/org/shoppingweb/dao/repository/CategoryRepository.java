package hvcntt.org.shoppingweb.dao.repository;


import java.util.List;

//import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
//import org.springframework.data.repository.query.Param;


public interface CategoryRepository extends JpaRepository<Category, String> {

	@Query("Select c from Category c where c.parentId = :parentid")
	List<Category> findByCategory(@Param("parentid") String parentid);
}