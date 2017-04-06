package hvcntt.org.shoppingweb.dao.entity;

import java.util.Set;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role {
	private String idrole=UUID.randomUUID().toString();
	private String name;
	private Set<User> users;
	
	@Id
	@GeneratedValue()
	
	public String getName() {
		return name;
	}
	
	public String getIdrole() {
		return idrole;
	}

	public void setIdrole(String idrole) {
		this.idrole = idrole;
	}

	public void setName(String name) {
		this.name = name;
	}
	@ManyToMany(mappedBy="roles")
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	
}
