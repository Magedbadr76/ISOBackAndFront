package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class UserDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public Integer addUser(User user) {
		return (Integer) sessionFactory.getCurrentSession().save(user);

	}

	@SuppressWarnings("unchecked")
	public List<User> getAllUsers() {
		
		List<User> allUsers = sessionFactory.getCurrentSession().createQuery("from User").list();
		System.out.println("***** "+ allUsers.size());
		
		return allUsers;
				
	  
	}

	
	public void deleteUser(Integer userId) {
		User user = (User) sessionFactory.getCurrentSession().load(
				User.class, userId);
		if (null != user) {
			this.sessionFactory.getCurrentSession().delete(user);
		}

	}

	public User getUser(int userId) {
		return (User) sessionFactory.getCurrentSession().get(
				User.class, userId);
	}

	public User getUserByName(String userName) {
		List<User> allUsers = sessionFactory.getCurrentSession().createQuery("from User where uSER_NAME='"+userName+"'").list();
		
		   return allUsers.get(0);
	}
	
	public User updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
		return user;
	}

}