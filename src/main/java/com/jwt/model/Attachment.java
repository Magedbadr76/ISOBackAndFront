package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="ATTACHMENT")
public class Attachment implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID;
	@Column
	private int TICKET_ID;
	@Column
	private String ATTACHMENT_NAME;
	@Column
	private String ATTACHMENT_LOCATION;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getTICKET_ID() {
		return TICKET_ID;
	}
	public void setTICKET_ID(int tICKET_ID) {
		TICKET_ID = tICKET_ID;
	}
	public String getATTACHMENT_NAME() {
		return ATTACHMENT_NAME;
	}
	public void setATTACHMENT_NAME(String aTTACHMENT_NAME) {
		ATTACHMENT_NAME = aTTACHMENT_NAME;
	}
	public String getATTACHMENT_LOCATION() {
		return ATTACHMENT_LOCATION;
	}
	public void setATTACHMENT_LOCATION(String aTTACHMENT_LOCATION) {
		ATTACHMENT_LOCATION = aTTACHMENT_LOCATION;
	}
	

}
