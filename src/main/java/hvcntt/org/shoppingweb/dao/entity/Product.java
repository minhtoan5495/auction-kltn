package hvcntt.org.shoppingweb.dao.entity;

import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {

	@Id
	@GeneratedValue
	private String idproduct = UUID.randomUUID().toString();

	@Column(name="image")
	private String image;

	@Column(name="name")
	private String name;

	@Column(name="view")
	private int view;

	@Column(name="price")
	private float price;

	@Column(name="description")
	private String description;

	@Column(name="quantity")
	private int quantity;

	@Column(name="quantity_sold")
	private int quantity_sold;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="product")
	private Set<Image> imageItem;

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="product")
	private Set<Comment> commentItems;

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="product")
	private Set<InvoiceDetail> payments;

	@ManyToOne
	@JoinColumn(name="idcategory")
	private Category category;

	public Product() {
		// TODO Auto-generated constructor stub
	}
	public Product(String image, String name, int view, float price, String description, int quantity,
			int quantity_sold,Set<Image> imageItem,Set<Comment> commentItems,Set<InvoiceDetail> payments) {
		super();
		this.image = image;
		this.name = name;
		this.view = view;
		this.price = price;
		this.description = description;
		this.quantity = quantity;
		this.quantity_sold = quantity_sold;
		this.imageItem=imageItem;
		this.commentItems=commentItems;
		this.payments=payments;
	}
	
	public String getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(String idproduct) {
		this.idproduct = idproduct;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getQuantity_sold() {
		return quantity_sold;
	}
	public void setQuantity_sold(int quantity_sold) {
		this.quantity_sold = quantity_sold;
	}
	
	public Set<Image> getImageItem() {
		return imageItem;
	}
	public void setImageItem(Set<Image> imageItem) {
		this.imageItem = imageItem;
	}
	
	public Set<Comment> getCommentItems() {
		return commentItems;
	}
	public void setCommentItems(Set<Comment> commentItems) {
		this.commentItems = commentItems;
	}
	
	public Set<InvoiceDetail> getPayments() {
		return payments;
	}
	public void setPayments(Set<InvoiceDetail> payments) {
		this.payments = payments;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Product [idproduct=" + idproduct + ", image=" + image + ", name=" + name + ", view=" + view + ", price="
				+ price + ", description=" + description + ", quantity=" + quantity + ", quantity_sold=" + quantity_sold
				+ ", imageItem=" + imageItem + ", commentItems=" + commentItems + "]";
	}
	
	
}
