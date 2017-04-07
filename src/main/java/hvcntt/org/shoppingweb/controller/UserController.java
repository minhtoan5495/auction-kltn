package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.model.UserModel;
import hvcntt.org.shoppingweb.exception.user.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.user.UserAlreadyExistsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hvcntt.org.shoppingweb.service.UserService;
import hvcntt.org.shoppingweb.validator.UserValidator;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
                                  @RequestParam(value = "logout", required = false) String logout,
                                  HttpServletRequest request,
                                  Model model) {
        UserModel userModel = new UserModel();
        model.addAttribute("userModel", userModel);
        ModelAndView modelAndView = new ModelAndView();
        if (error != null) {
            model.addAttribute("error", "User or password invalid");
            String targetUrl = getRememberMeTargetUrlFromSession(request);
            System.out.println(targetUrl);
            if (StringUtils.hasText(targetUrl)) {
                modelAndView.addObject("targetUrl", targetUrl);
                modelAndView.addObject("homePage", true);
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
        model.addAttribute("user", new UserModel());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute("user") UserModel user, BindingResult binding) throws RoleNotFoundException, UserAlreadyExistsException {
//        userValidator.validate(user, binding);
        if (binding.hasErrors()) {
            return "register";
        }
        userService.save(user);
        return "redirect:/home";
    }

    @RequestMapping(value = {"/forgetPassword"})
    public String forgetPassword() {
        return "forgetPassword";
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
}