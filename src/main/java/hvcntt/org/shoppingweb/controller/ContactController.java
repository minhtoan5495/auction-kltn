package hvcntt.org.shoppingweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContactController {
	@RequestMapping(value="/contact")
	public String contactPage(){
		return "contact";
	}
}