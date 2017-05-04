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

import javax.transaction.Transactional;

import hvcntt.org.shoppingweb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountServiceImpl implements DiscountService {
    @Autowired
    private DiscountRepository discountRepository;

    @Autowired
    private ProductService productService;

    @Override
    public List<Discount> getAll() {
        return discountRepository.findAll();
    }

    @Override
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

    private Date formatStringToDate(String date) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.parse(date);
    }
}
