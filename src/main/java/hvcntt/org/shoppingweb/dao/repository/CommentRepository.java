package hvcntt.org.shoppingweb.dao.repository;

import hvcntt.org.shoppingweb.dao.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment, String> {

}