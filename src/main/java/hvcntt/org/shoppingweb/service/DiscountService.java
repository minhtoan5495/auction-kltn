package hvcntt.org.shoppingweb.service;import java.text.ParseException;import java.util.Date;import java.util.List;import hvcntt.org.shoppingweb.dao.dto.DiscountDto;import hvcntt.org.shoppingweb.dao.entity.Discount;/** * Created by Nguyen on 12/04/2017. */public interface DiscountService {	List<Discount> getAll();	void save(Discount discount);	void create(DiscountDto discountDto) throws ParseException;	void create(String discountTitle, String discountContent, int discountPercent, String startDate, String endDate, List<String> productIds) throws ParseException;}