package hvcntt.org.shoppingweb.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.ShippingInfo;
import hvcntt.org.shoppingweb.dao.repository.ShippingInfoRepository;
import hvcntt.org.shoppingweb.service.ShippingInfoService;

@Service
public class ShippingInfoServiceImpl implements ShippingInfoService {
	@Autowired
	ShippingInfoRepository shippingRepo;
	@Override	
	public ShippingInfo create(ShippingInfo shippingInfo) {
		// TODO Auto-generated method stub
		return shippingRepo.save(shippingInfo);
	}

}
