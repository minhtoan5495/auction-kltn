package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.dao.repository.InvoiceRepository;
import hvcntt.org.shoppingweb.dao.repository.UserRepository;
import hvcntt.org.shoppingweb.exception.InvoiceException;
import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.service.InvoiceDetailService;
import hvcntt.org.shoppingweb.service.InvoiceService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import hvcntt.org.shoppingweb.service.InvoiceStatusService;
import hvcntt.org.shoppingweb.service.ShippingInfoService;
import hvcntt.org.shoppingweb.utils.LOG;
import hvcntt.org.shoppingweb.utils.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InvoiceServiceImpl implements InvoiceService {

    @Autowired
    InvoiceRepository invoiceRepository;

    @Autowired
    ShippingInfoService shippingInfoService;

    @Autowired
    InvoiceDetailService invoiceDetailService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    InvoiceStatusService invoiceStatusService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Invoice create(Invoice invoice) {
        return invoiceRepository.save(invoice);
    }

    @Override
    public List<Invoice> getAll() {
        return invoiceRepository.findAll(new PageRequest(0, 3,Direction.DESC, "createDate")).getContent();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Invoice save(Invoice invoice) {
        return invoiceRepository.save(invoice);
    }

    @Override
    public Invoice findOne(String id) {
        return invoiceRepository.findOne(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void delete(String invoiceId) {
        invoiceRepository.delete(invoiceId);
    }

    @Override
    public List<Invoice> findByUsername(String username) {
        return invoiceRepository.findByUsername(username);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void checkOut(ShippingInfo shippingInfo, List<CartItem> cartItems){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);
        Invoice invoice = new Invoice();
        invoice.setCreateDate(new Date());
        try {
            InvoiceStatus invoiceStatus = invoiceStatusService.findByName("PENDING");
            invoice.setInvoiceStatus(invoiceStatus);
        } catch (InvoiceStatusNotFoundException e) {
            LOG.error(e.getMessage(), e);
            String error = MessageUtil.getMessage("Can't get invoice status");
            throw new InvoiceException(error);
        }
        Calendar shipDate = Calendar.getInstance();
        shipDate.add(Calendar.DAY_OF_MONTH, 7);
        Date date = shipDate.getTime();
        invoice.setShipDate(date);
        invoice.setUsername(user.getUsername());
        shippingInfo.setInvoice(invoice);
        invoiceRepository.save(invoice);
        shippingInfoService.save(shippingInfo);
        for (int i = 0; i < cartItems.size(); i++) {
            InvoiceDetail invoiceDetail = new InvoiceDetail(
                    cartItems.get(i).getProduct().getPrice() * cartItems.get(i).getQuantity(),
                    cartItems.get(i).getQuantity(), shippingInfo.getInvoice(), cartItems.get(i).getProduct());
            invoiceDetailService.save(invoiceDetail);
        }
    }

	@Override
	public List<Invoice> findByOrderByCreateDateDesc() {
		// TODO Auto-generated method stub
		return invoiceRepository.findByOrderByCreateDateDesc();
	}

}
