package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.Parent;

import java.util.List;

public interface ParentService {
    List<Parent> findAll();

    Parent findById(String parentId);

    void saveParent(Parent parent);

    void delete(Parent parent);

    Parent findByParentName(String parentName);
}
