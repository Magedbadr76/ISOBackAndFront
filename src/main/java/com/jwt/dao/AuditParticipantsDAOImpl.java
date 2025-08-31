package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.AuditCheckpoints;
import com.jwt.model.AuditParticipants;

@Repository
public class AuditParticipantsDAOImpl implements AuditParticipantsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addcheckPoints(AuditParticipants auditParticipants) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(auditParticipants);
		   
	}

	@Override
	public List<AuditParticipants> getAllCheckPoints(Integer auditID) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from AuditParticipants A where A.audit_id="+auditID).list();
	}

	@Override
	public void deleteCheckPoint(Integer PartiId) {
		AuditParticipants Checkpoints=(AuditParticipants)sessionFactory.getCurrentSession().load(AuditParticipants.class, PartiId);
	    if(Checkpoints!=null)
		sessionFactory.getCurrentSession().delete(Checkpoints);

		
	}

	@Override
	public AuditParticipants getCheckPoint(Integer PartiId) {
		AuditParticipants Checkpoints=(AuditParticipants)sessionFactory.getCurrentSession().load(AuditParticipants.class, PartiId);
	return Checkpoints;
	}

}
