package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import hvcntt.org.shoppingweb.dao.dto.AuctionStatus;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "auction")
@NamedQuery(name="Auction.findAll", query="SELECT a FROM Auction a")
public class Auction implements Serializable {
	private static final long serialVersionUID = -1134178269384478834L;

	private String auctionId;

	private Date endTime;

	private Date startTime;

	private AuctionStatus auctionStatus;

	private Product product;

	private List<UserAuction> userAuctions;

	public Auction() {
		setAuctionId(UUID.randomUUID().toString());
	}

	@Id
	@Column(name="auction_id")
	public String getAuctionId() {
		return this.auctionId;
	}

	public void setAuctionId(String auctionId) {
		this.auctionId = auctionId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_time")
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_time")
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Column(name="auction_status")
	@Enumerated(EnumType.STRING)
	public AuctionStatus getAuctionStatus() {
		return auctionStatus;
	}

	public void setAuctionStatus(AuctionStatus auctionStatus) {
		this.auctionStatus = auctionStatus;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="product_id")
	@JsonBackReference
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@OneToMany(mappedBy="auction",fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JsonManagedReference
	public List<UserAuction> getUserAuctions() {
		return this.userAuctions;
	}

	public void setUserAuctions(List<UserAuction> userAuctions) {
		this.userAuctions = userAuctions;
	}

}