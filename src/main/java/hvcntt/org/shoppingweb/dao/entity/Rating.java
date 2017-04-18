package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import java.util.UUID;
import javax.persistence.*;


@Entity
@Table(name = "rating")
@NamedQuery(name="Rating.findAll", query="SELECT r FROM Rating r")
public class Rating implements Serializable {
	private static final long serialVersionUID = 269554955445124013L;

	@Id
	@Column(name="rating_id")
	private String ratingId;

	private int rating;

	@Column(name="rating_title")
	private String ratingTitle;

	@Column(name="rating_content")
	private String ratingContent;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="username")
	private User user;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	public Rating() {
		setRatingId(UUID.randomUUID().toString());
	}

	public String getRatingId() {
		return this.ratingId;
	}

	public void setRatingId(String ratingId) {
		this.ratingId = ratingId;
	}

	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getRatingContent() {
		return this.ratingContent;
	}

	public void setRatingContent(String ratingContent) {
		this.ratingContent = ratingContent;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getRatingTitle() {
		return ratingTitle;
	}

	public void setRatingTitle(String ratingTitle) {
		this.ratingTitle = ratingTitle;
	}
}