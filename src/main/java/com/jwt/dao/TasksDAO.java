package com.jwt.dao;

import java.util.List;

import com.jwt.model.Task;



public interface TasksDAO {
	public void addNewTask(Task task);

	public List<Task> getAllTasks(String UserName);

	public void deleteTask(int TaskID);


	public Task getTask(Integer TaskID);
}
