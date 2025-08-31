package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Comment;
import com.jwt.model.Employee;
@Repository
public class CommentDAOImpl  implements CommentDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addComment(Comment comment) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(comment);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getAllComment(Employee emp) {
		
		return sessionFactory.getCurrentSession().createQuery("from Comment c where c.TICKET_ID="+emp.getId()).list();
		
		
	}

	@Override
	public void deleteComment(Integer commentId) {
		Comment comment = (Comment) sessionFactory.getCurrentSession().load(
				Comment.class, commentId);
		if (null != comment) {
			this.sessionFactory.getCurrentSession().delete(comment);
		}
		
	}

	@Override
	public Comment getComment(int commentid) {
		// TODO Auto-generated method stub
		return (Comment) sessionFactory.getCurrentSession().get(Comment.class, commentid);
	}

	@Override
	public List<Comment> getAllCommentByTask(int TaskID) {
		return sessionFactory.getCurrentSession().createQuery("from Comment c where c.TICKET_ID="+TaskID).list();

	}

}
