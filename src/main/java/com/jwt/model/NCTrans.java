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
@Table(name = "nc_trans")
public class NCTrans implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer nc_trans_id;

	@Column
	private int nc_trans_ncr_id;

	public Integer getNc_trans_id() {
		return nc_trans_id;
	}

	public void setNc_trans_id(Integer nc_trans_id) {
		this.nc_trans_id = nc_trans_id;
	}

	public int getNc_trans_ncr_id() {
		return nc_trans_ncr_id;
	}

	public void setNc_trans_ncr_id(int nc_trans_ncr_id) {
		this.nc_trans_ncr_id = nc_trans_ncr_id;
	}

	
}
