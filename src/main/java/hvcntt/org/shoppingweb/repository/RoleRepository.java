package hvcntt.org.shoppingweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.model.Role;

public interface RoleRepository extends JpaRepository<Role, String>{
	
}
