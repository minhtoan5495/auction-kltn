package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.dao.entity.Comment;

public interface CommentService {

	List<Comment> getAll();
	Comment create(Comment comment);
}
