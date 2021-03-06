package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.dto.ProductDto;
import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.dao.entity.TransactionType;

import java.text.ParseException;
import java.util.List;

import hvcntt.org.shoppingweb.exception.ProductNotFoundException;
import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public interface ProductService {

    List<Product> getAll();

    Product findOne(String productId);

    List<Product> findByNameContaining(String name);

    void updateView(String productId);

    List<Product> findByProductTransactionType(TransactionType transactionType);

    Page<Product> findProductPaging(TransactionType transactionType, Pageable pageable);

    List<Product> findByCategoryAndPrice(Category category, float minPrice, float maxPrice);

    List<Product> findByCategoryAndPriceBetweenAndProductIdNotIn(Category category, float minPrice, float maxPrice, String productId);

    Page<Product> getProductPaging(int pagenumber);

    void deleteProduct(String productId) throws ProductNotFoundException;

    void save(ProductDto productDto) throws Exception;

    void update(ProductDto productDto, String productId) throws Exception;

    List<Product> findByTransactionType(TransactionType transactionType);

    List<Product> findBySupplier(Supplier supplier);

    List<Product> findByTransactionType(TransactionType transactionType, Sort sort);

    List<Product> findByTransactionType(List<Product> products, TransactionType transactionType, Sort sort);

    List<Product> findByIds(List<String> productIds);

    List<Product> getNewProduct();

    List<Product> findByCategory(String categoryId);

    List<Product> findByContainingnameAndDescPrice(String name);

    List<Product> findByContainingnameAndAscPrice(String name);

    void save(Product product);

    Product findByName(String name);
}
