package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CompleteTransDAOImp;
import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.CompleteTrans;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class CompleteTransServiceImpl {

	@Autowired
	private CompleteTransDAOImp completeTransDAO;


	@Transactional
	public void addCompleteTrans(CompleteTrans completeTrans) {
		completeTransDAO.addCompleteTrans(completeTrans);
	}

	
	@Transactional
	public List<CompleteTrans> getAllCompleteTranss() {
		return completeTransDAO.getAllCompleteTranss();
	}

	
	@Transactional
	public void deleteCompleteTrans(Integer completeTransId) {
		completeTransDAO.deleteCompleteTrans(completeTransId);
	}

	public CompleteTrans getCompleteTrans(int completeTransId) {
		return completeTransDAO.getCompleteTrans(completeTransId);
	}

	public CompleteTrans updateCompleteTrans(CompleteTrans completeTrans) {
		// TODO Auto-generated method stub
		return completeTransDAO.updateUser(completeTrans);
	}


	public CompleteTransDAOImp getCompleteTransDAO() {
		return completeTransDAO;
	}


	public void setCompleteTransDAO(CompleteTransDAOImp completeTransDAO) {
		this.completeTransDAO = completeTransDAO;
	}


	
}
