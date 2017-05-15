package hvcntt.org.shoppingweb.controller.admin;

import hvcntt.org.shoppingweb.dao.dto.CategoryDto;
import hvcntt.org.shoppingweb.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import hvcntt.org.shoppingweb.dao.entity.Category;
import hvcntt.org.shoppingweb.exception.CategoryNotFoundExeption;
import hvcntt.org.shoppingweb.service.CategoryService;

@Controller
public class ManageCategoryController {
    @Autowired
    CategoryService categoryService;

    @Autowired
    ParentService parentService;

    @RequestMapping(value = "/admin/manageCategory")
    public String getAllCategory(Model model, @RequestParam(value = "message", required = false) String message) {
        if("saveCategory".equals(message)){
            model.addAttribute("message", "Saved category successfully !!");
        }
        model.addAttribute("categories", categoryService.getAll());
        return "manageCategory";
    }

    @RequestMapping(value = "/admin/addCategory", method = RequestMethod.GET)
    public String addCategory(Model model) {
        model.addAttribute("categoryDto", new CategoryDto());
        model.addAttribute("parents", parentService.findAll());
        return "addOrEditCategory";
    }

    @RequestMapping(value = "/admin/saveCategory", method = RequestMethod.POST)
    public String addCategory(@ModelAttribute("categoryDto") CategoryDto categoryDto) {
        categoryService.save(categoryDto);
        return "redirect:/admin/manageCategory?message=saveCategory";
    }

    @RequestMapping(value = "/admin/deleteCategory", method = RequestMethod.GET)
    public @ResponseBody String deleteCategory(@RequestParam("categoryId") String categoryId) throws CategoryNotFoundExeption {
        Category category = categoryService.findOne(categoryId);
        if(category != null){
            categoryService.delete(category);
        }else {
            throw new CategoryNotFoundExeption("Category not found with id " + categoryId);
        }
        return "Deleted category with id : " + categoryId + " !!";
    }

    @RequestMapping(value = "/admin/editCategory", method = RequestMethod.GET)
    public String editCategory(Model model, @RequestParam("categoryId") String categoryId) {
        Category category = categoryService.findOne(categoryId);
        CategoryDto categoryDto = new CategoryDto();
        categoryDto.setCategoryName(category.getCategoryName());
        categoryDto.setParentId(category.getParent().getParentId());
        model.addAttribute("parents", parentService.findAll());
        model.addAttribute("categoryDto", categoryDto);
        model.addAttribute("category", category);
        return "addOrEditCategory";
    }
}
