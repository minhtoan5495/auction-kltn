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
    public String addCategory(Model model, @RequestParam(value = "message", required = false) String message) {
        if("invalidName".equals(message)){
            model.addAttribute("error", "Category name is exist !!");
        }
        if("nullName".equals(message)){
            model.addAttribute("error", "Category name is null !!");
        }
        if("nullParent".equals(message)){
            model.addAttribute("error", "Please select parent for category than you want to create !!");
        }
        model.addAttribute("categoryDto", new CategoryDto());
        model.addAttribute("parents", parentService.findAll());
        return "addOrEditCategory";
    }

    @RequestMapping(value = "/admin/saveCategory", method = RequestMethod.POST)
    public String addCategory(@ModelAttribute("categoryDto") CategoryDto categoryDto) {
        if(categoryDto.getCategoryName().isEmpty()){
            return "redirect:/admin/addCategory?message=nullName";
        }
        if(categoryDto.getParentId().equals("")){
            return "redirect:/admin/addCategory?message=nullParent";
        }
        if(categoryService.findByCategoryName(categoryDto.getCategoryName()) != null){
            return "redirect:/admin/addCategory?message=invalidName";
        }
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
