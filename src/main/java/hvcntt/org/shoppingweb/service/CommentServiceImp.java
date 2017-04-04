package hvcntt.org.shoppingweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hvcntt.org.shoppingweb.model.Comment;
import hvcntt.org.shoppingweb.repository.CommentRepository;
@Service
public class CommentServiceImp implements CommentService {
	@Autowired
	CommentRepository commentRepository;
	@Override
	public List<Comment> getAll() {
		// TODO Auto-generated method stub
		return commentRepository.findAll();
	}
	@Override
	public Comment create(Comment comment) {
		// TODO Auto-generated method stub
		return commentRepository.save(comment);
	}

}
