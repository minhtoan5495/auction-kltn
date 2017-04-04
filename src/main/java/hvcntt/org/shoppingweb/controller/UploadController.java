package hvcntt.org.shoppingweb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import hvcntt.org.shoppingweb.model.UploadFile;
import hvcntt.org.shoppingweb.service.UploadFileService;

@Controller
public class UploadController {
	@Autowired
	private UploadFileService uploadFileService;
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
                uploadFileService.save(uploadFile);                
            }
            
        }
		model.addAttribute("imageUrl", uploadFile);
        return "Success";
    }	
}
