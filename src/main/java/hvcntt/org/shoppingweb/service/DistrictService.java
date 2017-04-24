package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.City;
import hvcntt.org.shoppingweb.dao.entity.District;

public interface DistrictService {
	List<District> getAll();

	List<District> findByCity(City city);
}
