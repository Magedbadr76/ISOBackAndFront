package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.dao.UserRoleDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;
import com.jwt.model.UserRole;

@Service
@Transactional
public class UserRoleServiceImpl {

	@Autowired
	private UserRoleDAOImp userRoleDAO;


	@Transactional
	public void addUserRole(UserRole userRole) {
		userRoleDAO.addUserRole(userRole);
	}

	
	@Transactional
	public List<UserRole> getAllUserRoles() {
		return userRoleDAO.getAllUserRoles();
	}
	
	@Transactional
	public List<UserRole> getAllUserRolesByUser(Integer UserId) {
		return userRoleDAO.getAllUserRoleByUserID(UserId);
	}

	
	@Transactional
	public void deleteUserRole(Integer userRoleId) {
		userRoleDAO.deleteUserRole(userRoleId);
	}

	public UserRole getUserRole(int userRoleId) {
		return userRoleDAO.getUserRole(userRoleId);
	}

	public UserRole updateUserRole(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleDAO.updateUserRole(userRole);
	}


	public UserRoleDAOImp getUserRoleDAO() {
		return userRoleDAO;
	}


	public void setUserRoleDAO(UserRoleDAOImp userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}


	

}
