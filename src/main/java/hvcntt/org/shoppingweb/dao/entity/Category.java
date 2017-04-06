package hvcntt.org.shoppingweb.dao.entity;

import java.util.List;
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
@Table(name="category")
public class Category {
	@Id
	@GeneratedValue
	private String idcategory=UUID.randomUUID().toString();

	@Column(name="name")
	private String name;

	@Column(name="parentid")
	private String parentId;

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="category")
	private Set<Product> listProduct;

//	@ManyToOne
//	@JoinColumn(name="parentid")
//	private Category category;
//
//	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="category")
//	private List<Category> listCategories;

	public Category() {
	}
	public Category(String name, String parentId,Set<Product> listProduct) {
		super();
		this.name = name;
		this.parentId = parentId;
		this.listProduct=listProduct;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getIdcategory() {
		return idcategory;
	}
	public void setIdcategory(String idcategory) {
		this.idcategory = idcategory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Set<Product> getListProduct() {
		return listProduct;
	}
	public void setListProduct(Set<Product> listProduct) {
		this.listProduct = listProduct;
	}
//	public Category getCategory() {
//		return category;
//	}
//	public void setCategory(Category category) {
//		this.category = category;
//	}
//	public List<Category> getListCategories() {
//		return listCategories;
//	}
//	public void setListCategories(List<Category> listCategories) {
//		this.listCategories = listCategories;
//	}
	
//	@Override
//	public String toString() {
//		return "Category [idcategory=" + idcategory + ", name=" + name + ", parent_id=" + parent_id + "]";
//	}
	
}
