package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.InvoiceStatus;
import hvcntt.org.shoppingweb.dao.repository.InvoiceStatusRepository;
import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.service.InvoiceStatusService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvoiceStatusServiceImpl implements InvoiceStatusService {
    @Autowired
    InvoiceStatusRepository invoiceStatusRepository;

    @Override
    public List<InvoiceStatus> getAll() {
        return invoiceStatusRepository.findAll();
    }

    @Override
    public InvoiceStatus findByName(String name) throws InvoiceStatusNotFoundException {
        InvoiceStatus invoiceStatus = invoiceStatusRepository.findByInvoiceStatusName(name);
        if (invoiceStatus == null) {
            throw new InvoiceStatusNotFoundException("Status not found with name : " + name);
        } else {
            return invoiceStatusRepository.findByInvoiceStatusName(name);
        }
    }

}
