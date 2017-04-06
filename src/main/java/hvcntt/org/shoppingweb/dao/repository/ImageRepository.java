package hvcntt.org.shoppingweb.dao.repository;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, String> {

	List<Image> findByProduct(Product product);
}
