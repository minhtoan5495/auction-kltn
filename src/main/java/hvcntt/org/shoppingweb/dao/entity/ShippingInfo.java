package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.*;

@Entity
@Table(name="shipping_info")
@NamedQuery(name="ShippingInfo.findAll", query="SELECT s FROM ShippingInfo s")
public class ShippingInfo implements Serializable {
	private static final long serialVersionUID = -6812168016853602155L;

	@Id
	@Column(name="shipping_info_id")
	private String shippingInfoId;

	private String address;

	//bi-directional many-to-one association to City
	@ManyToOne
	@JoinColumn(name="city_id")
	private City city;

	//bi-directional many-to-one association to District
	@ManyToOne
	@JoinColumn(name="district_id")
	private District district;

	//bi-directional many-to-one association to Invoice
	@OneToOne
	@JoinColumn(name="invoice_id")
	@JsonBackReference
	private Invoice invoice;

	public ShippingInfo() {
		setShippingInfoId(UUID.randomUUID().toString());
	}
	
	public ShippingInfo(String address, City city, District district, Invoice invoice) {
		super();
		this.address = address;
		this.city = city;
		this.district = district;
		this.invoice = invoice;
	}

	public String getShippingInfoId() {
		return this.shippingInfoId;
	}

	public void setShippingInfoId(String shippingInfoId) {
		this.shippingInfoId = shippingInfoId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Invoice getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}
}