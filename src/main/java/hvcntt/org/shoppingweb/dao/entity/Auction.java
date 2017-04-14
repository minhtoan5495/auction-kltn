package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "auction")
@NamedQuery(name="Auction.findAll", query="SELECT a FROM Auction a")
public class Auction implements Serializable {
	private static final long serialVersionUID = -1134178269384478834L;

	@Id
	@Column(name="auction_id")
	private String auctionId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_time")
	private Date endTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_time")
	private Date startTime;

	private String status;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;

	//bi-directional many-to-one association to UserAuction
	@OneToMany(mappedBy="auction")
	private List<UserAuction> userAuctions;

	public Auction() {
	}

	public String getAuctionId() {
		return this.auctionId;
	}

	public void setAuctionId(String auctionId) {
		this.auctionId = auctionId;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<UserAuction> getUserAuctions() {
		return this.userAuctions;
	}

	public void setUserAuctions(List<UserAuction> userAuctions) {
		this.userAuctions = userAuctions;
	}

	public UserAuction addUserAuction(UserAuction userAuction) {
		getUserAuctions().add(userAuction);
		userAuction.setAuction(this);

		return userAuction;
	}

	public UserAuction removeUserAuction(UserAuction userAuction) {
		getUserAuctions().remove(userAuction);
		userAuction.setAuction(null);

		return userAuction;
	}

}