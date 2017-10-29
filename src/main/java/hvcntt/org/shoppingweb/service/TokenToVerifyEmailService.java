package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.exception.UserNotFoundException;

public interface TokenToVerifyEmailService {
    void createTokenForUser(String username, String token) throws UserNotFoundException;

    boolean validateToken(String username, String token);
}
