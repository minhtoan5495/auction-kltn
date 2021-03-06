package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import hvcntt.org.shoppingweb.dao.dto.InvoiceStatus;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Entity
@Table(name = "invoice")
@NamedQuery(name="Invoice.findAll", query="SELECT i FROM Invoice i")
public class Invoice implements Serializable {
	private static final long serialVersionUID = -183157478453777407L;

	@Id
	@Column(name="invoice_id")
	private String invoiceId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate=new Date();

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="ship_date")
	private Date shipDate=null;

	private String username;

	@Column(name="invoice_status")
	@Enumerated(EnumType.STRING)
	private InvoiceStatus invoiceStatus;

	//bi-directional many-to-one association to InvoiceDetail
	@OneToMany(mappedBy="invoice",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JsonManagedReference
	private List<InvoiceDetail> invoiceDetails;

	//bi-directional many-to-one association to ShippingInfo
	@OneToMany(mappedBy="invoice",fetch=FetchType.EAGER)
	@JsonManagedReference
	private List<ShippingInfo> shippingInfos;

	public Invoice() {
		setInvoiceId(UUID.randomUUID().toString());
	}

	public String getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getShipDate() {
		return this.shipDate;
	}

	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public InvoiceStatus getInvoiceStatus() {
		return this.invoiceStatus;
	}

	public void setInvoiceStatus(InvoiceStatus invoiceStatus) {
		this.invoiceStatus = invoiceStatus;
	}

	public List<InvoiceDetail> getInvoiceDetails() {
		return this.invoiceDetails;
	}

	public void setInvoiceDetails(List<InvoiceDetail> invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

	public List<ShippingInfo> getShippingInfos() {
		return this.shippingInfos;
	}

	public void setShippingInfos(List<ShippingInfo> shippingInfos) {
		this.shippingInfos = shippingInfos;
	}

}