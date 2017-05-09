package hvcntt.org.shoppingweb.controller;

import java.io.File;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hvcntt.org.shoppingweb.dao.dto.EmailInfor;

@Controller
public class SendMailController {

	@Autowired
	private ServletContext context;

	@Autowired
	private JavaMailSender javaMailSender;
	@RequestMapping(value="/sendMail",method=RequestMethod.GET)
	public String showForm(Model model){
		model.addAttribute("mail", new EmailInfor());
		return "contact";
	}

	@RequestMapping(value="/sendMail",method=RequestMethod.POST)
	public String sendMail(Model model,@RequestParam("attachment") MultipartFile file,HttpServletRequest request ){
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String subject=request.getParameter("subject");
		String body=request.getParameter("body");
		EmailInfor emailInfor=new EmailInfor(from, to, subject, body);
		try{
			MimeMessage message=javaMailSender.createMimeMessage();
			MimeMessageHelper helper=new MimeMessageHelper(message,true);
			helper.setFrom(emailInfor.getFrom());
			helper.setTo(emailInfor.getTo());
			helper.setReplyTo(emailInfor.getFrom());
			helper.setSubject(emailInfor.getSubject());
			helper.setText(emailInfor.getBody(),true);
			
			if(!file.isEmpty()){
				String imageUrl="upload"+file.getOriginalFilename();
				String absolutePath=context.getRealPath(imageUrl);
				File uploadFile=new File(absolutePath);
				file.transferTo(uploadFile);
				helper.addAttachment(uploadFile.getName(), uploadFile);
				model.addAttribute("imageUrl", imageUrl);
			}
		}
		catch (Exception ex) {
			model.addAttribute("error", ex.getMessage());
			return "contact";
		}
		return "contactSuccess";
	}
}
