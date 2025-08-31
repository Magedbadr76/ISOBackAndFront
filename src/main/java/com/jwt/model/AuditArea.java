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
@Table(name = "aUDIT_AREA")
public class AuditArea implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer audit_area_id;

	@Column
	private String aUDIT_AREA_NAME;

	public Integer getAudit_area_id() {
		return audit_area_id;
	}

	public void setAudit_area_id(Integer audit_area_id) {
		this.audit_area_id = audit_area_id;
	}

	public String getaUDIT_AREA_NAME() {
		return aUDIT_AREA_NAME;
	}

	public void setaUDIT_AREA_NAME(String aUDIT_AREA_NAME) {
		this.aUDIT_AREA_NAME = aUDIT_AREA_NAME;
	}



	
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "SCHEDULE_AUDITOR_ID", referencedColumnName = "User_ID")
//	private User xyz;

	
}
