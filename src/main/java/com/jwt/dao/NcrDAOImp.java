package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.Ncr;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class NcrDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addNcr(Ncr ncr) {
		sessionFactory.getCurrentSession().saveOrUpdate(ncr);

	}

	@SuppressWarnings("unchecked")
	public List<Ncr> getAllNcrs() {
		
		List<Ncr> allNcrs = sessionFactory.getCurrentSession().createQuery("from Ncr").list();
		System.out.println("***** "+ allNcrs.size());
		
		return allNcrs;
				
	  
	}

	
	public void deleteNcr(Integer ncrId) {
		Ncr ncr = (Ncr) sessionFactory.getCurrentSession().load(
				Ncr.class, ncrId);
		if (null != ncr) {
			this.sessionFactory.getCurrentSession().delete(ncr);
		}

	}

	public Ncr getNcr(int ncrId) {
		return (Ncr) sessionFactory.getCurrentSession().get(
				Ncr.class, ncrId);
	}

	
	public Ncr updateNcr(Ncr ncr) {
		sessionFactory.getCurrentSession().update(ncr);
		return ncr;
	}

}