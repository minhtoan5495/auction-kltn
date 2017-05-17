package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.City;
import hvcntt.org.shoppingweb.dao.entity.District;
import hvcntt.org.shoppingweb.dao.entity.Role;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.dao.repository.RoleRepository;
import hvcntt.org.shoppingweb.exception.RoleNotFoundException;
import hvcntt.org.shoppingweb.exception.UserAlreadyExistsException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.CityService;
import hvcntt.org.shoppingweb.service.DistrictService;
import hvcntt.org.shoppingweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ManageAccountController {

	@Autowired
	UserService userService;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	CityService cityService;

	@Autowired
	DistrictService districtService;

	@RequestMapping(value = "/admin")
	public String admin(){
		return "redirect:/admin/manageAccount";
	}

	@RequestMapping("/admin/manageAccount")
	public String listAllAccount(Model model, @RequestParam(value = "message", required = false) String message){
		if("saveSuccess".equals(message)){
			model.addAttribute("message", "Saved user successfully !!");
		}
		if("deleteSuccess".equals(message)){
			model.addAttribute("message", "Deleted user successfully !!");
		}
		List<User> users = userService.getAll();
		model.addAttribute("users", users);
		return "manageAccount";
	}

	@RequestMapping(value = "/admin/getDistrict", method = RequestMethod.GET)
	public @ResponseBody List<District> getDistrict(@RequestParam(value = "cityId") String cityId){
		City city = cityService.findById(cityId);
		List<District> districts = districtService.findByCity(city);
		return districts;
	}

	@RequestMapping(value = "/admin/deleteAccount", method = RequestMethod.GET)
	public @ResponseBody String deleteAccount(@RequestParam(value = "username") String username) throws UserNotFoundException {
		userService.deleteUser(username);
		return "Deleted success username : " + username;
	}

	@RequestMapping(value = "/admin/updateRole", method = RequestMethod.POST)
	public String editAccount(HttpServletRequest request) throws ParseException, UserAlreadyExistsException, RoleNotFoundException, UserNotFoundException {
		User user = userService.findByUsername(request.getParameter("username"));
		String[] roleIds = request.getParameterValues("roleId");
		if(roleIds == null){
			return  "redirect:/admin/editRole?username="+user.getUsername() + "&message=invalidInput";
		}
		List<Role> roles = new ArrayList<>();
		for (String roleId : roleIds){
			roles.add(roleRepository.findOne(roleId));
		}
		user.setRoles(roles);
		userService.save(user);
		return  "redirect:/admin/manageAccount?message=saveSuccess";
	}

	@RequestMapping(value = "/admin/editRole", method = RequestMethod.GET)
	public String editRole(@RequestParam("username") String username, Model model, @RequestParam(value = "message", required = false) String message) throws UserNotFoundException {
		if("invalidInput".equals(message)){
			model.addAttribute("error", "Please select one in roles !!");
		}
		model.addAttribute("user", userService.findByUsername(username));
		model.addAttribute("roles", roleRepository.findAll());
		return "updateRole";
	}

	@RequestMapping(value = "/deny")
	public String deny(){
		return "deny";
	}
}
