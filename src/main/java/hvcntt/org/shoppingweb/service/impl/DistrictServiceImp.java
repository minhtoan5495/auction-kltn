package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.District;
import hvcntt.org.shoppingweb.dao.repository.DistrictRepository;
import hvcntt.org.shoppingweb.service.DistrictService;

@Service
public class DistrictServiceImp implements DistrictService {
    @Autowired
    DistrictRepository districtRepository;

    @Override
    public List<District> getAll() {
        return districtRepository.findAll();
    }

    @Override
    public List<District> findByCity(City city) {
        return districtRepository.findByCity(city);
    }

    @Override
    public District findById(String districtId) {
        return districtRepository.findOne(districtId);
    }

}
