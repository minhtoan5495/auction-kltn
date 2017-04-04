package hvcntt.org.shoppingweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="cartitem")
public class CartItem {
	@Id
	@GeneratedValue
	private int idcartitem;
	@Column(name="quantity")
	private int quantity;
	@Column(name="totalprice")
	private float totalprice;
	@ManyToOne
	@JoinColumn(name="idproduct")
	Product product;
	public CartItem() {
		// TODO Auto-generated constructor stub
	}
	
	public CartItem(int quantity, Product product) {
		super();
		this.quantity = quantity;
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public int getIdcartitem() {
		return idcartitem;
	}
	public void setIdcartitem(int idcartitem) {
		this.idcartitem = idcartitem;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}
	@Override
	public String toString() {
		return "CartItem [idcartitem=" + idcartitem + ", quantity=" + quantity + ", totalprice=" + totalprice
				+ ", product=" + product + "]";
	}
	
	
}
