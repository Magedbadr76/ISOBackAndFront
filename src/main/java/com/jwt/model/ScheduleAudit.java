package com.jwt.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Formula;

@Entity
@Table(name = "SCHEDULE_AUDIT")
public class ScheduleAudit implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int SCHEDULE_ID;

	@Column
	private Date SCHEDULE_DATE;

	@Column
	private String SCHEDULE_DEPT;
	
	@Column
	private int SCHEDULE_AUDITAREA;
	            
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "SCHEDULE_AUDITOR_ID", referencedColumnName = "User_ID")
//	private User xyz;

	@Column
	private String SCHEDULE_AUDITOR_ID;
	
	@Column
	private String SCHEDULE_AUDITEE_ID;
	
	@Column
	private String SCHEDULE_ADMIN_ID;
	
	@Column
	private String SCHEDULE_STATE;

	@Column
	private String AUDITOR_REJECT_REASON;

	@Column
	private String AUDITEE_REJECT_REASON;

	
	public String getAUDITOR_REJECT_REASON() {
		return AUDITOR_REJECT_REASON;
	}

	public void setAUDITOR_REJECT_REASON(String aUDITOR_REJECT_REASON) {
		AUDITOR_REJECT_REASON = aUDITOR_REJECT_REASON;
	}

	public String getAUDITEE_REJECT_REASON() {
		return AUDITEE_REJECT_REASON;
	}

	public void setAUDITEE_REJECT_REASON(String aUDITEE_REJECT_REASON) {
		AUDITEE_REJECT_REASON = aUDITEE_REJECT_REASON;
	}

	@Column(updatable=false, insertable=false)
    @Formula("(Select la.audit_area_name from audit_area la Where la.audit_area_id=SCHEDULE_AUDITAREA)")
	private String SCHEDULE_AUDITAREA_NAME;

	public String getSCHEDULE_AUDITAREA_NAME() {
		return SCHEDULE_AUDITAREA_NAME;
	}

	public void setSCHEDULE_AUDITAREA_NAME(String sCHEDULE_AUDITAREA_NAME) {
		SCHEDULE_AUDITAREA_NAME = sCHEDULE_AUDITAREA_NAME;
	}
	public int getSCHEDULE_ID() {
		return SCHEDULE_ID;
	}

	public void setSCHEDULE_ID(int sCHEDULE_ID) {
		SCHEDULE_ID = sCHEDULE_ID;
	}

	public Date getSCHEDULE_DATE() {
		return SCHEDULE_DATE;
	}

	public void setSCHEDULE_DATE(Date sCHEDULE_DATE) {
		SCHEDULE_DATE = sCHEDULE_DATE;
	}

	public String getSCHEDULE_DEPT() {
		return SCHEDULE_DEPT;
	}

	public void setSCHEDULE_DEPT(String sCHEDULE_DEPT) {
		SCHEDULE_DEPT = sCHEDULE_DEPT;
	}

	

	public String getSCHEDULE_AUDITOR_ID() {
		return SCHEDULE_AUDITOR_ID;
	}

	public void setSCHEDULE_AUDITOR_ID(String sCHEDULE_AUDITOR_ID) {
		SCHEDULE_AUDITOR_ID = sCHEDULE_AUDITOR_ID;
	}

	public String getSCHEDULE_AUDITEE_ID() {
		return SCHEDULE_AUDITEE_ID;
	}

	public void setSCHEDULE_AUDITEE_ID(String sCHEDULE_AUDITEE_ID) {
		SCHEDULE_AUDITEE_ID = sCHEDULE_AUDITEE_ID;
	}

	public String getSCHEDULE_ADMIN_ID() {
		return SCHEDULE_ADMIN_ID;
	}

	public void setSCHEDULE_ADMIN_ID(String sCHEDULE_ADMIN_ID) {
		SCHEDULE_ADMIN_ID = sCHEDULE_ADMIN_ID;
	}

	public String getSCHEDULE_STATE() {
		return SCHEDULE_STATE;
	}

	public void setSCHEDULE_STATE(String sCHEDULE_STATE) {
		SCHEDULE_STATE = sCHEDULE_STATE;
	}

	public int getSCHEDULE_AUDITAREA() {
		return SCHEDULE_AUDITAREA;
	}

	public void setSCHEDULE_AUDITAREA(int sCHEDULE_AUDITAREA) {
		SCHEDULE_AUDITAREA = sCHEDULE_AUDITAREA;
	}
	
}
