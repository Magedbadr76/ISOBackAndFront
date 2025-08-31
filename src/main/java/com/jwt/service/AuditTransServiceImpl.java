package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.AuditTransDAOImp;
import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.AuditTransaction;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class AuditTransServiceImpl {

	@Autowired
	private AuditTransDAOImp auditTransactionDAO;


	@Transactional
	public void addAuditTransaction(AuditTransaction auditTransaction) {
		auditTransactionDAO.addAuditTransaction(auditTransaction);
	}

	
	@Transactional
	public List<AuditTransaction> getAllAuditTransactions() {
		return auditTransactionDAO.getAllAuditTransactions();
	}

	
	@Transactional
	public void deleteAuditTransaction(Integer auditTransactionId) {
		auditTransactionDAO.deleteAuditTransaction(auditTransactionId);
	}

	public AuditTransaction getAuditTransaction(int auditTransactionId) {
		return auditTransactionDAO.getAuditTransaction(auditTransactionId);
	}
	public AuditTransaction getAuditTransactionBySchedule(int ScheduleId) {
		return auditTransactionDAO.getAuditTransactionbySchedule(ScheduleId);
	}

	public AuditTransaction updateAuditTransaction(AuditTransaction auditTransaction) {
		// TODO Auto-generated method stub
		return auditTransactionDAO.updateAuditTransaction(auditTransaction);
	}


	public AuditTransDAOImp getAuditTransactionDAO() {
		return auditTransactionDAO;
	}


	public void setAuditTransactionDAO(AuditTransDAOImp auditTransactionDAO) {
		this.auditTransactionDAO = auditTransactionDAO;
	}

	

}
