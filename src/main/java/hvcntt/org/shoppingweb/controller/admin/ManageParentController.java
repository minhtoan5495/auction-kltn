package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.entity.Parent;
import hvcntt.org.shoppingweb.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by toannguyen on 28/04/2017.
 */
@Controller
public class ManageParentController {

    @Autowired
    ParentService parentService;

    @RequestMapping(value = "/admin/manageParent")
    public String getAllParen(HttpSession session, Model model, HttpServletRequest request){
        model.addAttribute("parents", parentService.findAll());
        if("saveSuccess".equals(session.getAttribute("message"))){
            model.addAttribute("message","Saved parent successfully " + request.getParameter("parentId") + "!!");
            session.removeAttribute("message");
        }
        return "manageParent";
    }

    @RequestMapping(value = "/admin/addParent", method = RequestMethod.GET)
    public String addParent(Model model, HttpSession session){
        if("nullName".equals(session.getAttribute("message"))){
            model.addAttribute("message","Parent name can't be null");
            session.removeAttribute("message");
            return "addOrEditParent";
        }
        if("invalidName".equals(session.getAttribute("message"))){
            model.addAttribute("message","Parent name is exist");
            session.removeAttribute("message");
            return "addOrEditParent";
        }
        model.addAttribute("parent", new Parent());
        return "addOrEditParent";
    }

    @RequestMapping(value = "/admin/saveParent", method = RequestMethod.POST)
    public String saveParent(@ModelAttribute Parent parent, HttpSession session){
        if(parent.getParentName().isEmpty()){
            session.setAttribute("message", "nullName");
            return "redirect:/admin/addParent";
        }
        if(parentService.findByParentName(parent.getParentName()) != null){
            session.setAttribute("message", "invalidName");
            return "redirect:/admin/addParent";
        }
        parentService.saveParent(parent);
        session.setAttribute("message", "saveSuccess");
        return "redirect:/admin/manageParent?parentId=" + parent.getParentId();
    }

    @RequestMapping(value = "/admin/updateParent", method = RequestMethod.GET)
    public String updateParent(@ModelAttribute Parent parent, HttpSession session){
        parentService.saveParent(parent);
        session.setAttribute("message", "saveSuccess");
        return "redirect:/admin/manageParent?parentId=" + parent.getParentId();
    }

    @RequestMapping(value = "/admin/deleteParent", method = RequestMethod.GET)
    public @ResponseBody String
    deleteParent(@RequestParam("parentId") String parentId){
        Parent parent = parentService.findById(parentId);
        parentService.delete(parent);
        return "Deleted parent with id : " + parentId + " !!";
    }

    @RequestMapping(value = "/admin/editParent", method = RequestMethod.GET)
    public String editParent(@RequestParam(value = "parentId") String parentId, Model model){
        model.addAttribute(parentService.findById(parentId));
        return "addOrEditParent";
    }
}
