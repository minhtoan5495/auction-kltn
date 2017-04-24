package hvcntt.org.shoppingweb.controller;

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
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	UserService userService;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	CityService cityService;

	@Autowired
	DistrictService districtService;

	@RequestMapping
	public String admin(){
		return "redirect:/admin/manageAccount";
	}

	@RequestMapping("/manageAccount")
	public String listAllAccount(Model model){
		List<User> users = userService.getAll();
		model.addAttribute("roles", roleRepository.findAll());
		model.addAttribute("cities", cityService.getAll());
		model.addAttribute("userDto", new UserDto());
		model.addAttribute("users", users);
		return "manageAccount";
	}

	@RequestMapping(value = "/getDistrict", method = RequestMethod.GET)
	public @ResponseBody List<District> getDistrict(@RequestParam(value = "cityId") String cityId){
		City city = cityService.findById(cityId);
		List<District> districts = districtService.findByCity(city);
		return districts;
	}

	@RequestMapping(value = "/deleteAccount", method = RequestMethod.GET)
	public void deleteAccount(@RequestParam(value = "username") String username) throws UserNotFoundException {
		userService.deleteUser(username);
	}

	@RequestMapping(value = "/editAccount", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public String editAccount(HttpServletRequest request) throws ParseException, UserAlreadyExistsException, RoleNotFoundException {
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setName(request.getParameter("name"));
		user.setAddress(request.getParameter("address"));
		user.setEmail(request.getParameter("email"));
		user.setBirthday(formatStringToDate(request.getParameter("birthday")));
		user.setPhone(request.getParameter("phone"));
		String role = request.getParameter("role");
		List<Role> roles = new ArrayList<>();
		roles.add(roleRepository.findByRoleName(role));
		user.setRoles(roles);
		userService.save(user);
		return "redirect:/admin/manageAccount";
	}

	private Date formatStringToDate(String date) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.parse(date);
	}
}
