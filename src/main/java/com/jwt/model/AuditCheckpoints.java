package com.jwt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="audit_checkpoints")
public class AuditCheckpoints {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;
	@Column
	Integer audit_id;
	@Column
	String QS;
	@Column
	String NOTES;
	@Column
	String RESULT;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAudit_id() {
		return audit_id;
	}
	public void setAudit_id(Integer audit_id) {
		this.audit_id = audit_id;
	}
	public String getQS() {
		return QS;
	}
	public void setQS(String qS) {
		QS = qS;
	}
	public String getNOTES() {
		return NOTES;
	}
	public void setNOTES(String nOTES) {
		NOTES = nOTES;
	}
	public String getRESULT() {
		return RESULT;
	}
	public void setRESULT(String rESULT) {
		RESULT = rESULT;
	}
}
