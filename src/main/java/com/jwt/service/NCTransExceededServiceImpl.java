package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.NCTransExceededDAOImp;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.NCTransExceeded;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class NCTransExceededServiceImpl {

	@Autowired
	private NCTransExceededDAOImp ncTransExceededDAO;


	@Transactional
	public void addNCTransExceeded(NCTransExceeded ncTransExceeded) {
		ncTransExceededDAO.addNCTransExceeded(ncTransExceeded);
	}

	
	@Transactional
	public List<NCTransExceeded> getAllNCTransExceededs() {
		return ncTransExceededDAO.getAllNCTransExceededs();
	}

	
	@Transactional
	public void deleteNCTransExceeded(Integer ncTransExceededId) {
		ncTransExceededDAO.deleteNCTransExceeded(ncTransExceededId);
	}

	public NCTransExceeded getNCTransExceeded(int ncTransExceededId) {
		return ncTransExceededDAO.getNCTransExceeded(ncTransExceededId);
	}

	public NCTransExceeded updateNCTransExceeded(NCTransExceeded ncTransExceeded) {
		// TODO Auto-generated method stub
		return ncTransExceededDAO.updateNCTransExceeded(ncTransExceeded);
	}


	
	

}
