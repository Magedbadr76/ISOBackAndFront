package com.jwt.service;

import java.util.List;

import com.jwt.model.DashboardCountPerDept;



public interface DashboardService {
	public List<DashboardCountPerDept> getallPending();
	public List<DashboardCountPerDept> getallCompleted();
	public List<DashboardCountPerDept> getAuditsPerStatus();
	
}
