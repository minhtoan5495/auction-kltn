package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "discount")
@NamedQuery(name="Discount.findAll", query="SELECT d FROM Discount d")
public class Discount implements Serializable {
	private static final long serialVersionUID = -2384639484132944167L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="discount_id")
	private String discountId;

	@Column(name="discount_content")
	private String discountContent;

	@Column(name="discount_percent")
	private int discountPercent;

	@Column(name="discount_title")
	private String discountTitle;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_date")
	private Date endDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	private Date startDate;
		
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="discount_product",joinColumns=@JoinColumn(name="discount_id"),inverseJoinColumns=@JoinColumn(name="product_id"))
	private List<Product> products;
	//bi-directional many-to-one association to Product
//	@ManyToOne(targetEntity = Product.class)
//	@JoinColumn(name="product_id")

	public Discount() {
	}

	public String getDiscountId() {
		return this.discountId;
	}

	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}

	public String getDiscountContent() {
		return this.discountContent;
	}

	public void setDiscountContent(String discountContent) {
		this.discountContent = discountContent;
	}

	public int getDiscountPercent() {
		return this.discountPercent;
	}

	public void setDiscountPercent(int discountPercent) {
		this.discountPercent = discountPercent;
	}

	public String getDiscountTitle() {
		return this.discountTitle;
	}

	public void setDiscountTitle(String discountTitle) {
		this.discountTitle = discountTitle;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}