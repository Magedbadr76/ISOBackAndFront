package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.CompleteTrans;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class CompleteTransDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addCompleteTrans(CompleteTrans completeTrans) {
		sessionFactory.getCurrentSession().saveOrUpdate(completeTrans);

	}

	@SuppressWarnings("unchecked")
	public List<CompleteTrans> getAllCompleteTranss() {
		
		List<CompleteTrans> allCompleteTranss = sessionFactory.getCurrentSession().createQuery("from CompleteTrans").list();
		System.out.println("***** "+ allCompleteTranss.size());
		
		return allCompleteTranss;
				
	  
	}

	
	public void deleteCompleteTrans(Integer completeTransId) {
		CompleteTrans completeTrans = (CompleteTrans) sessionFactory.getCurrentSession().load(
				CompleteTrans.class, completeTransId);
		if (null != completeTrans) {
			this.sessionFactory.getCurrentSession().delete(completeTrans);
		}

	}

	public CompleteTrans getCompleteTrans(int completeTransId) {
		return (CompleteTrans) sessionFactory.getCurrentSession().get(
				CompleteTrans.class, completeTransId);
	}

	
	public CompleteTrans updateUser(CompleteTrans completeTrans) {
		sessionFactory.getCurrentSession().update(completeTrans);
		return completeTrans;
	}

}