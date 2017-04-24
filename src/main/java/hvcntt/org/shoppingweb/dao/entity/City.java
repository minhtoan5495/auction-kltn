package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "city")
@NamedQuery(name="City.findAll", query="SELECT c FROM City c")
public class City implements Serializable {
	private static final long serialVersionUID = 4614502438211739158L;

	@Id
	@Column(name="city_id")
	private String cityId;

	@Column(name="city_name")
	private String cityName;

	//bi-directional many-to-one association to ShippingInfo
	@OneToMany(mappedBy="city")
	private List<ShippingInfo> shippingInfos;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="city",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private List<User> users;

	@OneToMany(mappedBy = "city", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<District> districts;

	public City() {
	}
	
	public City(String cityId, String cityName, List<ShippingInfo> shippingInfos, List<User> users) {
		super();
		this.cityId = cityId;
		this.cityName = cityName;
		this.shippingInfos = shippingInfos;
		this.users = users;
	}

	public String getCityId() {
		return this.cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
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

	public List<District> getDistricts() {
		return districts;
	}

	public void setDistricts(List<District> districts) {
		this.districts = districts;
	}
}