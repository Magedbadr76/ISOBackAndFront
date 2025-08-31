package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//import oracle.sql.DATE;
@Entity
@Table (name="COMMENTS")
public class Comment  implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID;
	@Column
	private String COMMENT_TXT;
	@Column
	private String COMMENT_TIME;
	@Column
	private int TICKET_ID;
	@Column
	private String commented_by;
	public String getCommented_by() {
		return commented_by;
	}
	public void setCommented_by(String commented_by) {
		this.commented_by = commented_by;
	}
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCOMMENT_TXT() {
		return COMMENT_TXT;
	}
	public void setCOMMENT_TXT(String cOMMENT_TXT) {
		COMMENT_TXT = cOMMENT_TXT;
	}
	public String getCOMMENT_TIME() {
		return COMMENT_TIME;
	}
	public void setCOMMENT_TIME(String cOMMENT_TIME) {
		COMMENT_TIME = cOMMENT_TIME;
	}
	
	
	
	

}
