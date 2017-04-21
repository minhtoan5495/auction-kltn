package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="invoice_status")
@NamedQuery(name="InvoiceStatus.findAll", query="SELECT i FROM InvoiceStatus i")
public class InvoiceStatus implements Serializable {
	private static final long serialVersionUID = 6390516537779151991L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="invoice_status_id")
	private int invoiceStatusId;

	@Column(name="invoice_status_name")
	private String invoiceStatusName;

	//bi-directional many-to-one association to Invoice
	@OneToMany(mappedBy="invoiceStatus")
	@JsonManagedReference
	private List<Invoice> invoices;

	public InvoiceStatus() {
	}



	public int getInvoiceStatusId() {
		return invoiceStatusId;
	}



	public void setInvoiceStatusId(int invoiceStatusId) {
		this.invoiceStatusId = invoiceStatusId;
	}



	public String getInvoiceStatusName() {
		return this.invoiceStatusName;
	}

	public void setInvoiceStatusName(String invoiceStatusName) {
		this.invoiceStatusName = invoiceStatusName;
	}

	public List<Invoice> getInvoices() {
		return this.invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}

	public Invoice addInvoice(Invoice invoice) {
		getInvoices().add(invoice);
		invoice.setInvoiceStatus(this);

		return invoice;
	}

	public Invoice removeInvoice(Invoice invoice) {
		getInvoices().remove(invoice);
		invoice.setInvoiceStatus(null);

		return invoice;
	}

}