package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AboutController {
	@Autowired
	ParentService parentService;

	@ModelAttribute("parents")
	public List<Parent> parent(){
		return parentService.findAll();
	}
	@RequestMapping(value="/about")
	public String aboutPage(){
		return "aboutUs";
	}
}
