package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.io.Serializable;
import java.util.UUID;
import javax.persistence.*;


@Entity
@Table(name="invoice_detail")
@NamedQuery(name="InvoiceDetail.findAll", query="SELECT i FROM InvoiceDetail i")
public class InvoiceDetail implements Serializable {
	private static final long serialVersionUID = -4137213387456601660L;

	@Id
	@Column(name="invoice_detail_id")
	private String invoiceDetailId;

	private float price;

	private int quantity;

	//bi-directional many-to-one association to Invoice
	@ManyToOne
	@JoinColumn(name="invoice_id")
	@JsonBackReference
	private Invoice invoice;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="product_id")
	@JsonBackReference
	private Product product;

	public InvoiceDetail() {
		setInvoiceDetailId(UUID.randomUUID().toString());
	}
	
	public InvoiceDetail(float price, int quantity, Invoice invoice, Product product) {
		setInvoiceDetailId(UUID.randomUUID().toString());
		this.price = price;
		this.quantity = quantity;
		this.invoice = invoice;
		this.product = product;
	}

	public String getInvoiceDetailId() {
		return invoiceDetailId;
	}

	public void setInvoiceDetailId(String invoiceDetailId) {
		this.invoiceDetailId = invoiceDetailId;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Invoice getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}