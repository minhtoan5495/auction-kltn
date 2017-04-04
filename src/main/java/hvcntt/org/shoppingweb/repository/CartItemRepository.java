package hvcntt.org.shoppingweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.model.CartItem;

public interface CartItemRepository extends JpaRepository<CartItem, String> {

}
