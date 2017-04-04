package hvcntt.org.shoppingweb.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="user")
public class User {
	private String username;
	private String password;
	private String passwordConfirm;
	private String email;
	private String firstname;
	private String lastname;
	private String phone;
	private String address;
	private Set<Role> roles;
	private Set<Comment> comments;
	private Set<Invoice_Detail> payments;
	private ShippingInfor addresship;
	//private Information information;
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String firstname, String lastname, String phone, String address) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.phone = phone;
		this.address = address;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Id
	@Column(name="username")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Transient
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	@ManyToMany
	@JoinTable(name="role_user",joinColumns = @JoinColumn(name="username"),inverseJoinColumns=@JoinColumn(name="role_id"))
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="user")
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="user")
	public Set<Invoice_Detail> getPayments() {
		return payments;
	}
	public void setPayments(Set<Invoice_Detail> payments) {
		this.payments = payments;
	}
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="user")
	public ShippingInfor getAddresship() {
		return addresship;
	}
	public void setAddresship(ShippingInfor addresship) {
		this.addresship = addresship;
	}
//	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="user")
//	public Information getInformation() {
//		return information;
//	}
//	public void setInformation(Information information) {
//		this.information = information;
//	}
	
	
	
}
