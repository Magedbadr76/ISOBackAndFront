package com.jwt.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

@Entity
@Table(name = "ncr")
public class Ncr implements Serializable{
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer ID;

	@Column
	private int ncr_dept_id;
	
	@Column(updatable=false, insertable=false)
    @Formula("(Select la.audit_area_name from audit_area la Where la.audit_area_id=ncr_dept_id)")
	private String ncr_dept_name;
	
	@Column(updatable=false, insertable=false)
	private String Operation ;
	
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "SCHEDULE_AUDITOR_ID", referencedColumnName = "User_ID")
//	private User xyz;

	@Column
	private Date ncr_date;
	
	@Column
	private String ncr_source;
	
	@Column
	private String ncr_other;
	
	@Column
	private String ncr_desc;
	
	@Column
	private String ncr_initiator;
	
	@Column
	private String ncr_assigned_to;
	
	
	public String getNcr_assigned_to() {
		return ncr_assigned_to;
	}

	public void setNcr_assigned_to(String ncr_assigned_to) {
		this.ncr_assigned_to = ncr_assigned_to;
	}

	@Column
	private String ncr_root_cause;
	
	@Column
	private String ncr_corrective_action;
	
	@Column
	private Date ncr_completion_date;
	
	@Column
	private String ncr_verfication_notes;
	
	@Column
	private Date ncr_verfication_date;
	
	@Column
	private String ncr_status;
	
	@Column
	private int ncr_schedule_id;
	public String getNcr_dept_name() {
		return ncr_dept_name;
	}

	public void setNcr_dept_name(String ncr_dept_name) {
		this.ncr_dept_name = ncr_dept_name;
	}

	public String getOperation() {
		return Operation;
	}

	public void setOperation(String operation) {
		Operation = operation;
	}

	public String getNcr_status() {
		return ncr_status;
	}

	public void setNcr_status(String ncr_status) {
		this.ncr_status = ncr_status;
	}
	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public int getNcr_dept_id() {
		return ncr_dept_id;
	}

	public void setNcr_dept_id(int ncr_dept_id) {
		this.ncr_dept_id = ncr_dept_id;
	}

	public Date getNcr_date() {
		return ncr_date;
	}

	public void setNcr_date(Date ncr_date) {
		this.ncr_date = ncr_date;
	}

	public String getNcr_source() {
		return ncr_source;
	}

	public void setNcr_source(String ncr_source) {
		this.ncr_source = ncr_source;
	}

	public String getNcr_other() {
		return ncr_other;
	}

	public void setNcr_other(String ncr_other) {
		this.ncr_other = ncr_other;
	}

	public String getNcr_desc() {
		return ncr_desc;
	}

	public void setNcr_desc(String ncr_desc) {
		this.ncr_desc = ncr_desc;
	}

	public String getNcr_initiator() {
		return ncr_initiator;
	}

	public void setNcr_initiator(String ncr_initiator) {
		this.ncr_initiator = ncr_initiator;
	}

	public String getNcr_root_cause() {
		return ncr_root_cause;
	}

	public void setNcr_root_cause(String ncr_root_cause) {
		this.ncr_root_cause = ncr_root_cause;
	}

	public String getNcr_corrective_action() {
		return ncr_corrective_action;
	}

	public void setNcr_corrective_action(String ncr_corrective_action) {
		this.ncr_corrective_action = ncr_corrective_action;
	}

	public Date getNcr_completion_date() {
		return ncr_completion_date;
	}

	public void setNcr_completion_date(Date ncr_completion_date) {
		this.ncr_completion_date = ncr_completion_date;
	}

	public String getNcr_verfication_notes() {
		return ncr_verfication_notes;
	}

	public void setNcr_verfication_notes(String ncr_verfication_notes) {
		this.ncr_verfication_notes = ncr_verfication_notes;
	}

	public Date getNcr_verfication_date() {
		return ncr_verfication_date;
	}

	public void setNcr_verfication_date(Date ncr_verfication_date) {
		this.ncr_verfication_date = ncr_verfication_date;
	}

	public int getNcr_schedule_id() {
		return ncr_schedule_id;
	}

	public void setNcr_schedule_id(int ncr_schedule_id) {
		this.ncr_schedule_id = ncr_schedule_id;
	}



	
}
