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
	CityRepository cityRepository;
	@Override
	public List<City> getAll() {
		return cityRepository.findAll();
	}

	@Override
	public City findById(String cityId) {
		return cityRepository.findOne(cityId);
	}

}
