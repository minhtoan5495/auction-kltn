package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.dao.entity.UserAttempt;

public interface UserAttemptsService {

	boolean checkAttempts(String username);
	void save(UserAttempt userAttempt);
	void lockUser(String username);
	void insertAttempts(String username);
	void updateAttempts(String username);
	void resetAttempts(String username);
	UserAttempt getAttemptsEntity(String name);
	int getCountAttempts(String username);
}
