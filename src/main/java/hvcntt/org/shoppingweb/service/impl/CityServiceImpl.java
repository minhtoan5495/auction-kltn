package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.City;
import hvcntt.org.shoppingweb.dao.repository.CityRepository;
import hvcntt.org.shoppingweb.service.CityService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityServiceImpl implements CityService {
	@Autowired
	CityRepository cityRepo;
	@Override
	public List<City> getAll() {
		// TODO Auto-generated method stub
		return cityRepo.findAll();
	}

}
