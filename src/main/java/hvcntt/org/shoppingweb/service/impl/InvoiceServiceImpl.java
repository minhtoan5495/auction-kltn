package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.Invoice;
import hvcntt.org.shoppingweb.dao.repository.InvoiceRepository;
import hvcntt.org.shoppingweb.service.InvoiceService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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
	@Override
	public List<Invoice> getAll() {
		// TODO Auto-generated method stub
		return invoiceRepository.findAll(new Sort(Direction.DESC, "invoiceId"));
	}
	@Override
	public Invoice save(Invoice invoice) {
		// TODO Auto-generated method stub
		return invoiceRepository.save(invoice);
	}
	@Override
	public Invoice findOne(String id) {
		// TODO Auto-generated method stub
		return invoiceRepository.findOne(id);
	}
	@Override
	public void delete(String invoiceId) {
		invoiceRepository.delete(invoiceId);
		
	}

}
