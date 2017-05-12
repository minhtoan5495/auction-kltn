package hvcntt.org.shoppingweb.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hvcntt.org.shoppingweb.dao.dto.ProfileDto;
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
    InvoiceStatusService invoiceStatusService;

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
    public String profile(Model model, Principal principal) throws UserNotFoundException {
        String username = principal.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", userService.findByUsername(username));
        model.addAttribute("invoices", invoiceService.getAll());
        model.addAttribute("ordered", invoiceService.findByUsername(username));
        model.addAttribute("auctions", userAuctionService.findByUser(user));
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

    @RequestMapping("/cancelOrder")
    public String cancelOrder(@RequestParam("invoiceId") String invoiceId) throws InvoiceStatusNotFoundException {
        Invoice invoice = invoiceService.findOne(invoiceId);
        invoice.setInvoiceStatus(invoiceStatusService.findByName("Đã hủy đơn hàng"));
        invoiceService.save(invoice);
        return "redirect:/orderDetail?invoiceId=" + invoiceId;
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String resetPassword(@RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword,
                                @RequestParam("confirmPassword") String confirmPassword,
                                HttpServletRequest request, HttpServletResponse response) throws UserNotFoundException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        if(oldPassword.equals("") || newPassword.equals("")){
            return "redirect:/changePassword?error=invalid";
        }
        if(!bCryptPasswordEncoder.matches(oldPassword, user.getPassword())){
            return "redirect:/changePassword?error=oldPasswordInvalid";
        }
        if(!confirmPassword.equals(newPassword)){
            return "redirect:/changePassword?error=confirmInvalid";
        } else {
            new SecurityContextLogoutHandler().logout(request, response, auth);
            userService.changePassword(user, newPassword);
            return "redirect:/login?message=changePassword";
        }
    }

    @RequestMapping(value="/changePassword", method = RequestMethod.GET)
    public String changePassword(@RequestParam(value = "error", required = false) String error, Model model){
        if(error != null){
            if(error.equals("confirmInvalid")){
                model.addAttribute("error", "Nhập lại mật khẩu không đúng !");
            }
            if(error.equals("invalid")){
                model.addAttribute("error", "Vui lòng nhập đầy đủ thông tin !");
            }
            if(error.equals("oldPasswordInvalid")){
                model.addAttribute("error", "Bạn nhập sai mật khẩu hiện tại !");
            }
        }
        return "changePassword";
    }
    @RequestMapping(value="/updateProfile", method = RequestMethod.GET)
    public String updateProfile(Model model) throws UserNotFoundException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        model.addAttribute("profileDto", new ProfileDto());
        model.addAttribute("cities", cityService.getAll());
        return "updateProfile";
    }

    @RequestMapping(value="/updateProfile", method = RequestMethod.POST)
    public String saveProfile(@ModelAttribute ProfileDto profileDto, HttpServletRequest request) throws UserNotFoundException, ParseException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);
        String date = request.getParameter("date");
        Date birthday = new SimpleDateFormat("yyyy-mm-dd").parse(date);
        profileDto.setBirthday(birthday);
        profileDto.setCityId(request.getParameter("cityId"));
        profileDto.setDistrictId(request.getParameter("districtId"));
        setInfoFromProfileToUser(user, profileDto);
        userService.save(user);
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
    List<District> getDistrict(@RequestParam(value = "cityId") String cityId){
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
