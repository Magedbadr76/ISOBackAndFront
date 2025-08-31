package com.jwt.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table (name="CFG_LOOKUP")
public class Lookup  implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int ID;
	
	@Column
	private int LOOKUP_ID;
	@Column
	private String LOOKUP_CODE;
	@Column
	private String AR_NAME;
	@Column
	private String EN_NAME;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getLOOKUP_ID() {
		return LOOKUP_ID;
	}
	public void setLOOKUP_ID(int lOOKUP_ID) {
		LOOKUP_ID = lOOKUP_ID;
	}
	public String getLOOKUP_CODE() {
		return LOOKUP_CODE;
	}
	public void setLOOKUP_CODE(String lOOKUP_CODE) {
		LOOKUP_CODE = lOOKUP_CODE;
	}
	public String getAR_NAME() {
		return AR_NAME;
	}
	public void setAR_NAME(String aR_NAME) {
		AR_NAME = aR_NAME;
	}
	public String getEN_NAME() {
		return EN_NAME;
	}
	public void setEN_NAME(String eN_NAME) {
		EN_NAME = eN_NAME;
	}
	@Override
	public String toString() {
		return "Lookup [LOOKUP_ID=" + LOOKUP_ID + ", LOOKUP_CODE=" + LOOKUP_CODE + ", AR_NAME=" + AR_NAME + ", EN_NAME="
				+ EN_NAME + "]";
	}
	
}
