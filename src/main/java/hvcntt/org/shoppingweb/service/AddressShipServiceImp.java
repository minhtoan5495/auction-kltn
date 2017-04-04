package hvcntt.org.shoppingweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.ShippingInfor;
import hvcntt.org.shoppingweb.repository.AddressShippingRepository;
@Service
public class AddressShipServiceImp implements AddressShipService{
	@Autowired
	AddressShippingRepository addressRepo;
	@Override
	public ShippingInfor create(ShippingInfor address) {
		// TODO Auto-generated method stub
		return addressRepo.save(address);
	}

}
