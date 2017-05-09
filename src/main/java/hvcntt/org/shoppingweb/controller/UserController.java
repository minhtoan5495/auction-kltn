package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.CityService;
import hvcntt.org.shoppingweb.service.SecurityService;
import hvcntt.org.shoppingweb.service.UserAttemptsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    SecurityService securityService;

    @Autowired
    CityService cityService;

    public static final String MESSAGE_ERROR = "Tên tài khoản hoặc mật khẩu không đúng";

    public static final String CONFIRM_PASSWORD_ERROR = "Nhập lại mật khẩu không đúng";

    public static final String USERNAME_ERROR = "Tên tài khoản đã tồn tại";

    public static final String PHONE_ERROR = "Số điện thoại đã được đăng kí";

    public static final String EMAIL_ERROR = "Email đã có tài khoản đăng kí";

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
                                  @RequestParam(value = "logout", required = false) String logout,
                                  HttpServletRequest request,
                                  Model model) {
        model.addAttribute("userModel", new UserDto());
        ModelAndView modelAndView = new ModelAndView();
        if (error != null) {
            model.addAttribute("error", MESSAGE_ERROR);
            String targetUrl = getRememberMeTargetUrlFromSession(request);
            if (StringUtils.hasText(targetUrl)) {
                modelAndView.addObject("targetUrl", targetUrl);
                modelAndView.addObject("home", true);
            }
        }
        if (logout != null) {
            model.addAttribute("message", "Successfully");
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("cities", cityService.getAll());
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid UserDto userDto,Model model, BindingResult binding) throws RoleNotFoundException, UserAlreadyExistsException, ParseException, UserNotFoundException {
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
        securityService.autologin(userDto.getUsername(), userDto.getPassword());
        return "redirect:/home";
    }

//    @RequestMapping(value = {"/forgetPassword"})
//    public String forgetPassword() {
//        return "forgetPassword";
//    }

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
}
