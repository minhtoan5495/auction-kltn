package hvcntt.org.shoppingweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.CartItem;
import hvcntt.org.shoppingweb.repository.CartItemRepository;
@Service
public class CartItemImp implements CartItemService{
	@Autowired
	CartItemRepository cartItemRepo;
	@Override
	public List<CartItem> getAll() {
		// TODO Auto-generated method stub
		return cartItemRepo.findAll();
	}

}
