package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.Discount;
import hvcntt.org.shoppingweb.dao.repository.DiscountRepository;
/*import hvcntt.org.shoppingweb.service.AuctionService;*/
import hvcntt.org.shoppingweb.service.DiscountService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountServiceImpl implements DiscountService {
	@Autowired
	private DiscountRepository discountRepo;
	@Override
	public List<Discount> getAll() {
		// TODO Auto-generated method stub
		return discountRepo.findAll();
	}

}
