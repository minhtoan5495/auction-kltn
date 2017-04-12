package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
//import java.util.List;

import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import hvcntt.org.shoppingweb.service.UserService;

@Controller
public class ProfileController {

	@Autowired
	private UserService userService;
	/*@RequestMapping(value="/profile")
	public String profile(Model model){
		model.addAttribute("profile", userService.getAll());
		return "profile";
	}*/
	@RequestMapping(value="/profile")
	public String profile(Model model,Principal principal) throws UserNotFoundException {
		String username=principal.getName();
		model.addAttribute("user", userService.findByUsername(username));
		return "profile";
	}
}
