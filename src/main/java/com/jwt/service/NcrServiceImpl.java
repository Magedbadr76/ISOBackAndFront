package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.NcrDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.Ncr;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class NcrServiceImpl {

	@Autowired
	private NcrDAOImp ncrDAO;


	@Transactional
	public void addNcr(Ncr ncr) {
		ncrDAO.addNcr(ncr);
	}

	
	@Transactional
	public List<Ncr> getAllNcrs() {
		return ncrDAO.getAllNcrs();
	}

	
	@Transactional
	public void deleteNcr(Integer ncrId) {
		ncrDAO.deleteNcr(ncrId);
	}

	public Ncr getNcr(int ncrId) {
		return ncrDAO.getNcr(ncrId);
	}

	public Ncr updateNcr(Ncr ncr) {
		// TODO Auto-generated method stub
		return ncrDAO.updateNcr(ncr);
	}


	public NcrDAOImp getNcrDAO() {
		return ncrDAO;
	}


	public void setNcrDAO(NcrDAOImp ncrDAO) {
		this.ncrDAO = ncrDAO;
	}





	

}
