package hvcntt.org.shoppingweb.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.ShippingInfo;
import hvcntt.org.shoppingweb.dao.repository.ShippingInfoRepository;
import hvcntt.org.shoppingweb.service.ShippingInfoService;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ShippingInfoServiceImpl implements ShippingInfoService {
    @Autowired
    ShippingInfoRepository shippingInfoRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(ShippingInfo shippingInfo){
        shippingInfoRepository.save(shippingInfo);
    }

}
