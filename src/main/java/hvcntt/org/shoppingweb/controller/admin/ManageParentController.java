package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by toannguyen on 28/04/2017.
 */
@Controller
public class ManageParentController {

    @Autowired
    ParentService parentService;

    @RequestMapping(value = "/admin/manageParent")
    public String getAllParen(@RequestParam(value = "message", required = false) String message, Model model, HttpServletRequest request){
        model.addAttribute("parents", parentService.findAll());
        if("saveSuccess".equals(message)){
            model.addAttribute("message","Saved parent successfully " + request.getParameter("parentId") + "!!");
        }
        return "manageParent";
    }

    @RequestMapping(value = "/admin/addParent", method = RequestMethod.GET)
    public String addParent(Model model){
        model.addAttribute("parent", new Parent());
        return "addParent";
    }

    @RequestMapping(value = "/admin/saveParent", method = RequestMethod.POST)
    public String saveParent(@ModelAttribute Parent parent){
        parentService.saveParent(parent);
        return "redirect:/admin/manageParent?message=saveSuccess&&parentId=" + parent.getParentId();
    }

    @RequestMapping(value = "/admin/updateParent", method = RequestMethod.GET)
    public void updateParent(@RequestParam("parentId") String parentId, @RequestParam("parentName") String parentName, Model model){
        Parent parent = parentService.findById(parentId);
        parent.setParentName(parentName);
        parentService.saveParent(parent);
        model.addAttribute("message","Updated parent with id : " + parentId + " !!");
    }

    @RequestMapping(value = "/admin/deleteParent", method = RequestMethod.GET)
    public void deleteParent(@RequestParam("parentId") String parentId, Model model){
        Parent parent = parentService.findById(parentId);
        parentService.delete(parent);
        model.addAttribute("message","Deleted parent with id : " + parentId + " !!");
    }

}
