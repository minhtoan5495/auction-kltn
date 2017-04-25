package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="product_detail")
@NamedQuery(name="ProductDetail.findAll", query="SELECT p FROM ProductDetail p")
public class ProductDetail implements Serializable {
	private static final long serialVersionUID = 5854685643364326441L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_detail_id")
	private String productDetailId;

	private String color;

	private String size;

	@Column(name="stock_quantity")
	private int stockQuantity;

	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	public ProductDetail() {
	}

	public String getProductDetailId() {
		return this.productDetailId;
	}

	public void setProductDetailId(String productDetailId) {
		this.productDetailId = productDetailId;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

//	public String getProductId() {
//		return this.productId;
//	}
//
//	public void setProductId(String productId) {
//		this.productId = productId;
//	}

	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getStockQuantity() {
		return this.stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}