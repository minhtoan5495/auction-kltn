package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.Parent;

import java.util.List;

/**
 * Created by toannguyen on 28/04/2017.
 */
public interface ParentService {
    List<Parent> findAll();

    Parent findById(String parentId);

    void saveParent(Parent parent);

    void delete(Parent parent);

    Parent findByParentName(String parentName);
}
