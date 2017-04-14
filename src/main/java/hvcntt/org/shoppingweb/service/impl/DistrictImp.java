package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.District;
import hvcntt.org.shoppingweb.dao.repository.DistrictRepository;
import hvcntt.org.shoppingweb.service.DistrictService;
@Service
public class DistrictImp implements DistrictService{
	@Autowired
	DistrictRepository districtRepo;
	@Override
	public List<District> getAll() {
		// TODO Auto-generated method stub
		return districtRepo.findAll();
	}

}
