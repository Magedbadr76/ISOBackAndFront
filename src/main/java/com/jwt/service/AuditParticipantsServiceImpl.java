package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.AuditParticipantsDAO;
import com.jwt.dao.AuditParticipantsDAOImpl;
import com.jwt.dao.CheckpointsDAOImpl;
import com.jwt.model.AuditParticipants;

@Service
@Transactional
public class AuditParticipantsServiceImpl implements AuditParticipantsService{

	@Autowired
	private AuditParticipantsDAOImpl auditParticipantsDAO;
	
	@Override
	public void addParticipants(AuditParticipants Parti) {
		// TODO Auto-generated method stub
		auditParticipantsDAO.addcheckPoints(Parti);
	}

	@Override
	public List<AuditParticipants> getAllAuditParticipants(Integer AuditId) {
		// TODO Auto-generated method stub
		return auditParticipantsDAO.getAllCheckPoints(AuditId);
	}

	@Override
	public void deleteAuditParticipantss(Integer PartiID) {
		// TODO Auto-generated method stub
		auditParticipantsDAO.deleteCheckPoint(PartiID);
		
	}

	@Override
	public AuditParticipants getAuditParticipants(Integer PartiID) {
		// TODO Auto-generated method stub
		return auditParticipantsDAO.getCheckPoint(PartiID);
	}

}
