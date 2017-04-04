package hvcntt.org.shoppingweb.service;

import java.util.List;

import hvcntt.org.shoppingweb.model.Comment;

public interface CommentService {
	public List<Comment> getAll();
	Comment create(Comment comment);
}
