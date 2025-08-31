package com.jwt.dao;

import java.util.List;

import com.jwt.model.Comment;
import com.jwt.model.Employee;

public interface CommentDAO {
	public void addComment(Comment employee);

	public List<Comment> getAllComment(Employee emp);
	public List<Comment> getAllCommentByTask(int TaskID);

	public void deleteComment(Integer commentId);


	public Comment getComment(int commentid);
}
