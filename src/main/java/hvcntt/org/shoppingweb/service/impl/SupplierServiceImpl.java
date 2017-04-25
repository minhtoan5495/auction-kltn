package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.Supplier;
import hvcntt.org.shoppingweb.dao.repository.SupplierRepository;
import hvcntt.org.shoppingweb.service.SupplierService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    SupplierRepository supplierRepository;

    @Override
    public List<Supplier> getAll() {
        return supplierRepository.findAll();
    }
}
