package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class UserServiceImpl {

	@Autowired
	private UserDAOImp userDAO;


	@Transactional
	public Integer addUser(User user) {
		return userDAO.addUser(user);
	}

	
	@Transactional
	public List<User> getAllUsers() {
		return userDAO.getAllUsers();
	}

	
	@Transactional
	public void deleteUser(Integer userId) {
		userDAO.deleteUser(userId);
	}

	public User getUser(int userId) {
		return userDAO.getUser(userId);
	}
	public User getUserByName(String userName) {
		return userDAO.getUserByName(userName);
	}
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.updateUser(user);
	}


	public UserDAOImp getUserDAO() {
		return userDAO;
	}


	public void setUserDAO(UserDAOImp userDAO) {
		this.userDAO = userDAO;
	}



	

}
