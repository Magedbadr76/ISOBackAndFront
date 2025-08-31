package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.AuditTransaction;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class AuditTransDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addAuditTransaction(AuditTransaction auditTransaction) {
		sessionFactory.getCurrentSession().save(auditTransaction);

	}

	@SuppressWarnings("unchecked")
	public List<AuditTransaction> getAllAuditTransactions() {
		
		List<AuditTransaction> allAuditTransactions = sessionFactory.getCurrentSession().createQuery("from AuditTransaction").list();
		System.out.println("***** "+ allAuditTransactions.size());
		
		return allAuditTransactions;
				
	  
	}

	
	public void deleteAuditTransaction(Integer auditTransactionId) {
		AuditTransaction auditTransaction = (AuditTransaction) sessionFactory.getCurrentSession().load(
				AuditTransaction.class, auditTransactionId);
		if (null != auditTransaction) {
			this.sessionFactory.getCurrentSession().delete(auditTransaction);
		}

	}

	public AuditTransaction getAuditTransaction(int auditTransactionId) {
		return (AuditTransaction) sessionFactory.getCurrentSession().get(
				AuditTransaction.class, auditTransactionId);
	}

	public AuditTransaction getAuditTransactionbySchedule(int auditTransactionId) {
		List<AuditTransaction> allAuditTransactions = sessionFactory.getCurrentSession().createQuery("from AuditTransaction where trans_schedule_id = "+auditTransactionId).list();
        if(allAuditTransactions!= null &&allAuditTransactions.size()>0)
		return allAuditTransactions.get(0);
        else {
        	return null;
        }
		
	}
	
	public AuditTransaction updateAuditTransaction(AuditTransaction auditTransaction) {
		sessionFactory.getCurrentSession().update(auditTransaction);
		return auditTransaction;
	}

}