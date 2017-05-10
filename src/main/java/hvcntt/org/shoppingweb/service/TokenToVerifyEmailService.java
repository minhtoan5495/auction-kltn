package hvcntt.org.shoppingweb.service;

import hvcntt.org.shoppingweb.exception.UserNotFoundException;

/**
 * Created by toannguyen on 10/05/2017.
 */
public interface TokenToVerifyEmailService {
    void createTokenForUser(String username, String token) throws UserNotFoundException;

    boolean validateToken(String username, String token);
}
