package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.DiscountDto;
import hvcntt.org.shoppingweb.dao.entity.Discount;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.dao.repository.DiscountRepository;
/*import hvcntt.org.shoppingweb.service.AuctionService;*/
import hvcntt.org.shoppingweb.service.DiscountService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hvcntt.org.shoppingweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DiscountServiceImpl implements DiscountService {
    @Autowired
    DiscountRepository discountRepository;

    @Autowired
    ProductService productService;

    @Override
    public List<Discount> getAll() {
        return discountRepository.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(Discount discount) {
        discountRepository.save(discount);
    }

    @Override
    @Transactional
    public void create(DiscountDto discountDto) throws ParseException {
        Discount discount = new Discount();
        discount.setDiscountContent(discountDto.getDiscountContent());
        discount.setDiscountTitle(discountDto.getDiscountTitle());
        discount.setDiscountPercent(discountDto.getDiscountPercent());
        discount.setStartDate(formatStringToDate(discountDto.getStartDate()));
        discount.setEndDate(formatStringToDate(discountDto.getEndDate()));
        List<Product> products = productService.findByIds(discountDto.getProductIds());
        discount.setProducts(products);
        discountRepository.save(discount);

    }

    @Override
    public void create(String discountTitle, String discountContent, int discountPercent, String startDate, String endDate, List<String> productIds) throws ParseException {
        Discount discount = new Discount();
        discount.setDiscountContent(discountContent);
        discount.setDiscountTitle(discountTitle);
        discount.setDiscountPercent(discountPercent);
        discount.setStartDate(formatStringToDate(startDate));
        discount.setEndDate(formatStringToDate(endDate));
        List<String> productIdsNew = new ArrayList<>();
        for(String productId : productIds){
            int beginIndex = productId.indexOf("productId\":\"");
            int endIndex = productId.indexOf("\"}");
            String productIdNew = productId.substring(beginIndex + 12, endIndex);
            productIdsNew.add(productIdNew);
        }
        List<Product> products = productService.findByIds(productIdsNew);
        discount.setProducts(products);
        discountRepository.save(discount);
    }

    @Override
    public void deleteDiscount(String discountId) {
        discountRepository.delete(discountId);
    }

    @Override
    public void update(String discountTitle, String discountContent, int discountPercent, String discountId) {
        Discount discount = discountRepository.findOne(discountId);
        discount.setDiscountContent(discountContent);
        discount.setDiscountTitle(discountTitle);
        discount.setDiscountPercent(discountPercent);
        discountRepository.save(discount);
    }

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.parse(date);
    }
}
