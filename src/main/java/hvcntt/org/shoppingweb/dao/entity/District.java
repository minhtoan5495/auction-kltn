package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "district")
@NamedQuery(name="District.findAll", query="SELECT d FROM District d")
public class District implements Serializable {
	private static final long serialVersionUID = -8441148627296510528L;

	@Id
	@Column(name="district_id")
	private String districtId;

	@Column(name="district_name")
	private String districtName;

	//bi-directional many-to-one association to ShippingInfo
	@OneToMany(mappedBy="district")
	@JsonBackReference
	private List<ShippingInfo> shippingInfos;

	@ManyToOne(targetEntity = City.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "city_id")
	@JsonManagedReference
	private City city;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="district")
	@JsonBackReference
	private List<User> users;

	public District() {
	}
	
	public District(String districtId, String districtName, List<ShippingInfo> shippingInfos, List<User> users) {
		super();
		this.districtId = districtId;
		this.districtName = districtName;
		this.shippingInfos = shippingInfos;
		this.users = users;
	}

	public String getDistrictId() {
		return this.districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getDistrictName() {
		return this.districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public List<ShippingInfo> getShippingInfos() {
		return this.shippingInfos;
	}

	public void setShippingInfos(List<ShippingInfo> shippingInfos) {
		this.shippingInfos = shippingInfos;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}
}