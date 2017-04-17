package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table(name="invoice_detail")
@NamedQuery(name="InvoiceDetail.findAll", query="SELECT i FROM InvoiceDetail i")
public class InvoiceDetail implements Serializable {
	private static final long serialVersionUID = -4137213387456601660L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="invoice_detail_id")
	private int invoiceDetailId;

	private float price;

	private int quantity;

	//bi-directional many-to-one association to Invoice
	@ManyToOne
	@JoinColumn(name="invoice_id")
	private Invoice invoice;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	public InvoiceDetail() {
	}
	
	public InvoiceDetail(float price, int quantity, Invoice invoice, Product product) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.invoice = invoice;
		this.product = product;
	}



	public int getInvoiceDetailId() {
		return invoiceDetailId;
	}

	public void setInvoiceDetailId(int invoiceDetailId) {
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