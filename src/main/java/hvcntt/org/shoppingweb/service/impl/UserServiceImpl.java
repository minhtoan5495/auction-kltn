package hvcntt.org.shoppingweb.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.Role;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.RoleRepository;
import hvcntt.org.shoppingweb.dao.repository.UserRepository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
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
        user.setPhone(userDto.getPhone());
        user.setEmail(userDto.getEmail());
        user.setAccountNonLocked(true);
        user.setActive(false);
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

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void deleteUser(String username) throws UserNotFoundException {
        if (userRepository.findOne(username) != null) {
            userRepository.delete(username);
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void resetPassword(UserDto userDto) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
//        User user = userRepository.findByUsername(username);
        String password = bCryptPasswordEncoder.encode(userDto.getPassword());
        userRepository.updatePassword(username, password);
    }


}
