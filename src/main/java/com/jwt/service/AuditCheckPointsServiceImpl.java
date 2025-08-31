package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.AuditAreaDAOImp;
import com.jwt.dao.CheckpointsDAOImpl;
import com.jwt.model.AuditCheckpoints;

@Service
@Transactional
public class AuditCheckPointsServiceImpl implements AuditcheckpointsService {

	@Autowired
	private CheckpointsDAOImpl checkpointsDAO;
	
	@Override
	public void addCheckPoint(AuditCheckpoints checkpoint) {
		checkpointsDAO.addcheckPoints(checkpoint);
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AuditCheckpoints> getAllAuditCheckPoints(Integer AuditId) {
		// TODO Auto-generated method stub
		return checkpointsDAO.getAllCheckPoints(AuditId);
	}

	@Override
	public void deleteAuditCheckPoints(Integer CheckID) {
		// TODO Auto-generated method stub
		checkpointsDAO.deleteCheckPoint(CheckID);
		
	}

	@Override
	public AuditCheckpoints getAuditCheckPoints(Integer CheckID) {
		// TODO Auto-generated method stub
		
		return checkpointsDAO.getCheckPoint(CheckID);
	}

}
