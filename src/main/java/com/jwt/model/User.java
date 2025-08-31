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
@Table(name = "isoUsers")
public class User implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer uSER_ID;

	@Column
	private String uSER_NAME;

	
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "SCHEDULE_AUDITOR_ID", referencedColumnName = "User_ID")
//	private User xyz;

	@Column
	private String uSER_EMAIL;
	
	@Column
	private String uSER_TEL;
	
	@Column
	private String uSER_PASS;
	
	@Column
	private String uSER_ACTIVE;

	@Column
	private String uSER_TYPE;

	public String getuSER_TYPE() {
		return uSER_TYPE;
	}

	public void setuSER_TYPE(String uSER_TYPE) {
		this.uSER_TYPE = uSER_TYPE;
	}

	public Integer getuSER_ID() {
		return uSER_ID;
	}

	public void setuSER_ID(Integer uSER_ID) {
		this.uSER_ID = uSER_ID;
	}

	public String getuSER_NAME() {
		return uSER_NAME;
	}

	public void setuSER_NAME(String uSER_NAME) {
		this.uSER_NAME = uSER_NAME;
	}

	public String getuSER_EMAIL() {
		return uSER_EMAIL;
	}

	public void setuSER_EMAIL(String uSER_EMAIL) {
		this.uSER_EMAIL = uSER_EMAIL;
	}

	public String getuSER_TEL() {
		return uSER_TEL;
	}

	public void setuSER_TEL(String uSER_TEL) {
		this.uSER_TEL = uSER_TEL;
	}

	public String getuSER_PASS() {
		return uSER_PASS;
	}

	public void setuSER_PASS(String uSER_PASS) {
		this.uSER_PASS = uSER_PASS;
	}

	public String getuSER_ACTIVE() {
		return uSER_ACTIVE;
	}

	public void setuSER_ACTIVE(String uSER_ACTIVE) {
		this.uSER_ACTIVE = uSER_ACTIVE;
	}


	


	
	
}
