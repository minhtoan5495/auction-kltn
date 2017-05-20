package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.dto.CartItem;
import hvcntt.org.shoppingweb.dao.entity.*;
import hvcntt.org.shoppingweb.dao.repository.InvoiceRepository;
import hvcntt.org.shoppingweb.dao.repository.UserRepository;
import hvcntt.org.shoppingweb.exception.InvoiceException;
import hvcntt.org.shoppingweb.exception.InvoiceStatusNotFoundException;
import hvcntt.org.shoppingweb.service.*;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

    @Autowired
    UserAuctionService userAuctionService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public Invoice create(Invoice invoice) {
        return invoiceRepository.save(invoice);
    }

    @Override
    public List<Invoice> getAll() {
        return invoiceRepository.findAll(new PageRequest(0, 3, Direction.DESC, "createDate")).getContent();
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
    public void checkOut(ShippingInfo shippingInfo, List<CartItem> cartItems) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userRepository.findByUsername(username);
        Invoice invoice = new Invoice();
        invoice.setCreateDate(new Date());
        setStatusForInvoice(invoice);
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
        return invoiceRepository.findByOrderByCreateDateDesc();
    }

    @Override
    public void save(String invoiceId, String invoiceStatusId) throws InvoiceStatusNotFoundException {
        Invoice invoice = invoiceRepository.findOne(invoiceId);
        InvoiceStatus invoiceStatusModel = invoiceStatusService.findByInvoiceStatusId(invoiceStatusId);
        invoice.setInvoiceStatus(invoiceStatusModel);
        invoiceRepository.save(invoice);
    }

    private void setStatusForInvoice(Invoice invoice){
        try {
            InvoiceStatus invoiceStatus = invoiceStatusService.findByName("PENDING");
            invoice.setInvoiceStatus(invoiceStatus);
        } catch (InvoiceStatusNotFoundException e) {
            LOG.error(e.getMessage(), e);
            String error = MessageUtil.getMessage("Can't get invoice status");
            throw new InvoiceException(error);
        }
    }

    @Override
    public void addProductForUserWinInAuction(Auction auction) {
        Invoice invoice = new Invoice();
        invoice.setCreateDate(new Date());
        setStatusForInvoice(invoice);
        UserAuction userAuction = userAuctionService.findFirstByAuctionOrderByPriceDesc(auction);
        ShippingInfo shippingInfo = createShippingInfoByUser(userAuction.getUser());
        Calendar shipDate = Calendar.getInstance();
        shipDate.add(Calendar.DAY_OF_MONTH, 7);
        Date date = shipDate.getTime();
        invoice.setShipDate(date);
        invoice.setUsername(userAuction.getUser().getUsername());
        shippingInfo.setInvoice(invoice);
        invoiceRepository.save(invoice);
        shippingInfoService.save(shippingInfo);
        InvoiceDetail invoiceDetail = new InvoiceDetail(
                userAuction.getPrice(),
                1, shippingInfo.getInvoice(), auction.getProduct());
        invoiceDetailService.save(invoiceDetail);
    }

    private ShippingInfo createShippingInfoByUser(User user) {
        ShippingInfo shippingInfo = new ShippingInfo();
        shippingInfo.setAddress(user.getAddress());
        shippingInfo.setCity(user.getCity());
        shippingInfo.setDistrict(user.getDistrict());
        return shippingInfo;
    }
}
