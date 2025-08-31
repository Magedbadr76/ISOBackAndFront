package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.NCTransExceeded;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class NCTransExceededDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addNCTransExceeded(NCTransExceeded ncTransExceeded) {
		sessionFactory.getCurrentSession().saveOrUpdate(ncTransExceeded);

	}

	@SuppressWarnings("unchecked")
	public List<NCTransExceeded> getAllNCTransExceededs() {
		
		List<NCTransExceeded> allNCTransExceededs = sessionFactory.getCurrentSession().createQuery("from NCTransExceeded").list();
		System.out.println("***** "+ allNCTransExceededs.size());
		
		return allNCTransExceededs;
				
	  
	}

	
	public void deleteNCTransExceeded(Integer ncTransExceededId) {
		NCTransExceeded ncTransExceeded = (NCTransExceeded) sessionFactory.getCurrentSession().load(
				NCTransExceeded.class, ncTransExceededId);
		if (null != ncTransExceeded) {
			this.sessionFactory.getCurrentSession().delete(ncTransExceeded);
		}

	}

	public NCTransExceeded getNCTransExceeded(int ncTransExceededId) {
		return (NCTransExceeded) sessionFactory.getCurrentSession().get(
				NCTransExceeded.class, ncTransExceededId);
	}

	
	public NCTransExceeded updateNCTransExceeded(NCTransExceeded ncTransExceeded) {
		sessionFactory.getCurrentSession().update(ncTransExceeded);
		return ncTransExceeded;
	}

}