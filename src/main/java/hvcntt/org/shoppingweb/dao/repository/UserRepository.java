package hvcntt.org.shoppingweb.dao.repository;

import hvcntt.org.shoppingweb.dao.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<User, String> {

	User findByUsername(String username);

	@Modifying
	@Transactional
	@Query("UPDATE User u SET u.accountNonLocked = :accountNonLocked WHERE u.username = :username")
	public void updateLocked(@Param("username")String username, @Param("accountNonLocked")boolean accountNonLocked);
}
