package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.Role;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class RoleDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addRole(Role role) {
		sessionFactory.getCurrentSession().saveOrUpdate(role);

	}

	@SuppressWarnings("unchecked")
	public List<Role> getAllRoles() {
		
		List<Role> allRoles = sessionFactory.getCurrentSession().createQuery("from Role").list();
		System.out.println("***** "+ allRoles.size());
		
		return allRoles;
				
	  
	}

	
	public void deleteRole(Integer roleId) {
		Role role = (Role) sessionFactory.getCurrentSession().load(
				Role.class, roleId);
		if (null != role) {
			this.sessionFactory.getCurrentSession().delete(role);
		}

	}

	public Role getRole(int roleId) {
		return (Role) sessionFactory.getCurrentSession().get(
				Role.class, roleId);
	}

	
	public Role updateRole(Role role) {
		sessionFactory.getCurrentSession().update(role);
		return role;
	}

}