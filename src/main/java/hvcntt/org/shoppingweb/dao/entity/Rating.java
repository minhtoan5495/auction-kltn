package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.io.Serializable;
import java.util.Date;
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
	@Column(name="create_date")
	private Date createDate;
	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="username")
	@JsonBackReference
	private User user;

	//bi-directional many-to-one association to Product
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="product_id")
	@JsonBackReference
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}