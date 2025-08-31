package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.AuditArea;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Repository
public class AuditAreaDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addAuditArea(AuditArea auditArea) {
		sessionFactory.getCurrentSession().saveOrUpdate(auditArea);

	}

	@SuppressWarnings("unchecked")
	public List<AuditArea> getAllAuditAreas() {
		
		List<AuditArea> allAuditAreas = sessionFactory.getCurrentSession().createQuery("from AuditArea").list();
		System.out.println("***** "+ allAuditAreas.size());
		
		return allAuditAreas;
				
	  
	}

	
	public void deleteAuditArea(Integer auditAreaId) {
		AuditArea auditArea = (AuditArea) sessionFactory.getCurrentSession().load(
				User.class, auditAreaId);
		if (null != auditArea) {
			this.sessionFactory.getCurrentSession().delete(auditArea);
		}

	}

	public AuditArea getAuditArea(int auditAreaId) {
		return (AuditArea) sessionFactory.getCurrentSession().get(
				AuditArea.class, auditAreaId);
	}

	
	public AuditArea updateAuditArea(AuditArea auditArea) {
		sessionFactory.getCurrentSession().update(auditArea);
		return auditArea;
	}

}