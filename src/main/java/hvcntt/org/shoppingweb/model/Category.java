package hvcntt.org.shoppingweb.model;

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
	/*@Column(name="parent_id")
	private int parent_id;*/
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="category")
	Set<Product> listProduct;
	@ManyToOne
	@JoinColumn(name="parentid")
	private Category category;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="category")
	List<Category> listCategories;
	public Category() {
		// TODO Auto-generated constructor stub
	}
	public Category(String name, int parent_id,Set<Product> listProduct) {
		super();
		this.name = name;
//		this.parent_id = parent_id;
		this.listProduct=listProduct;
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
//	public int getParent_id() {
//		return parent_id;
//	}
//	public void setParent_id(int parent_id) {
//		this.parent_id = parent_id;
//	}
	
	public Set<Product> getListProduct() {
		return listProduct;
	}
	public void setListProduct(Set<Product> listProduct) {
		this.listProduct = listProduct;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Category> getListCategories() {
		return listCategories;
	}
	public void setListCategories(List<Category> listCategories) {
		this.listCategories = listCategories;
	}
	
//	@Override
//	public String toString() {
//		return "Category [idcategory=" + idcategory + ", name=" + name + ", parent_id=" + parent_id + "]";
//	}
	
}
