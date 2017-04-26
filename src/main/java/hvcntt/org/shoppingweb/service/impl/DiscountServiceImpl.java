package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.DiscountDto;
import hvcntt.org.shoppingweb.dao.entity.Discount;
import hvcntt.org.shoppingweb.dao.repository.DiscountRepository;
/*import hvcntt.org.shoppingweb.service.AuctionService;*/
import hvcntt.org.shoppingweb.service.DiscountService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

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
	@Override
	public void save(Discount discount) {
		discountRepo.save(discount);
	}
	@Override
	@Transactional
	public void create(DiscountDto discountDto) throws ParseException {
		Discount discount=new Discount();
		discount.setDiscountContent(discountDto.getDiscountContent());
		discount.setDiscountTitle(discountDto.getDiscountTitle());
		discount.setDiscountPercent(discountDto.getDiscountPercent());
		discount.setStartDate(formatStringToDate(discountDto.getStartDate()));
		discount.setEndDate(formatStringToDate(discountDto.getEndDate()));
		discountRepo.save(discount);
		
	}
	  private Date formatStringToDate(String date) throws ParseException {
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        return format.parse(date);
	    }
}
