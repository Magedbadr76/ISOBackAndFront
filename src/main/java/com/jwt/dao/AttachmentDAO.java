package com.jwt.dao;

import java.util.List;

import com.jwt.model.Attachment;
import com.jwt.model.Comment;
import com.jwt.model.Employee;

public interface AttachmentDAO {
	public void addAttachment(Attachment attachment);

	public List<Attachment> getAllAttachment(Employee emp);

	public void deleteAttachment(Integer AttachmentID);


	public Attachment getAttachment(int AttachmentID);
}
