package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.NCTrans;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class NCTransDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addNCTrans(NCTrans ncTrans) {
		sessionFactory.getCurrentSession().saveOrUpdate(ncTrans);

	}

	@SuppressWarnings("unchecked")
	public List<NCTrans> getAllNCTranss() {
		
		List<NCTrans> allNCTranss = sessionFactory.getCurrentSession().createQuery("from NCTrans").list();
		System.out.println("***** "+ allNCTranss.size());
		
		return allNCTranss;
				
	  
	}

	
	public void deleteNCTrans(Integer ncTransId) {
		NCTrans ncTrans = (NCTrans) sessionFactory.getCurrentSession().load(
				NCTrans.class, ncTransId);
		if (null != ncTrans) {
			this.sessionFactory.getCurrentSession().delete(ncTrans);
		}

	}

	public NCTrans getNCTrans(int ncTransId) {
		return (NCTrans) sessionFactory.getCurrentSession().get(
				NCTrans.class, ncTransId);
	}

	
	public NCTrans updateNCTrans(NCTrans ncTrans) {
		sessionFactory.getCurrentSession().update(ncTrans);
		return ncTrans;
	}

}