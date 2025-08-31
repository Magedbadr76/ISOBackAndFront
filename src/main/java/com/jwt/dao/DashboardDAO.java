package com.jwt.dao;

import java.util.List;

import com.jwt.model.DashboardCountPerDept;

public interface DashboardDAO {
   public List<DashboardCountPerDept> GetPendingAuditsByDept();
   public  List<DashboardCountPerDept> GetCompletedByDept();
   public  List<DashboardCountPerDept> getAuditsPerStatus();
}
