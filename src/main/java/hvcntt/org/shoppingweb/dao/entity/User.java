package hvcntt.org.shoppingweb.dao.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {

	private static final long serialVersionUID = -3939291008303869200L;

	private String username;

	private boolean accountNonLocked;

	private String address;

	private String passwordConfirm;

	@Temporal(TemporalType.DATE)
	private Date birthday;

	private String email;

	private String name;

	private String password;

	private String phone;

	// bi-directional many-to-one association to Rating
	private List<Rating> ratings;

	// bi-directional many-to-one association to City
	private City city;

	// bi-directional many-to-one association to District
	private District district;

	// bi-directional many-to-one association to UserAuction
	private List<UserAuction> userAuctions;

	// bi-directional many-to-many association to Role
	private List<Role> roles;

	public User() {
	}

	@Id
	@Column(name = "username")
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(mappedBy = "user")
	public List<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public Rating addRating(Rating rating) {
		getRatings().add(rating);
		rating.setUser(this);

		return rating;
	}

	public Rating removeRating(Rating rating) {
		getRatings().remove(rating);
		rating.setUser(null);

		return rating;
	}

	@ManyToOne
	@JoinColumn(name = "city_id")
	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	@ManyToOne
	@JoinColumn(name = "district_id")
	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	@OneToMany(mappedBy = "user")
	public List<UserAuction> getUserAuctions() {
		return this.userAuctions;
	}

	public void setUserAuctions(List<UserAuction> userAuctions) {
		this.userAuctions = userAuctions;
	}

	public UserAuction addUserAuction(UserAuction userAuction) {
		getUserAuctions().add(userAuction);
		userAuction.setUser(this);

		return userAuction;
	}

	public UserAuction removeUserAuction(UserAuction userAuction) {
		getUserAuctions().remove(userAuction);
		userAuction.setUser(null);

		return userAuction;
	}

	@ManyToMany
	@JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "username"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@Transient
	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	
}