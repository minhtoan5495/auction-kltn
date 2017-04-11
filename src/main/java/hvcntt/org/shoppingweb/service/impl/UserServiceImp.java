package hvcntt.org.shoppingweb.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.exception.user.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.user.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.user.UserNotFoundException;
import hvcntt.org.shoppingweb.service.SecurityService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
    public void save(UserDto userDto) throws RoleNotFoundException, UserAlreadyExistsException {
        if (userRepository.findByUsername(userDto.getUsername()) != null) {
            throw new UserAlreadyExistsException("USER IS EXITS : " + userDto.getUsername());
        }

        if (userRepository.findByEmail(userDto.getEmail()) != null) {
            throw new UserAlreadyExistsException("USER IS EXITS : " + userDto.getEmail());
        }

        if (userRepository.findByPhone(userDto.getPhone()) != null) {
            throw new UserAlreadyExistsException("USER IS EXITS : " + userDto.getPhone());
        }
        User user = convertUserModelToUser(userDto);
        userRepository.save(user);
        securityService.autologin(user.getUsername(), user.getPassword());
    }

    private User convertUserModelToUser(UserDto userDto) throws RoleNotFoundException {
        Role role = roleRepository.findByName("ROLE_USER");
        if (role == null) {
            throw new RoleNotFoundException("ROLE NOT FOUND");
        }
        Set<Role> roles = new HashSet<>();
        User user = new User();
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
    public User findByUsernameAndPassword(String username, String password) {
        return userRepository.findByUsernameAndPassword(username, password);
    }

}
