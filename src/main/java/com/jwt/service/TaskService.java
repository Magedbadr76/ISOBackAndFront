package com.jwt.service;

import java.util.List;

import com.jwt.model.Task;



public interface TaskService {
	public void addTask(Task task);

	public List<Task> getAllTask(String UserName);

	public void deleteTask(Integer TaskID);


	public Task getTask(Integer TaskID);
}
