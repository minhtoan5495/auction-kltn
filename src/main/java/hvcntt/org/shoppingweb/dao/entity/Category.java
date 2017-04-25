package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "category")
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = -2196480188211956616L;

	@Id
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="category_id")
	private String categoryId;

	@Column(name="category_name")
	private String categoryName;

	@Column(name="parent_id")
	private String parentId;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="category", fetch=FetchType.EAGER)
	@JsonManagedReference
	private List<Product> products;

	public Category() {
		setCategoryId(UUID.randomUUID().toString());
	}

	public String getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setCategory(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setCategory(null);

		return product;
	}

}