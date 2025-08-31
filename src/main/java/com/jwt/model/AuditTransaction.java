package com.jwt.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "audit_transaction")
public class AuditTransaction implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer trans_id;

	@Column
	private String trans_createdby_id;

	
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "SCHEDULE_AUDITOR_ID", referencedColumnName = "User_ID")
//	private User xyz;

	@Column
	private Date trans_date;
	
	@Column
	private String trans_process_name;
	
	@Column
	private String trans_auditee_id;
	
	@Column
	private String trans_executive_summery;
	
	@Column
	private String trans_reviewed_records;
	
	@Column
	private String trans_audit_findings;
	
	@Column
	private int trans_schedule_id;
	
	@Column
	private String trans_audit_status;
	
	@Column
	private int trans_nc_flag;
	
	@Column(updatable=false, insertable=false)
	private String Operation ;

	public String getOperation() {
		return Operation;
	}

	public void setOperation(String operation) {
		Operation = operation;
	}

	public Integer getTrans_id() {
		return trans_id;
	}

	public void setTrans_id(Integer trans_id) {
		this.trans_id = trans_id;
	}

	public String getTrans_createdby_id() {
		return trans_createdby_id;
	}

	public void setTrans_createdby_id(String trans_createdby_id) {
		this.trans_createdby_id = trans_createdby_id;
	}

	public Date getTrans_date() {
		return trans_date;
	}

	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}

	public String getTrans_process_name() {
		return trans_process_name;
	}

	public void setTrans_process_name(String trans_process_name) {
		this.trans_process_name = trans_process_name;
	}

	public String getTrans_auditee_id() {
		return trans_auditee_id;
	}

	public void setTrans_auditee_id(String trans_auditee_id) {
		this.trans_auditee_id = trans_auditee_id;
	}

	public String getTrans_executive_summery() {
		return trans_executive_summery;
	}

	public void setTrans_executive_summery(String trans_executive_summery) {
		this.trans_executive_summery = trans_executive_summery;
	}

	public String getTrans_reviewed_records() {
		return trans_reviewed_records;
	}

	public void setTrans_reviewed_records(String trans_reviewed_records) {
		this.trans_reviewed_records = trans_reviewed_records;
	}

	public String getTrans_audit_findings() {
		return trans_audit_findings;
	}

	public void setTrans_audit_findings(String trans_audit_findings) {
		this.trans_audit_findings = trans_audit_findings;
	}

	public int getTrans_schedule_id() {
		return trans_schedule_id;
	}

	public void setTrans_schedule_id(int trans_schedule_id) {
		this.trans_schedule_id = trans_schedule_id;
	}

	public String getTrans_audit_status() {
		return trans_audit_status;
	}

	public void setTrans_audit_status(String trans_audit_status) {
		this.trans_audit_status = trans_audit_status;
	}

	public int getTrans_nc_flag() {
		return trans_nc_flag;
	}

	public void setTrans_nc_flag(int trans_nc_flag) {
		this.trans_nc_flag = trans_nc_flag;
	}



	
}
