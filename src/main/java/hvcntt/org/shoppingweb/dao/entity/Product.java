package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "product")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = -565138532603166915L;

	@Id
	@Column(name="product_id")
	private String productId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	private String description;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="manufacture_date")
	private Date manufactureDate;

	private String name;

	private float price;

	@Column(name="stock_quantity")
	private int stockQuantity;

	@Column(name="view_number")
	private int viewNumber;

	@OneToMany(mappedBy="product",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private List<Auction> auctions;

	@OneToMany(mappedBy="product",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JsonManagedReference
	private List<Image> images;

	@OneToMany(mappedBy="product", fetch=FetchType.EAGER)
	@JsonManagedReference
	private List<InvoiceDetail> invoiceDetails;

	@ManyToOne
	@JoinColumn(name="category_id")
	@JsonBackReference
	private Category category;

	@ManyToOne
	@JoinColumn(name="supplier_id")
	@JsonBackReference
	private Supplier supplier;

	private String imageUrl;

	@ManyToOne
	@JoinColumn(name="transaction_type_id")
	@JsonBackReference
	private TransactionType transactionType;

	@OneToMany(mappedBy="product",fetch = FetchType.EAGER)
	@JsonManagedReference
	private List<Rating> ratings;

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="product")
	@JsonManagedReference
	private List<ProductDetail> productDetails;

	@ManyToMany(mappedBy="products",fetch=FetchType.EAGER)
	private List<Discount> discounts;

	public Product() {
		setProductId(UUID.randomUUID().toString());
	}

	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getManufactureDate() {
		return this.manufactureDate;
	}

	public void setManufactureDate(Date manufactureDate) {
		this.manufactureDate = manufactureDate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStockQuantity() {
		return this.stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public int getViewNumber() {
		return this.viewNumber;
	}

	public void setViewNumber(int viewNumber) {
		this.viewNumber = viewNumber;
	}

	public List<Auction> getAuctions() {
		return this.auctions;
	}

	public void setAuctions(List<Auction> auctions) {
		this.auctions = auctions;
	}

	public List<Image> getImages() {
		return this.images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public List<InvoiceDetail> getInvoiceDetails() {
		return this.invoiceDetails;
	}

	public void setInvoiceDetails(List<InvoiceDetail> invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public TransactionType getTransactionType() {
		return this.transactionType;
	}

	public void setTransactionType(TransactionType transactionType) {
		this.transactionType = transactionType;
	}

	public List<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public List<ProductDetail> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(List<ProductDetail> productDetails) {
		this.productDetails = productDetails;
	}

	public List<Discount> getDiscounts() {
		return discounts;
	}

	public void setDiscounts(List<Discount> discounts) {
		this.discounts = discounts;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}