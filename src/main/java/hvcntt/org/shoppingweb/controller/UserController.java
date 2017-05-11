package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    SecurityService securityService;

    @Autowired
    CityService cityService;

    @Autowired
    TokenToVerifyEmailService tokenToVerifyEmailService;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    private static final String USER_INVALID = "Tên tài khoản hoặc mật khẩu không đúng !";

    private static final String USER_NON_ACTIVE = "Tài khoản chưa được kích hoạt !";

    private static final String CONFIRM_PASSWORD_ERROR = "Nhập lại mật khẩu không đúng !";

    private static final String USERNAME_ERROR = "Tên tài khoản đã tồn tại !";

    private static final String PHONE_ERROR = "Số điện thoại đã được đăng kí !";

    private static final String EMAIL_ERROR = "Email đã có tài khoản đăng kí !";

    private static final String VERIFY_MESSAGE = "Vui lòng kiểm tra email để kích hoạt tài khoản !";

    private static final String EXPIRED = "Link đã hết hạn !";

    private static final String PROTOCOL = "http://";

    private static final String TOKEN_PARAMETER = "&token=";

    private static final String MAIL_SUBJECT = "Kích hoạt tài khoản";

    private static final String USERNAME_PARAMETER = "username=";

    private static final String URL = "/verifyAccount?";

    private static final String CONTENT = "Truy cập vào link bên dưới để kích hoạt tài khoản của bản." + "\n" + "Lưu ý: link chỉ có giới hạn trong vòng 1 ngày ! \r\n";

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
                                  @RequestParam(value = "logout", required = false) String logout,
                                  @RequestParam(value = "message", required = false) String message,
                                  @RequestParam(value = "username", required = false) String username,
                                  HttpServletRequest request,
                                  Model model) {
        model.addAttribute("userModel", new UserDto());
        ModelAndView modelAndView = new ModelAndView();
        if (error != null) {
            if (error.equals("userNonActive")) {
                model.addAttribute("error", USER_NON_ACTIVE);
            }
            if (error.equals("expired")) {
                model.addAttribute("error", EXPIRED);
                model.addAttribute("username", username);
            }
            if (error.equals("userInvalid")) {
                model.addAttribute("error", USER_INVALID);
            }
            String targetUrl = getRememberMeTargetUrlFromSession(request);
            if (StringUtils.hasText(targetUrl)) {
                modelAndView.addObject("targetUrl", targetUrl);
                modelAndView.addObject("home", true);
            }
        }
        if (message != null) {
            if (message.equals("active")) {
                model.addAttribute("message", VERIFY_MESSAGE);
            }
            if (message.equals("changePassword")) {
                model.addAttribute("message", "Thay đổi password thành công." + "\nVui lòng đăng nhập lại !");
            }
        }
        if (logout != null) {
            model.addAttribute("message", "Đăng xuất thành công !!");
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username, @RequestParam("password") String password) throws UserNotFoundException {
        User user = userService.findByUsername(username);
        if (user == null) {
            return "redirect:/login?error=" + "userInvalid";
        } else{
            if (!bCryptPasswordEncoder.matches(password, user.getPassword())) {
                return "redirect:/login?error=" + "userInvalid";
            }
            if (!user.isActive()) {
                return "redirect:/login?error=" + "userNonActive";
            }
        }
        securityService.autoLogin(username, password);
        return "redirect:/";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("cities", cityService.getAll());
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid UserDto userDto, HttpServletRequest request, Model model, BindingResult binding) throws RoleNotFoundException, UserAlreadyExistsException, ParseException, UserNotFoundException {
        if (binding.hasErrors()) {
            return "register";
        }
        if (!userDto.getConfirmPassword().equals(userDto.getPassword())) {
            model.addAttribute("error", CONFIRM_PASSWORD_ERROR);
            return "register";
        }
        if (userService.findByUsername(userDto.getUsername()) != null) {
            model.addAttribute("error", USERNAME_ERROR);
            return "register";
        }
        if (userService.findByEmail(userDto.getEmail()) != null) {
            model.addAttribute("error", EMAIL_ERROR);
            return "register";
        }
        if (userService.findByPhone(userDto.getPhone()) != null) {
            model.addAttribute("error", PHONE_ERROR);
            return "register";
        }
        userService.save(userDto);
        final String token = UUID.randomUUID().toString();
        tokenToVerifyEmailService.createTokenForUser(userDto.getUsername(), token);
        mailSender.send(constructResetTokenEmail(getAppUrl(request), token, userDto));
        return "redirect:/login?message=active";
    }

    @RequestMapping(value = "/activeAccount", method = RequestMethod.GET)
    public String activeAccount(@RequestParam("username") String username, HttpServletRequest request) throws UserNotFoundException {
        User user = userService.findByUsername(username);
        UserDto userDto = new UserDto();
        userDto.setUsername(username);
        userDto.setEmail(user.getEmail());
        final String token = UUID.randomUUID().toString();
        tokenToVerifyEmailService.createTokenForUser(username, token);
        mailSender.send(constructResetTokenEmail(getAppUrl(request), token, userDto));
        return "redirect:/login?message=active";
    }

    @RequestMapping(value = "/verifyAccount", method = RequestMethod.GET)
    public ModelAndView showChangePasswordPage(@RequestParam("username") String username, @RequestParam("token") final String token) throws UserNotFoundException {
        ModelAndView modelAndView = new ModelAndView();
        boolean checkToken = tokenToVerifyEmailService.validateToken(username, token);
        if (!checkToken) {
            modelAndView.setViewName("redirect:/login?error=expired&username=" + username);
            return modelAndView;
        } else {
            User user = userService.findByUsername(username);
            user.setActive(true);
            userService.save(user);
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }

    private String getRememberMeTargetUrlFromSession(HttpServletRequest request) {
        String targetUrl = "";
        HttpSession session = request.getSession(false);
        if (session != null) {
            targetUrl = session.getAttribute("targetUrl") == null ? ""
                    : session.getAttribute("targetUrl").toString();
        }
        return targetUrl;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    private SimpleMailMessage constructResetTokenEmail(final String contextPath, final String token, final UserDto userDto) {
        StringBuilder url = new StringBuilder(CONTENT);
        url.append(contextPath);
        url.append(URL);
        url.append(USERNAME_PARAMETER);
        url.append(userDto.getUsername());
        url.append(TOKEN_PARAMETER);
        url.append(token).toString();
        return constructEmail(MAIL_SUBJECT, url.toString(), userDto);
    }

    private SimpleMailMessage constructEmail(String subject, String body, UserDto userDto) {
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(userDto.getEmail());
        return email;
    }

    private String getAppUrl(HttpServletRequest request) {
        final StringBuilder url = new StringBuilder(PROTOCOL);
        url.append(request.getServerName());
        url.append(":");
        url.append(request.getServerPort());
        url.append(request.getContextPath());
        return url.toString();
    }
}
