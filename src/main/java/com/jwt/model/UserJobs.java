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
@Table(name = "user_jobs")
public class UserJobs implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer ID;

	@Column
	private int job_user_id;

	
//	@OneToOne(cascade = CascadeType.ALL)
//    @JoinColumn(name = "SCHEDULE_AUDITOR_ID", referencedColumnName = "User_ID")
//	private User xyz;

	@Column
	private Date job_date;
	
	@Column
	private int job_schedule_id;
	
	@Column
	private String job_desc;

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public int getJob_user_id() {
		return job_user_id;
	}

	public void setJob_user_id(int job_user_id) {
		this.job_user_id = job_user_id;
	}

	public Date getJob_date() {
		return job_date;
	}

	public void setJob_date(Date job_date) {
		this.job_date = job_date;
	}

	public int getJob_schedule_id() {
		return job_schedule_id;
	}

	public void setJob_schedule_id(int job_schedule_id) {
		this.job_schedule_id = job_schedule_id;
	}

	public String getJob_desc() {
		return job_desc;
	}

	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}
	
	


	
	
}
