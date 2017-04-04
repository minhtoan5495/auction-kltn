package hvcntt.org.shoppingweb.model;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="shippinginfor")
public class ShippingInfor {
	@Id
	@GeneratedValue
	private String idshippinginfor=UUID.randomUUID().toString();
	@Column(name="streetname")
	private String streetname;
	@Column(name="housenumber")
	private String housenumber;
	@Column(name="city")
	private String city;
	@Column(name="district")
	private String district;
	@OneToOne
	@JoinColumn(name="username")
	User user;
	public ShippingInfor() {
		// TODO Auto-generated constructor stub
	}
	public ShippingInfor(String streetname, String housenumber, String city, String district,User user) {
		super();
		this.streetname = streetname;
		this.housenumber = housenumber;
		this.city = city;
		this.district = district;
		this.user=user;
	}

	
	public String getIdshippinginfor() {
		return idshippinginfor;
	}
	public void setIdshippinginfor(String idshippinginfor) {
		this.idshippinginfor = idshippinginfor;
	}
	public String getStreetname() {
		return streetname;
	}
	public void setStreetname(String streetname) {
		this.streetname = streetname;
	}
	public String getHousenumber() {
		return housenumber;
	}
	public void setHousenumber(String housenumber) {
		this.housenumber = housenumber;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
