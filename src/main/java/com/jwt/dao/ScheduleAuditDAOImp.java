package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;

@Repository
public class ScheduleAuditDAOImp {

	@Autowired
	private SessionFactory sessionFactory;

	public void addSchedule(ScheduleAudit scheduleAudit) {
		sessionFactory.getCurrentSession().saveOrUpdate(scheduleAudit);

	}

	@SuppressWarnings("unchecked")
	public List<ScheduleAudit> getAllSchedules() {

		return sessionFactory.getCurrentSession().createQuery("from ScheduleAudit")
				.list();
	}
	@SuppressWarnings("unchecked")
	public List<ScheduleAudit> getAllAcceptedSchedules() {

		return sessionFactory.getCurrentSession().createQuery("from ScheduleAudit where SCHEDULE_STATE='ACCEPTED'")
				.list();
	}
	@SuppressWarnings("unchecked")
	public List<ScheduleAudit> getAllCurrentUser(String CurrentUser) {

		return sessionFactory.getCurrentSession().createQuery("from ScheduleAudit where SCHEDULE_AUDITOR_ID ='"+CurrentUser+"' or SCHEDULE_AUDITEE_ID='"+CurrentUser+"'")
				.list();
	}
	
	public void deleteSchedule(Integer scheduleId) {
		ScheduleAudit scheduleAudit = (ScheduleAudit) sessionFactory.getCurrentSession().load(
				ScheduleAudit.class, scheduleId);
		if (null != scheduleAudit) {
			this.sessionFactory.getCurrentSession().delete(scheduleAudit);
		}

	}

	public ScheduleAudit getSchedule(int scheduleId) {
		return (ScheduleAudit) sessionFactory.getCurrentSession().get(
				ScheduleAudit.class, scheduleId);
	}

	
	public ScheduleAudit updateSchedule(ScheduleAudit schedule) {
		sessionFactory.getCurrentSession().update(schedule);
		return schedule;
	}

}