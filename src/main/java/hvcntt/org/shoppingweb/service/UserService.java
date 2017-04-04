package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.model.User;

public interface UserService {
	void save(User user);
	User findByUsername(String username);
	List<User> getAll();
	User findOne(String id);
}
