package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.service.PayMentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.dao.repository.PayMentRepository;
@Service
public class PayMentServiceImp implements PayMentService {
	@Autowired
	private PayMentRepository paymentRepository;
	@Override
	public InvoiceDetail create(InvoiceDetail payMent) {
		// TODO Auto-generated method stub
		return paymentRepository.save(payMent);
	}

}
