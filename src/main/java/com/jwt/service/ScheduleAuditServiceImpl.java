package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;

@Service
@Transactional
public class ScheduleAuditServiceImpl {

	@Autowired
	private ScheduleAuditDAOImp scheduleAuditDAO;


	@Transactional
	public void addSchedule(ScheduleAudit scheduleAudit) {
		scheduleAuditDAO.addSchedule(scheduleAudit);
	}

	
	@Transactional
	public List<ScheduleAudit> getAllSchedules() {
		return scheduleAuditDAO.getAllSchedules();
	}
	@Transactional
	public List<ScheduleAudit> getAllAcceptedSchedules() {
		return scheduleAuditDAO.getAllAcceptedSchedules();
	}
	@Transactional
	public List<ScheduleAudit> getAllCurrentUser(String UserName) {
		return scheduleAuditDAO.getAllCurrentUser(UserName);
	}
	
	@Transactional
	public void deleteSchedule(Integer scheduleId) {
		scheduleAuditDAO.deleteSchedule(scheduleId);
	}

	public ScheduleAudit getSchedule(int scheduleId) {
		return scheduleAuditDAO.getSchedule(scheduleId);
	}

	public ScheduleAudit updateSchedule(ScheduleAudit schedule) {
		// TODO Auto-generated method stub
		return scheduleAuditDAO.updateSchedule(schedule);
	}


	public ScheduleAuditDAOImp getScheduleAuditDAO() {
		return scheduleAuditDAO;
	}


	public void setScheduleAuditDAO(ScheduleAuditDAOImp scheduleAuditDAO) {
		this.scheduleAuditDAO = scheduleAuditDAO;
	}

	

}
