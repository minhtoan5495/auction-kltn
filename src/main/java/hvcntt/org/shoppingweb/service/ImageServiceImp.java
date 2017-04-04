package hvcntt.org.shoppingweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.Image;
import hvcntt.org.shoppingweb.model.Product;
import hvcntt.org.shoppingweb.repository.ImageRepository;
@Service
public class ImageServiceImp implements ImageService {
	@Autowired
	ImageRepository imagerepo;
	@Override
	public List<Image> getAll() {
		// TODO Auto-generated method stub
		return imagerepo.findAll();
	}
	@Override
	public List<Image> findByProduct(Product product) {
		// TODO Auto-generated method stub
		return imagerepo.findByProduct(product);
	}

}
