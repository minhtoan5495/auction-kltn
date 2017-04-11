package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.exception.user.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.user.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.user.UserNotFoundException;

public interface UserService {

	void save(UserDto user) throws RoleNotFoundException, UserAlreadyExistsException;
	User findByUsername(String username) throws UserNotFoundException;
	List<User> getAll();

    User findByUsernameAndPassword(String username, String password);
}
