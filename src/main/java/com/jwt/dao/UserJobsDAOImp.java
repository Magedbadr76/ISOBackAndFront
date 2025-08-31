package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;
import com.jwt.model.UserJobs;

@Repository
public class UserJobsDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addUserJobs(UserJobs userJobs) {
		sessionFactory.getCurrentSession().saveOrUpdate(userJobs);

	}

	@SuppressWarnings("unchecked")
	public List<UserJobs> getAllUserJobs() {
		
		List<UserJobs> allUserJobs = sessionFactory.getCurrentSession().createQuery("from UserJobs").list();
		System.out.println("***** "+ allUserJobs.size());
		
		return allUserJobs;
				
	  
	}

	
	public void deleteUserJobs(Integer userJobsId) {
		UserJobs userJobs = (UserJobs) sessionFactory.getCurrentSession().load(
				UserJobs.class, userJobsId);
		if (null != userJobs) {
			this.sessionFactory.getCurrentSession().delete(userJobs);
		}

	}

	public UserJobs getUserJobs(int userJobsId) {
		return (UserJobs) sessionFactory.getCurrentSession().get(
				UserJobs.class, userJobsId);
	}

	
	public UserJobs updateUserJobs(UserJobs userJobs) {
		sessionFactory.getCurrentSession().update(userJobs);
		return userJobs;
	}

}