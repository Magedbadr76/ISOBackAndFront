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
@Table(name = "nc_trans_exceeded")
public class NCTransExceeded implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer nc_exceed_id;

	@Column
	private int nc_exceed_ncr_id;
	
	@Column
	private Date nc_trans_target_date;

	public Integer getNc_exceed_id() {
		return nc_exceed_id;
	}

	public void setNc_exceed_id(Integer nc_exceed_id) {
		this.nc_exceed_id = nc_exceed_id;
	}

	public int getNc_exceed_ncr_id() {
		return nc_exceed_ncr_id;
	}

	public void setNc_exceed_ncr_id(int nc_exceed_ncr_id) {
		this.nc_exceed_ncr_id = nc_exceed_ncr_id;
	}

	public Date getNc_trans_target_date() {
		return nc_trans_target_date;
	}

	public void setNc_trans_target_date(Date nc_trans_target_date) {
		this.nc_trans_target_date = nc_trans_target_date;
	}

	

}
