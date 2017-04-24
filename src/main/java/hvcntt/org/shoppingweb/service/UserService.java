package hvcntt.org.shoppingweb.service;

import java.text.ParseException;
import java.util.List;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;

public interface UserService {

	void save(UserDto userDto) throws RoleNotFoundException, UserAlreadyExistsException, ParseException;
	User findByUsername(String username) throws UserNotFoundException;
	List<User> getAll();
	User findByEmail(String email);
	User findByPhone(String phone);
    void deleteUser(String username) throws UserNotFoundException;
	void save(User user);
	User findByUsernameAndPhoneAndEmail(String username, String phone, String email);
}
