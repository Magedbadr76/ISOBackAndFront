package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.NCTransDAOImp;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.NCTrans;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class NCTransServiceImpl {

	@Autowired
	private NCTransDAOImp ncTransDAO;


	@Transactional
	public void addNCTrans(NCTrans ncTrans) {
		ncTransDAO.addNCTrans(ncTrans);
	}

	
	@Transactional
	public List<NCTrans> getAllNCTranss() {
		return ncTransDAO.getAllNCTranss();
	}

	
	@Transactional
	public void deleteNCTrans(Integer ncTransId) {
		ncTransDAO.deleteNCTrans(ncTransId);
	}

	public NCTrans getNCTrans(int ncTransId) {
		return ncTransDAO.getNCTrans(ncTransId);
	}

	public NCTrans updateUser(NCTrans ncTrans) {
		// TODO Auto-generated method stub
		return ncTransDAO.updateNCTrans(ncTrans);
	}


	public NCTransDAOImp getNcTransDAO() {
		return ncTransDAO;
	}


	public void setNcTransDAO(NCTransDAOImp ncTransDAO) {
		this.ncTransDAO = ncTransDAO;
	}

	

}
