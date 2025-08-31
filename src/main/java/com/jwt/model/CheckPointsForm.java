package com.jwt.model;

import java.util.List;

public class CheckPointsForm {
	List<AuditCheckpoints> lstCheckpoints;
	Integer AuditID;

	public Integer getAuditID() {
		return AuditID;
	}

	public void setAuditID(Integer auditID) {
		AuditID = auditID;
	}

	public List<AuditCheckpoints> getLstCheckpoints() {
		return lstCheckpoints;
	}

	public void setLstCheckpoints(List<AuditCheckpoints> lstCheckpoints) {
		this.lstCheckpoints = lstCheckpoints;
	}

}
