package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.repository.InvoiceRepository;
import hvcntt.org.shoppingweb.service.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvoiceServiceImpl implements InvoiceService {
	@Autowired
	private InvoiceRepository invoiceRepository;
	@Override
	public Invoice create(Invoice payMent) {
		// TODO Auto-generated method stub
		return invoiceRepository.save(payMent);
	}

}
