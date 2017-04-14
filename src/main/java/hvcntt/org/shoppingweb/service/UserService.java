package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;

public interface UserService {

	void save(UserDto userDto) throws RoleNotFoundException, UserAlreadyExistsException;
	User findByUsername(String username) throws UserNotFoundException;
	List<User> getAll();
    User findByUsernameAndPassword(String username, String password);
	User findByEmail(String email);
	User findByPhone(String phone);
	//void saveUser(User user) throws RoleNotFoundException;
}
