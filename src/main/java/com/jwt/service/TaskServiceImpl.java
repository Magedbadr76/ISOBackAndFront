package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.TasksDAO;
import com.jwt.model.Task;

@Service
@Transactional
public class TaskServiceImpl  implements TaskService{

	
		@Autowired
		private TasksDAO tasksDAO ;
	
	@Override
	@Transactional
	public void addTask(Task task) {
		// TODO Auto-generated method stub
		tasksDAO.addNewTask(task);
		
	}

	@Override
	@Transactional
	public List<Task> getAllTask(String UserName) {
		// TODO Auto-generated method stub
		return tasksDAO.getAllTasks(UserName);
	}

	@Override
	@Transactional
	public void deleteTask(Integer TaskID) {
		tasksDAO.deleteTask(TaskID);
		
	}

	@Override
	@Transactional
	public Task getTask(Integer TaskID) {
		// TODO Auto-generated method stub
		
		return tasksDAO.getTask(TaskID);
	}

}
