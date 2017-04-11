package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "invoicedetail")
public class InvoiceDetail implements Serializable {

    private static final long serialVersionUID = 8654582957770021307L;

    @Id
    @GeneratedValue
    @Column(name = "invoice_detail_id")
    private String idInvoiceDetail = UUID.randomUUID().toString();

    @Column(name = "product_price")
    private double productPrice;

    @Column(name = "product_quantity")
    private int productQuantity;

    @ManyToOne
    @JoinColumn(name = "idproduct")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

    public InvoiceDetail() {
    }

    public InvoiceDetail(double productPrice, int productQuantity, Product product, Invoice invoice) {
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.product = product;
        this.invoice = invoice;
    }

    public String getIdInvoiceDetail() {
        return idInvoiceDetail;
    }

    public void setIdInvoiceDetail(String idInvoiceDetail) {
        this.idInvoiceDetail = idInvoiceDetail;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Invoice getInvoice() {
        return invoice;
    }

    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }
}
