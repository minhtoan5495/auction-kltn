package hvcntt.org.shoppingweb.service;

import java.util.List;

public interface CommentService {

	List<Comment> getAll();
	Comment create(Comment comment);
}
