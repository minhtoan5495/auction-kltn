package hvcntt.org.shoppingweb.controller;

import javax.servlet.http.HttpServletRequest;

import hvcntt.org.shoppingweb.service.SendMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SendMailController {

    @Qualifier("sendMailServiceImpl")
    @Autowired
    SendMailService sendMailService;

    public static final String TO = "toannxm.itedu@gmail.com";

//    @RequestMapping(value = "/sendMail", method = RequestMethod.GET)
//    public String showForm(Model model) {
//        model.addAttribute("mail", new EmailInfor());
//        return "contact";
//    }

    @RequestMapping(value = "/sendMail", method = RequestMethod.POST)
    public String sendMail(HttpServletRequest request) {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String reason = request.getParameter("reason");
        String content = request.getParameter("content");
        String message = "Name : ".concat(name).concat("\nEmail : ").concat(email).concat("\nPhone : ").concat(phone).concat("\nReason : ").concat(reason).concat("\nContent : ").concat(content);
        sendMailService.sendMail(TO, message);
        return "redirect:/";
    }
}
