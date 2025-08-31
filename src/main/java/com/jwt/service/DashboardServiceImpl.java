package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.CommentDAO;
import com.jwt.dao.CompleteTransDAOImp;
import com.jwt.dao.DashboardDAO;
import com.jwt.dao.DashboardDAOImpl;
import com.jwt.model.DashboardCountPerDept;

@Service
@Transactional
public class DashboardServiceImpl implements DashboardService {

	@Autowired
	private DashboardDAO dashboardDAO ;
	
	
	@Override
	public List<DashboardCountPerDept> getallPending() {
		// TODO Auto-generated method stub
		return dashboardDAO.GetPendingAuditsByDept();
	}

	@Override
	public List<DashboardCountPerDept> getallCompleted() {
		// TODO Auto-generated method stub
		return dashboardDAO.GetCompletedByDept();
	}

	public DashboardDAO getDashboardDAO() {
		return dashboardDAO;
	}

	public void setDashboardDAO(DashboardDAO dashboardDAO) {
		this.dashboardDAO = dashboardDAO;
	}

	@Override
	public List<DashboardCountPerDept> getAuditsPerStatus() {
		// TODO Auto-generated method stub
		return dashboardDAO.getAuditsPerStatus();
	}

	
	
}
