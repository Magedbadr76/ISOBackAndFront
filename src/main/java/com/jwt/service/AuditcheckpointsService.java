package com.jwt.service;

import java.util.List;

import com.jwt.model.AuditCheckpoints;



public interface AuditcheckpointsService {
	public void addCheckPoint(AuditCheckpoints checkpoint);

	public List<AuditCheckpoints> getAllAuditCheckPoints(Integer AuditId);

	public void deleteAuditCheckPoints(Integer CheckID);


	public AuditCheckpoints getAuditCheckPoints(Integer CheckID);
}
