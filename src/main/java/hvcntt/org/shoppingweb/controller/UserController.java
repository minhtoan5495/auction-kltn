package hvcntt.org.shoppingweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hvcntt.org.shoppingweb.model.User;
//import hvcntt.org.shoppingweb.service.InformationService;
import hvcntt.org.shoppingweb.service.SecurityService;
import hvcntt.org.shoppingweb.service.UserService;
import hvcntt.org.shoppingweb.validator.UserValidator;

@Controller
public class UserController {
//	@Autowired
//	InformationService customerservice;
	@Autowired
	UserService userService;
	@Autowired
	SecurityService securityService;
	@Autowired
	private UserValidator userValidator;
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginPage(Model model,String error,String logout){
		if(error!=null){
			model.addAttribute("error","Tên đăng nhập hoặc mật khẩu không đúng");
		}
		if(logout!=null){
			model.addAttribute("message", "Đăng xuất thành công");
		}
		return "login";
	}
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model){
		model.addAttribute("user", new User());
		return "register";
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(@ModelAttribute("user")User user,BindingResult binding){
		userValidator.validate(user, binding);
		if(binding.hasErrors()){
			return "register";
		}
		userService.save(user);
		securityService.autologin(user.getUsername(), user.getPasswordConfirm());
		return "redirect:/home";
	}
	@RequestMapping(value={"/forgetPassword"})
	public String forgetPassword(){
		return "forgetPassword";
	}
}
