package hvcntt.org.shoppingweb.service.impl;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;
import hvcntt.org.shoppingweb.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.ImageRepository;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageRepository imagerepo;

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
