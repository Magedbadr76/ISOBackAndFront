package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CommentDAO;
import com.jwt.dao.EmployeeDAO;
import com.jwt.model.Comment;
import com.jwt.model.Employee;
@Service
@Transactional
public class CommentServiceImpl  implements CommentService{
	@Autowired
	private CommentDAO commentDAO ;

	@Override
	@Transactional
	public void addComment(Comment comment) {
     commentDAO.addComment(comment);		
	}

	@Override
	public List<Comment> getAllComment(Employee emp) {
		// TODO Auto-generated method stub
		return commentDAO.getAllComment(emp);
	}

	
	
	@Override
	public void deleteComment(Integer commentId) {
      commentDAO.deleteComment(commentId);		
	}

	@Override
	public Comment getComment(int commentid) {
		// TODO Auto-generated method stub
		return commentDAO.getComment(commentid);
	}

	@Override
	public List<Comment> getAllCommentByTask(int TaskId) {
		// TODO Auto-generated method stub
		return commentDAO.getAllCommentByTask(TaskId);
	}

}
