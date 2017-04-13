package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "district")
@NamedQuery(name="District.findAll", query="SELECT d FROM District d")
public class District implements Serializable {
	private static final long serialVersionUID = -8441148627296510528L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="district_id")
	private String districtId;

	@Column(name="district_name")
	private String districtName;

	//bi-directional many-to-one association to ShippingInfo
	@OneToMany(mappedBy="district")
	private List<ShippingInfo> shippingInfos;

	//bi-directional many-to-one association to User
	@OneToMany(mappedBy="district")
	private List<User> users;

	public District() {
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

	public ShippingInfo addShippingInfo(ShippingInfo shippingInfo) {
		getShippingInfos().add(shippingInfo);
		shippingInfo.setDistrict(this);

		return shippingInfo;
	}

	public ShippingInfo removeShippingInfo(ShippingInfo shippingInfo) {
		getShippingInfos().remove(shippingInfo);
		shippingInfo.setDistrict(null);

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
		user.setDistrict(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setDistrict(null);

		return user;
	}

}