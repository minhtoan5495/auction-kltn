package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.service.AddressShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.AddressShippingRepository;

@Service
public class AddressShipServiceImp implements AddressShipService {

	@Autowired
	private AddressShippingRepository addressRepo;

	@Override
	public ShippingInfo create(ShippingInfo address) {
		// TODO Auto-generated method stub
		return addressRepo.save(address);
	}

}
