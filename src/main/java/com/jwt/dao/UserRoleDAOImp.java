package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;
import com.jwt.model.UserRole;

@Repository
public class UserRoleDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addUserRole(UserRole userRole) {
		sessionFactory.getCurrentSession().saveOrUpdate(userRole);

	}

	@SuppressWarnings("unchecked")
	public List<UserRole> getAllUserRoles() {
		
		List<UserRole> allUserRoles = sessionFactory.getCurrentSession().createQuery("from UserRole").list();
		System.out.println("***** "+ allUserRoles.size());
		
		return allUserRoles;
				
	  
	}
	
	@SuppressWarnings("unchecked")
	public List<UserRole> getAllUserRoleByUserID(Integer UserId) {
		
		List<UserRole> allUserRoles = sessionFactory.getCurrentSession().createQuery("from UserRole where user_id="+UserId).list();
		System.out.println("***** "+ allUserRoles.size());
		
		return allUserRoles;
				
	  
	}

	
	public void deleteUserRole(Integer userRoleId) {
		UserRole userRole = (UserRole) sessionFactory.getCurrentSession().load(
				UserRole.class, userRoleId);
		if (null != userRole) {
			this.sessionFactory.getCurrentSession().delete(userRole);
		}

	}

	public UserRole getUserRole(int userRoleId) {
		return (UserRole) sessionFactory.getCurrentSession().get(
				UserRole.class, userRoleId);
	}

	
	public UserRole updateUserRole(UserRole userRole) {
		sessionFactory.getCurrentSession().update(userRole);
		return userRole;
	}

}