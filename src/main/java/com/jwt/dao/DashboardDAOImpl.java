package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.hibernate.type.LongType;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.DashboardCountPerDept;
@Repository
public class DashboardDAOImpl implements DashboardDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<DashboardCountPerDept> GetPendingAuditsByDept() {
		return	this.sessionFactory.getCurrentSession().
		createSQLQuery("select audit_area_name as name,count(*) as counts from schedule_audit aud, audit_area area\r\n" + 
				"where  aud.schedule_auditarea = area.audit_area_id\r\n" + 
				"and schedule_state!='SUBMITTED'\r\n" + 
				"group by area.audit_area_name")
	    .addScalar("counts", new LongType())
	    .addScalar("name", new StringType())
		.setResultTransformer(Transformers.aliasToBean(DashboardCountPerDept.class)).list();
		 
	}

	@Override
	public List<DashboardCountPerDept> GetCompletedByDept() {
		return	this.sessionFactory.getCurrentSession().
				createSQLQuery("select audit_area_name as name,count(*) as counts from schedule_audit aud, audit_area area\r\n" + 
						"where  aud.schedule_auditarea = area.audit_area_id\r\n" + 
						"and schedule_state='SUBMITTED'\r\n" + 
						"group by area.audit_area_name")
				 .addScalar("counts", new LongType())
				    .addScalar("name", new StringType())
				.setResultTransformer(Transformers.aliasToBean(DashboardCountPerDept.class)).list();
	}

	@Override
	public List<DashboardCountPerDept> getAuditsPerStatus() {
		return	this.sessionFactory.getCurrentSession().
				createSQLQuery("select schedule_state as name,\r\n" + 
						"count(*) as counts from schedule_audit group by schedule_state")
				 .addScalar("counts", new LongType())
				    .addScalar("name", new StringType())
				.setResultTransformer(Transformers.aliasToBean(DashboardCountPerDept.class)).list();
	}
}
