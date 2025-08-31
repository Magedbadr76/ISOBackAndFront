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
@Table(name = "complete_trans")
public class CompleteTrans implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer comp_id;

	@Column
	private int comp_auit_trans_id;

	public Integer getComp_id() {
		return comp_id;
	}

	public void setComp_id(Integer comp_id) {
		this.comp_id = comp_id;
	}

	public int getComp_auit_trans_id() {
		return comp_auit_trans_id;
	}

	public void setComp_auit_trans_id(int comp_auit_trans_id) {
		this.comp_auit_trans_id = comp_auit_trans_id;
	}



	
}
