package hvcntt.org.shoppingweb.service;//package hvcntt.org.shoppingweb.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import hvcntt.org.shoppingweb.model.Information;
//import hvcntt.org.shoppingweb.repository.InformationRepository;
//
//@Service
//public class InformationServiceImp implements InformationService {
//	@Autowired
//	InformationRepository customerrepo;
//	@Override
//	public List<Information> getAll() {
//		// TODO Auto-generated method stub
//		return customerrepo.findAll();
//	}
//	@Override
//	public Information create(Information information) {
//		return customerrepo.save(information);
//	}
//	@Override
//	public Information findByName(String firstname, String lastname) {
//		// TODO Auto-generated method stub
//		return customerrepo.findByFirstnameAndLastname(firstname, lastname);
//	}
//	@Override
//	public List<Information> findByLastname(String lastname) {
//		// TODO Auto-generated method stub
//		return customerrepo.findByLastname(lastname);
//	}
//	
//
//}
