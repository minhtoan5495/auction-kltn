package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.Account;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.service.UserAttemptsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hvcntt.org.shoppingweb.dao.repository.UserRepository;

import java.util.Calendar;
import java.util.Date;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	private static Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserAttemptsService userAttemptsService;

	@Override
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User userEntity = null;
		userEntity = userRepository.findByUsername(username);
		if (userEntity == null)
			throw new UsernameNotFoundException("No such user: " + username);
		else {
			Account acc = new Account(userEntity);
			logger.info("========== User Info: ", acc.toString());
			if (userAttemptsService.getAttemptsEntity(acc.getUsername()) != null && isTimeUp(userAttemptsService.getAttemptsEntity(username).getLastModified()))
				userAttemptsService.resetAttempts(username);
			return acc;
		}
	}

	public boolean isTimeUp(Date d) {
		Calendar timeLocked = Calendar.getInstance();
		timeLocked.setTime(d);
		timeLocked.add(Calendar.MINUTE, 5);
		Calendar currentTime = Calendar.getInstance();
		currentTime.setTime(new Date());
		if (currentTime.getTime().after(timeLocked.getTime())){
			return true;
		}
		return false;
	}
}
