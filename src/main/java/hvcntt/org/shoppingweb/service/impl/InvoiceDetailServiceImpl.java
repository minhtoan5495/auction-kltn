package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.InvoiceDetail;
import hvcntt.org.shoppingweb.dao.repository.InvoiceDetailRepository;
import hvcntt.org.shoppingweb.service.InvoiceDetailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvoiceDetailServiceImpl implements InvoiceDetailService {
	@Autowired
	InvoiceDetailRepository invoiceDetailRepo;
	@Override
	public InvoiceDetail add(InvoiceDetail invoiceDetail) {
		// TODO Auto-generated method stub
		return invoiceDetailRepo.save(invoiceDetail);
	}
	@Override
	public InvoiceDetail findOne(int id) {
		// TODO Auto-generated method stub
		return invoiceDetailRepo.findOne(id);
	}

}
