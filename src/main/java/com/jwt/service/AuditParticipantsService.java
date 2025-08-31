package com.jwt.service;

import java.util.List;

import com.jwt.model.AuditParticipants;


public interface AuditParticipantsService {
	public void addParticipants(AuditParticipants Parti);

	public List<AuditParticipants> getAllAuditParticipants(Integer AuditId);

	public void deleteAuditParticipantss(Integer PartiID);


	public AuditParticipants getAuditParticipants(Integer PartiID);
}
