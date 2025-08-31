package com.jwt.dao;

import java.util.List;

import com.jwt.model.AuditParticipants;


public interface AuditParticipantsDAO {
	public void addcheckPoints(AuditParticipants auditParticipants );

	public List<AuditParticipants> getAllCheckPoints( Integer auditID);

	public void deleteCheckPoint(Integer PartiId);


	public AuditParticipants getCheckPoint(Integer PartiId);
}
