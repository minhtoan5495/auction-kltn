package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name="user_auction")
@NamedQuery(name="UserAuction.findAll", query="SELECT u FROM UserAuction u")
public class UserAuction implements Serializable {
	private static final long serialVersionUID = -6386595161965771905L;

	@Id
	@Column(name="user_auction_id")
	private String userAuctionId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date bidtime;

	private double price;

	//bi-directional many-to-one association to Auction
	@ManyToOne
	@JoinColumn(name="auction_id")
	private Auction auction;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="username")
	private User user;

	public UserAuction() {
		setUserAuctionId(UUID.randomUUID().toString());
	}

	public String getUserAuctionId() {
		return this.userAuctionId;
	}

	public void setUserAuctionId(String userAuctionId) {
		this.userAuctionId = userAuctionId;
	}

	public Date getBidtime() {
		return this.bidtime;
	}

	public void setBidtime(Date bidtime) {
		this.bidtime = bidtime;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Auction getAuction() {
		return this.auction;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}