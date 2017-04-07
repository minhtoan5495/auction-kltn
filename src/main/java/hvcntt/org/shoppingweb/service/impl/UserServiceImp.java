package hvcntt.org.shoppingweb.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import hvcntt.org.shoppingweb.dao.model.UserModel;
import hvcntt.org.shoppingweb.exception.user.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.user.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.user.UserNotFoundException;
import hvcntt.org.shoppingweb.service.SecurityService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.entity.Role;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.repository.RoleRepository;
import hvcntt.org.shoppingweb.dao.repository.UserRepository;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    @Transactional
    public void save(UserModel userModel) throws RoleNotFoundException, UserAlreadyExistsException {
        if (userRepository.findByEmail(userModel.getEmail()) != null) {
            throw new UserAlreadyExistsException("USER IS EXITS : " + userModel.getUsername());
        }

        if (userRepository.findByUsername(userModel.getUsername()) != null) {
            throw new UserAlreadyExistsException("USER IS EXITS : " + userModel.getEmail());
        }

//        if (userRepository.findByPhone(userModel.getPhone()) != null) {
//            throw new UserAlreadyExistsException("USER IS EXITS : " + userModel.getPhone());
//        }
        User user = convertUserModelToUser(userModel);
        userRepository.save(user);
//        securityService.autologin(user.getUsername(), user.getPassword());
    }

    private User convertUserModelToUser(UserModel userModel) throws RoleNotFoundException {
        Role role = roleRepository.findByName("ROLE_USER");
        if (role == null) {
            throw new RoleNotFoundException("ROLE NOT FOUND");
        }
        Set<Role> roles = new HashSet<>();
        User user = new User();
        user.setPassword(bCryptPasswordEncoder.encode(userModel.getPassword()));
        user.setUsername(userModel.getUsername());
        user.setAddress(userModel.getAddress());
        user.setPhone(userModel.getPhone());
        user.setEmail(userModel.getEmail());
        user.setBirthday(userModel.getBirthday());
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
    public User findByUsernameAndPassword(String username, String password) {
        return userRepository.findByUsernameAndPassword(username, password);
    }

}
