package hvcntt.org.shoppingweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.UploadFile;
import hvcntt.org.shoppingweb.repository.UploadFileRepository;
@Service
public class UploadFileServiceImp implements UploadFileService{
	@Autowired
	UploadFileRepository uploadFileRepository;
	@Override
	public void save(UploadFile uploadFile) {
		uploadFileRepository.save(uploadFile);
		
	}

}
