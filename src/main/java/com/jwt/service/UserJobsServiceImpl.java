package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.dao.UserJobsDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;
import com.jwt.model.UserJobs;

@Service
@Transactional
public class UserJobsServiceImpl {

	@Autowired
	private UserJobsDAOImp userJobsDAO;


	@Transactional
	public void addUserJobs(UserJobs userJobs) {
		userJobsDAO.addUserJobs(userJobs);
	}

	
	@Transactional
	public List<UserJobs> getAllUserJobs() {
		return userJobsDAO.getAllUserJobs();
	}

	
	@Transactional
	public void deleteUserJobs(Integer userJobsId) {
		userJobsDAO.deleteUserJobs(userJobsId);
	}

	public UserJobs getUserJobs(int userJobsId) {
		return userJobsDAO.getUserJobs(userJobsId);
	}

	public UserJobs updateUserJobs(UserJobs userJobs) {
		// TODO Auto-generated method stub
		return userJobsDAO.updateUserJobs(userJobs);
	}


	public UserJobsDAOImp getUserJobsDAO() {
		return userJobsDAO;
	}


	public void setUserJobsDAO(UserJobsDAOImp userJobsDAO) {
		this.userJobsDAO = userJobsDAO;
	}


	

}
