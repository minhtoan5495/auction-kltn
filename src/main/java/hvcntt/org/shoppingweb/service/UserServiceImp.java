package hvcntt.org.shoppingweb.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.Role;
import hvcntt.org.shoppingweb.model.User;
import hvcntt.org.shoppingweb.repository.RoleRepository;
import hvcntt.org.shoppingweb.repository.UserRepository;
@Service
public class UserServiceImp implements UserService{
	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Override
	@Transactional
	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		Set<Role> roles = new HashSet<Role>(roleRepository.findAll());
		Set<Role> roleUser=new HashSet<Role>();
		for (Role role:roles){
			if("2"==role.getIdrole()){
				roleUser.add(role);
				break;
			}
		}
		user.setRoles(roleUser);
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	@Override
	public User findOne(String id) {
		// TODO Auto-generated method stub
		return userRepository.findOne(id);
	}

}
