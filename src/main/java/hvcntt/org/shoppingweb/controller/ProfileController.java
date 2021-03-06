package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hvcntt.org.shoppingweb.dao.dto.*;
import hvcntt.org.shoppingweb.dao.dto.InvoiceStatus;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import hvcntt.org.shoppingweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProfileController {

    @Autowired
    InvoiceService invoiceService;

    @Autowired
    UserService userService;

    @Autowired
    UserAuctionService userAuctionService;

    @Autowired
    ParentService parentService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    CityService cityService;

    @Autowired
    DistrictService districtService;


    @ModelAttribute("parents")
    public List<Parent> parent() {
        return parentService.findAll();
    }

    @RequestMapping(value = "/profile")
    public String profile(Model model, Principal principal, HttpSession session) throws UserNotFoundException {
        if ("updateProfile".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.SAVE_SUCCESSFULLY);
            session.removeAttribute("message");
        }
        if ("changePassword".equals(session.getAttribute("message"))) {
            model.addAttribute("message", Constant.SAVE_SUCCESSFULLY);
            session.removeAttribute("message");
        }
        String username = principal.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("invoices", invoiceService.getAll());
        model.addAttribute("ordered", invoiceService.findByUsername(username));
        model.addAttribute("userAuctions", userAuctionService.findByUser(user));
        Date currentDate = new Date();
        model.addAttribute("currentDate", currentDate);
        return "profile";
    }

    @RequestMapping(value = "/orderDetail")
    public String getOrderDetail(Model model, @RequestParam("invoiceId") String invoiceId, Principal principal) throws UserNotFoundException {
        Invoice invoice = invoiceService.findOne(invoiceId);
        String username = principal.getName();
        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("invoice", invoiceService.getAll());
        model.addAttribute("invoices", invoice);
        return "orderDetail";
    }

    @RequestMapping("/updateInvoiceStatus")
    public String cancelOrder(@RequestParam("invoiceId") String invoiceId) throws InvoiceStatusNotFoundException {
        Invoice invoice = invoiceService.findOne(invoiceId);
        invoice.setInvoiceStatus(InvoiceStatus.CANCELED);
        invoiceService.save(invoice);
        return "redirect:/orderDetail?invoiceId=" + invoiceId;
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword,
                                @RequestParam("confirmPassword") String confirmPassword,
                                HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) throws UserNotFoundException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        if (oldPassword.equals("") || newPassword.equals("")) {
            session.setAttribute("error", "invalid");
            return "redirect:/changePassword";
        }
        if(newPassword.length() < 8){
            model.addAttribute("error", "errorLengthPassword");
            return "redirect:/changePassword";
        }
        if (!bCryptPasswordEncoder.matches(oldPassword, user.getPassword())) {
            session.setAttribute("error", "oldPasswordInvalid");
            return "redirect:/changePassword";
        }
        if (!confirmPassword.equals(newPassword)) {
            session.setAttribute("error", "confirmInvalid");
            return "redirect:/changePassword";
        } else {
            new SecurityContextLogoutHandler().logout(request, response, auth);
            userService.changePassword(user, newPassword);
            session.setAttribute("message", "updatePasswordSuccess");
            return "login";
        }
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public String changePassword(HttpSession session, Model model) throws UserNotFoundException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        if ("confirmInvalid".equals(session.getAttribute("error"))) {
            model.addAttribute("error", Constant.INVALID_CONFIRM_PASSWORD);
            session.removeAttribute("error");
            return "changePassword";
        }
        if ("invalid".equals(session.getAttribute("error"))) {
            model.addAttribute("error", Constant.ERROR_FORM);
            session.removeAttribute("error");
            return "changePassword";
        }
        if ("oldPasswordInvalid".equals(session.getAttribute("error"))) {
            model.addAttribute("error", Constant.INVALID_CURRENT_PASSWORD);
            session.removeAttribute("error");
            return "changePassword";
        }
        if ("errorLengthPassword".equals(session.getAttribute("error"))) {
            model.addAttribute("error", Constant.INVALID_NEW_PASSWORD);
            session.removeAttribute("error");
            return "changePassword";
        }
        return "changePassword";
    }

    @RequestMapping(value = "/updateProfile", method = RequestMethod.GET)
    public String updateProfile(Model model) throws UserNotFoundException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        model.addAttribute("profileDto", new ProfileDto());
        model.addAttribute("cities", cityService.getAll());
        model.addAttribute("districts", districtService.getAll());
        return "updateProfile";
    }

    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public String saveProfile(@ModelAttribute ProfileDto profileDto, HttpServletRequest request, HttpSession session) throws UserNotFoundException, ParseException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        String date = request.getParameter("date");
        Date birthday = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        profileDto.setBirthday(birthday);
        String cityId = request.getParameter("cityId");
        String districtId = request.getParameter("districtId");
        profileDto.setCityId(cityId);
        profileDto.setDistrictId(districtId);
        setInfoFromProfileToUser(user, profileDto);
        userService.save(user);
        session.setAttribute("message", "updateProfile");
        return "redirect:/profile";
    }

    private void setInfoFromProfileToUser(User user, ProfileDto profileDto) {
        user.setName(profileDto.getName());
        user.setCity(cityService.findById(profileDto.getCityId()));
        user.setDistrict(districtService.findById(profileDto.getDistrictId()));
        user.setBirthday(profileDto.getBirthday());
        user.setAddress(profileDto.getAddress());
        user.setPhone(profileDto.getPhone());
    }

    @RequestMapping(value = "/getDistrict", method = RequestMethod.GET)
    public @ResponseBody
    List<District> getDistrict(@RequestParam(value = "cityId") String cityId) {
        City city = cityService.findById(cityId);
        return districtService.findByCity(city);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
