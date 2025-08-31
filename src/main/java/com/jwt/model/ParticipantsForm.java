package com.jwt.model;

import java.util.List;

public class ParticipantsForm {
	List<AuditParticipants> lstParticipants;
    public List<AuditParticipants> getLstParticipants() {
		return lstParticipants;
	}
	public void setLstParticipants(List<AuditParticipants> lstParticipants) {
		this.lstParticipants = lstParticipants;
	}
	public Integer getAudit_id() {
		return Audit_id;
	}
	public void setAudit_id(Integer audit_id) {
		Audit_id = audit_id;
	}
	Integer Audit_id;
    
}
