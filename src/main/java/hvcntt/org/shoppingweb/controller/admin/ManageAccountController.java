package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.dto.Constant;
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
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
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
    public String admin() {
        return "redirect:/admin/manageAccount";
    }

    @RequestMapping("/admin/manageAccount")
    public String listAllAccount(Model model, HttpSession session) {
        if ("saveSuccess".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.SAVE_SUCCESSFULLY);
            session.removeAttribute("message");
        }
        if ("deleteSuccess".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.DELETE_SUCCESSFULLY);
            session.removeAttribute("message");
        }
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        return "manageAccount";
    }

    @RequestMapping(value = "/admin/getDistrict", method = RequestMethod.GET)
    public
    @ResponseBody
    List<District> getDistrict(@RequestParam(value = "cityId") String cityId) {
        City city = cityService.findById(cityId);
        return districtService.findByCity(city);
    }

    @RequestMapping(value = "/admin/deleteAccount", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteAccount(@RequestParam(value = "username") String username) throws UserNotFoundException {
        userService.deleteUser(username);
        return Constant.DELETE_SUCCESSFULLY;
    }

    @RequestMapping(value = "/admin/updateRole", method = RequestMethod.POST)
    public String editAccount(HttpServletRequest request, HttpSession session) throws ParseException, UserAlreadyExistsException, RoleNotFoundException, UserNotFoundException {
        User user = userService.findByUsername(request.getParameter("username"));
        String[] roleIds = request.getParameterValues("roleId");
        if (roleIds == null) {
            session.setAttribute("message", "invalidInput");
            return "redirect:/admin/editRole?username=" + user.getUsername();
        }
        List<Role> roles = new ArrayList<>();
        for (String roleId : roleIds) {
            roles.add(roleRepository.findOne(roleId));
        }
        user.setRoles(roles);
        userService.save(user);
        session.setAttribute("message", "saveSuccess");
        return "redirect:/admin/manageAccount";
    }

    @RequestMapping(value = "/admin/editRole", method = RequestMethod.GET)
    public String editRole(@RequestParam("username") String username, HttpSession session, Model model) throws UserNotFoundException {
        if ("invalidInput".equals(session.getAttribute("message"))) {
            model.addAttribute("error", Constant.PLEASE_SELECT_ROLE);
            session.removeAttribute("message");
        }
        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("roles", roleRepository.findAll());
        return "updateRole";
    }

    @RequestMapping(value = "/deny")
    public String deny() {
        return "deny";
    }
}
