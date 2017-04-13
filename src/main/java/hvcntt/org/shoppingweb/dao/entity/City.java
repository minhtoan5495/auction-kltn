package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@NamedQuery(name="City.findAll", query="SELECT c FROM City c")
public class City implements Serializable {
	private static final long serialVersionUID = 4614502438211739158L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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

	public City() {
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

	public ShippingInfo addShippingInfo(ShippingInfo shippingInfo) {
		getShippingInfos().add(shippingInfo);
		shippingInfo.setCity(this);

		return shippingInfo;
	}

	public ShippingInfo removeShippingInfo(ShippingInfo shippingInfo) {
		getShippingInfos().remove(shippingInfo);
		shippingInfo.setCity(null);

		return shippingInfo;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setCity(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setCity(null);

		return user;
	}

}