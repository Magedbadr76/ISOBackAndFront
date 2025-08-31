package com.jwt.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Tasks")
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;
	@Column
	String task_name ;
	@Column
	String    task_desc;
	@Column  
	Date  task_expected_end;
	@Column  
	Date  task_initiate_date; 
	@Column  
	String  task_piriority ;
	@Column  
	String task_assigned_user; 
	@Column 
	String  created_by ;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTask_desc() {
		return task_desc;
	}
	public void setTask_desc(String task_desc) {
		this.task_desc = task_desc;
	}
	public Date getTask_expected_end() {
		return task_expected_end;
	}
	public void setTask_expected_end(Date task_expected_end) {
		this.task_expected_end = task_expected_end;
	}
	public Date getTask_initiate_date() {
		return task_initiate_date;
	}
	public void setTask_initiate_date(Date task_initiate_date) {
		this.task_initiate_date = task_initiate_date;
	}
	public String getTask_piriority() {
		return task_piriority;
	}
	public void setTask_piriority(String task_piriority) {
		this.task_piriority = task_piriority;
	}

	public String getTask_assigned_user() {
		return task_assigned_user;
	}
	public void setTask_assigned_user(String task_assigned_user) {
		this.task_assigned_user = task_assigned_user;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String getTask_status() {
		return task_status;
	}
	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}
	@Column 
	String  task_status ;


}
