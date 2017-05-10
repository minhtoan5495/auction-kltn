package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.TokenToVerifyEmail;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.repository.TokenToVerifyEmailRepository;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.TokenToVerifyEmailService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;

/**
 * Created by toannguyen on 10/05/2017.
 */
@Service
public class TokenToVerifyEmailServiceImpl implements TokenToVerifyEmailService {

    @Autowired
    UserService userService;

    @Autowired
    TokenToVerifyEmailRepository tokenToVerifyEmailRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void createTokenForUser(String username, String token) throws UserNotFoundException {
        User user = userService.findByUsername(username);
        TokenToVerifyEmail myTokenToVerifyEmail = new TokenToVerifyEmail(user, token);
        tokenToVerifyEmailRepository.save(myTokenToVerifyEmail);
    }

    @Override
    public boolean validateToken(String username, String token) {
        final TokenToVerifyEmail tokenToVerifyEmail1 = tokenToVerifyEmailRepository.findByToken(token);
        if (!isExitToken(tokenToVerifyEmail1) || !isMatchTokenAndAccountId(tokenToVerifyEmail1, username, token) || isExpiryDate(tokenToVerifyEmail1)) {
            return false;
        }
        return true;
    }

    private boolean isExitToken(TokenToVerifyEmail tokenToVerifyEmail){
        return  tokenToVerifyEmail != null;
    }

    private boolean isMatchTokenAndAccountId(TokenToVerifyEmail tokenToVerifyEmail,String username, String token){
        return  (tokenToVerifyEmail.getUser().getUsername().equals(username) && tokenToVerifyEmail.getToken().equals(token));
    }
    private boolean isExpiryDate(TokenToVerifyEmail tokenToVerifyEmail){
        final Calendar calendar = Calendar.getInstance();
        return ((tokenToVerifyEmail.getExpiryDate().getTime() - calendar.getTime().getTime()) <= 0)? true : false;
    }
}
