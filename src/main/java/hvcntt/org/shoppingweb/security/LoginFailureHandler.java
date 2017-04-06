package hvcntt.org.shoppingweb.security;

import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.entity.UserAttempt;
import hvcntt.org.shoppingweb.exception.user.UserNotFoundException;
import hvcntt.org.shoppingweb.service.UserAttemptsService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Autowired
    private UserAttemptsService userAttemptsService;

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        String username = request.getParameter("username");
        UserAttempt userAttempt = userAttemptsService.getAttemptsEntity(username);
        User user = userService.findByUsername(username);
        if (user == null)
                exception = new BadCredentialsException("Username or Password wrong");
            else if (isExists(username)){
                userAttemptsService.insertAttempts(username);
                exception = new BadCredentialsException("Username or Password wrong");
            }else if (userAttempt.getAttempts() >= 3) {
                userAttemptsService.lockUser(username);
                exception = new LockedException("Account is Locked from " +  new SimpleDateFormat("HH:mm dd-MM-yyyy").format(userAttempt.getLastModified()));
            } else {
                userAttemptsService.updateAttempts(username);
                exception = new BadCredentialsException("Username or Password wrong");
            }
        super.onAuthenticationFailure(request, response, exception);
    }

    public boolean isExists(String username) {
        return userAttemptsService.checkAttempts(username);
    }
}