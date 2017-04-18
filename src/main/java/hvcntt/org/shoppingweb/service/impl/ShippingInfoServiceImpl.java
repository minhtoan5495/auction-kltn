package hvcntt.org.shoppingweb.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.entity.ShippingInfo;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.repository.InvoiceStatusRepository;
import hvcntt.org.shoppingweb.dao.repository.ShippingInfoRepository;
import hvcntt.org.shoppingweb.dao.repository.UserRepository;
import hvcntt.org.shoppingweb.service.InvoiceService;
import hvcntt.org.shoppingweb.service.ShippingInfoService;

@Service
public class ShippingInfoServiceImpl implements ShippingInfoService {
	@Autowired
	ShippingInfoRepository shippingRepo;
	@Autowired
	InvoiceStatusRepository invoiceStatusRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	InvoiceService invoiceService;
	@Override	
	public ShippingInfo create(ShippingInfo shippingInfo) throws ParseException {
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		String username=auth.getName();
		User user=userRepository.findByUsername(username);
		Invoice invoice=new Invoice();
		invoice.setCreateDate(new Date());
		invoice.setInvoiceStatus(invoiceStatusRepository.findByInvoiceStatusName("Đang xử lý"));
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy");
    	Calendar c=Calendar.getInstance();
    	Date deliver=new Date();
    	c.setTime(deliver);
    	c.roll(Calendar.DATE, 7);
    	String shippDate=dateFormat.format(c.getTime());
    	invoice.setShipDate(dateFormat.parse(shippDate));
    	invoice.setUsername(user.getUsername());
    	shippingInfo.setInvoice(invoice);
    	invoiceService.save(invoice);
		return shippingRepo.save(shippingInfo);
	}

}
