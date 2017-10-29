package hvcntt.org.shoppingweb.dao.repository;

import hvcntt.org.shoppingweb.dao.entity.TokenToVerifyEmail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TokenToVerifyEmailRepository extends JpaRepository<TokenToVerifyEmail, String> {
    TokenToVerifyEmail findByToken(String token);
}
