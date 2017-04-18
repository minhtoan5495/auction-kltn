package hvcntt.org.shoppingweb.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.transaction.Transactional;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.Role;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
//import hvcntt.org.shoppingweb.exception.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
//import hvcntt.org.shoppingweb.service.SecurityService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.RoleRepository;
import hvcntt.org.shoppingweb.dao.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    @Transactional
    public void save(UserDto userDto) throws RoleNotFoundException, ParseException {
        User user = convertUserModelToUser(userDto);
        userRepository.save(user);
    }
    private User convertUserModelToUser(UserDto userDto) throws RoleNotFoundException, ParseException {
        Role role = roleRepository.findByRoleName("ROLE_USER");
        if (role == null) {
            throw new RoleNotFoundException("ROLE NOT FOUND");
        }
        List<Role> roles = new ArrayList<>();
        User user = new User();
        user.setName(userDto.getName());
        user.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
        user.setUsername(userDto.getUsername());
        user.setAddress(userDto.getAddress());
        user.setPhone(userDto.getPhone());
        user.setEmail(userDto.getEmail());
        user.setBirthday(userDto.getBirthday());
        user.setAccountNonLocked(true);
        roles.add(role);
        user.setRoles(roles);
        return user;
    }

    @Override
    public User findByUsername(String username) throws UserNotFoundException {
        return userRepository.findByUsername(username);

    }

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findByPhone(String phone) {
        return userRepository.findByPhone(phone);
    }

}
