package hvcntt.org.shoppingweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, String> {

}
