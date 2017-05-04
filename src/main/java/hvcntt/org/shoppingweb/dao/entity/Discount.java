package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "discount")
@NamedQuery(name = "Discount.findAll", query = "SELECT d FROM Discount d")
public class Discount implements Serializable {
    private static final long serialVersionUID = -2384639484132944167L;

    private String discountId;

    private String discountContent;

    private int discountPercent;

    private String discountTitle;

    private Date endDate;

    private Date startDate;

    private List<Product> products;

    public Discount() {
    	setDiscountId(UUID.randomUUID().toString());
    }

    @Id
    @Column(name = "discount_id")
    public String getDiscountId() {
        return this.discountId;
    }

    public void setDiscountId(String discountId) {
        this.discountId = discountId;
    }

    @Column(name = "discount_content")
    public String getDiscountContent() {
        return this.discountContent;
    }

    public void setDiscountContent(String discountContent) {
        this.discountContent = discountContent;
    }

    @Column(name = "discount_percent")
    public int getDiscountPercent() {
        return this.discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    @Column(name = "discount_title")
    public String getDiscountTitle() {
        return this.discountTitle;
    }

    public void setDiscountTitle(String discountTitle) {
        this.discountTitle = discountTitle;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "end_date")
    public Date getEndDate() {
        return this.endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_date")
    public Date getStartDate() {
        return this.startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @ManyToMany(fetch = FetchType.EAGER, targetEntity = Product.class)
    @JoinTable(name = "discount_product", joinColumns = @JoinColumn(name = "discount_id"), inverseJoinColumns = @JoinColumn(name = "product_id"))
    @JsonBackReference
    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

}