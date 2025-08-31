package com.jwt.dao;

import java.util.List;

import com.jwt.model.AuditCheckpoints;



public interface CheckpointsDAO {
	public void addcheckPoints(AuditCheckpoints chekpoints );

	public List<AuditCheckpoints> getAllCheckPoints( Integer auditID);

	public void deleteCheckPoint(Integer auditID);


	public AuditCheckpoints getCheckPoint(Integer auditID);
}
