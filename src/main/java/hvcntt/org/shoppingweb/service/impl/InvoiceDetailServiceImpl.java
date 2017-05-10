package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.InvoiceDetail;
import hvcntt.org.shoppingweb.dao.repository.InvoiceDetailRepository;
import hvcntt.org.shoppingweb.service.InvoiceDetailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InvoiceDetailServiceImpl implements InvoiceDetailService {
    @Autowired
    InvoiceDetailRepository invoiceDetailRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public InvoiceDetail save(InvoiceDetail invoiceDetail) {
        return invoiceDetailRepository.save(invoiceDetail);
    }

    @Override
    public InvoiceDetail findOne(String id) {
        return invoiceDetailRepository.findOne(id);
    }

}
