package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.InvoiceStatus;
import hvcntt.org.shoppingweb.dao.repository.InvoiceStatusRepository;
import hvcntt.org.shoppingweb.service.InvoiceStatusService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvoiceStatusServiceImpl implements InvoiceStatusService {
	@Autowired
	InvoiceStatusRepository invoiceStatusRepo;
	@Override
	public List<InvoiceStatus> getAll() {
		// TODO Auto-generated method stub
		return invoiceStatusRepo.findAll();
	}
	@Override
	public InvoiceStatus findByName(String name) {
		// TODO Auto-generated method stub
		return invoiceStatusRepo.findByInvoiceStatusName(name);
	}

}
