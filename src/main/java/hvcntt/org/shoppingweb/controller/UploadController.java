package hvcntt.org.shoppingweb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import hvcntt.org.shoppingweb.dao.dto.UploadFile;

@Controller
public class UploadController {

	@RequestMapping(value="/upload",method=RequestMethod.GET)
	public String upLoadFile(){
		return "upload";
	}

	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public String uploadedFile(HttpServletRequest request,@RequestParam CommonsMultipartFile[] fileUpload,Model model) throws Exception{
		 UploadFile uploadFile = new UploadFile();
		if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload){
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                uploadFile.setFileName(aFile.getOriginalFilename());
                uploadFile.setData(aFile.getBytes());
            }
            
        }
		model.addAttribute("imageUrl", uploadFile);
        return "Success";
    }	
}
