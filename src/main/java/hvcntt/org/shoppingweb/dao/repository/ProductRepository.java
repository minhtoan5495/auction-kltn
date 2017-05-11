package hvcntt.org.shoppingweb.dao.repository;import java.util.List;import javax.transaction.Transactional;import hvcntt.org.shoppingweb.dao.entity.Category;import hvcntt.org.shoppingweb.dao.entity.Product;import hvcntt.org.shoppingweb.dao.entity.Supplier;import hvcntt.org.shoppingweb.dao.entity.TransactionType;import org.springframework.data.domain.Page;//import org.springframework.data.domain.Page;import org.springframework.data.domain.Pageable;import org.springframework.data.domain.Sort;import org.springframework.data.jpa.repository.JpaRepository;import org.springframework.data.jpa.repository.Modifying;import org.springframework.data.jpa.repository.Query;import org.springframework.data.repository.query.Param;public interface ProductRepository extends JpaRepository<Product, String> {    List<Product> findByNameContaining(String name);	@Modifying	@Transactional	@Query("update Product p set p.viewNumber = p.viewNumber + 1 where p.productId = :productId")	void updateView(@Param("productId") String productId);		//Product findByTransactionType(TransactionType transactionType);	Page<Product> findByTransactionType(TransactionType transactionType,Pageable page);	List<Product> findByCategoryAndPriceBetween(Category category,float minPrice,float maxPrice);	List<Product> findByCategoryAndPriceBetweenAndProductIdNotIn(Category category,float minPrice,float maxPrice,String productId);	List<Product> findByTransactionType(TransactionType transactionType);	List<Product> findByCategory(Category category);	List<Product> findBySupplier(Supplier supplier);	List<Product> findByTransactionType(TransactionType transactionType,Sort sort);	List<Product> findByTransactionType(List<Product> products,TransactionType transactionType,Sort sort);}