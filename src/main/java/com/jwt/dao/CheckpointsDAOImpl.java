package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Attachment;
import com.jwt.model.AuditCheckpoints;

@Repository
public class CheckpointsDAOImpl implements CheckpointsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addcheckPoints(AuditCheckpoints chekpoints) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(chekpoints);
	}

	@Override
	public List<AuditCheckpoints> getAllCheckPoints(Integer auditID) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from AuditCheckpoints A where A.audit_id="+auditID).list();

	}

	@Override
	public void deleteCheckPoint(Integer auditID) {
		// TODO Auto-generated method stub
		AuditCheckpoints Checkpoints=(AuditCheckpoints)sessionFactory.getCurrentSession().load(AuditCheckpoints.class, auditID);
	    if(Checkpoints!=null)
		sessionFactory.getCurrentSession().delete(Checkpoints);

		
	}

	@Override
	public AuditCheckpoints getCheckPoint(Integer auditID) {
		AuditCheckpoints Checkpoints=(AuditCheckpoints)sessionFactory.getCurrentSession().load(AuditCheckpoints.class, auditID);
		return Checkpoints;
	}

}
