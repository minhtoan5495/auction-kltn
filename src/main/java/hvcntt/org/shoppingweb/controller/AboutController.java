package hvcntt.org.shoppingweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	@RequestMapping(value="/about")
	public String aboutPage(){
		return "aboutUs";
	}
}
