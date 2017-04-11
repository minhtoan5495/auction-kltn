package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="image")
public class Image implements Serializable {

	private static final long serialVersionUID = 5754786025815835882L;

	@Id
	@GeneratedValue
	@Column(name="image_id")
	private String imageId=UUID.randomUUID().toString();

	@Column(name="image_title")
	private String imageTitle;

	@Column(name="image_url")
	private String imageUrl;
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	public Image() {
	}

	public Image(String imageTitle, String imageUrl, Product product) {
		this.imageTitle = imageTitle;
		this.imageUrl = imageUrl;
		this.product = product;
	}

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public String getImageTitle() {
		return imageTitle;
	}

	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
