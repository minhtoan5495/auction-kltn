package hvcntt.org.shoppingweb.model;

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
public class Image {
	@Id
	@GeneratedValue
	private String idimage=UUID.randomUUID().toString();
	@Column(name="title")
	private String title;
	@Column(name="link_image")
	private String link_image;
	
	@ManyToOne
	@JoinColumn(name="idproduct")
	Product product;
	public Image() {
		// TODO Auto-generated constructor stub
	}
	public Image(String title, String link_image, Product product) {
		super();
		this.title = title;
		this.link_image = link_image;
		this.product = product;
	}

	public String getIdimage() {
		return idimage;
	}
	public void setIdimage(String idimage) {
		this.idimage = idimage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink_image() {
		return link_image;
	}
	public void setLink_image(String link_image) {
		this.link_image = link_image;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
