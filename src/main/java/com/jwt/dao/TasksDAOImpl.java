package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.ScheduleAudit;
import com.jwt.model.Task;

@Repository
public class TasksDAOImpl implements TasksDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addNewTask(Task task) {
		sessionFactory.getCurrentSession().saveOrUpdate(task);
		
	}

	@Override
	public List<Task> getAllTasks(String UserName) {
		return sessionFactory.getCurrentSession().createQuery("from Task where task_assigned_user='"+UserName+"'")
				.list();
	}

	@Override
	public void deleteTask(int TaskID) {
		Task CurrentTask = (Task) sessionFactory.getCurrentSession().load(
				Task.class, TaskID);
		if (null != CurrentTask) {
			this.sessionFactory.getCurrentSession().delete(CurrentTask);
		}

		
	}

	@Override
	public Task getTask(Integer TaskID) {
		// TODO Auto-generated method stub
		
		
		return (Task) sessionFactory.getCurrentSession().createQuery("from Task where id="+TaskID)
				.list().get(0);		
	
	}

}
