package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.dao.repository.ParentRepository;
import hvcntt.org.shoppingweb.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by toannguyen on 28/04/2017.
 */
@Service
public class ParentServiceImpl implements ParentService {

    @Autowired
    ParentRepository parentRepository;

    @Override
    public List<Parent> findAll() {
        return parentRepository.findAll();
    }

    @Override
    public Parent findById(String parentId) {
        return parentRepository.findOne(parentId);
    }

    @Override
    public void saveParent(Parent parent) {
        parentRepository.save(parent);
    }

    @Override
    public void delete(Parent parent) {
        parentRepository.delete(parent);
    }
}
