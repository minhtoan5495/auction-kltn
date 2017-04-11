package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shippinginfor")
public class ShippingInfo implements Serializable {

    private static final long serialVersionUID = -938090741345442156L;

    @Id
    @GeneratedValue
    @Column(name = "shipping_info_id")
    private String shippingInfoId = UUID.randomUUID().toString();

    @Column(name = "address")
    private String address;

    @Column(name = "city")
    private String city;
    @Column(name = "district")
    private String district;

    @OneToOne(mappedBy = "shippingInfo")
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

    public ShippingInfo() {
    }

    public ShippingInfo(String address, String city, String district, Invoice invoice) {
        this.address = address;
        this.city = city;
        this.district = district;
        this.invoice = invoice;
    }

    public String getShippingInfoId() {
        return shippingInfoId;
    }

    public void setShippingInfoId(String shippingInfoId) {
        this.shippingInfoId = shippingInfoId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }
}
