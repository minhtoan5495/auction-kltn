package hvcntt.org.shoppingweb.dao.repository;

import java.util.List;

import javax.transaction.Transactional;

import hvcntt.org.shoppingweb.dao.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<Product, String> {

	List<Product> findByNameContaining(String name);

	@Modifying
	@Transactional
	@Query("update Product p set p.view = p.view + 1 where p.idproduct = :idproduct")
	void updateView(@Param("idproduct") String idproduct);
}