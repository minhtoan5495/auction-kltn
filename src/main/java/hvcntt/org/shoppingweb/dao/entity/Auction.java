package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.Date;
import java.util.List;
import java.util.UUID;

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
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="product_id")
	@JsonBackReference
	private Product product;

	//bi-directional many-to-one association to UserAuction
	@OneToMany(mappedBy="auction",fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JsonManagedReference
	private List<UserAuction> userAuctions;

	public Auction() {
		setAuctionId(UUID.randomUUID().toString());
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

}