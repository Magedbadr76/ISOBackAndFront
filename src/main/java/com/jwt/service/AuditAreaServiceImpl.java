package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.AuditAreaDAOImp;
import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.AuditArea;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class AuditAreaServiceImpl {

	@Autowired
	private AuditAreaDAOImp auditAreaDAO;


	@Transactional
	public void addAuditArea(AuditArea auditArea) {
		auditAreaDAO.addAuditArea(auditArea);;
	}

	
	@Transactional
	public List<AuditArea> getAllAuditAreas() {
		return auditAreaDAO.getAllAuditAreas();
	}

	
	@Transactional
	public void deleteAuditArea(Integer auditAreaId) {
		auditAreaDAO.deleteAuditArea(auditAreaId);
	}

	public AuditArea getAuditArea(int auditAreaId) {
		return auditAreaDAO.getAuditArea(auditAreaId);
	}

	public AuditArea updateAuditArea(AuditArea auditArea) {
		// TODO Auto-generated method stub
		return auditAreaDAO.updateAuditArea(auditArea);
	}


	public AuditAreaDAOImp getAuditAreaDAO() {
		return auditAreaDAO;
	}


	public void setAuditAreaDAO(AuditAreaDAOImp auditAreaDAO) {
		this.auditAreaDAO = auditAreaDAO;
	}


	


	

}
