package com.jwt.service;

import java.util.List;

import com.jwt.model.Attachment;
import com.jwt.model.Employee;

public interface AttachmentService {
	public void addAttachment(Attachment attachment);

	public List<Attachment> getAllAttachment(Employee emp);

	public void deleteAttachment(Integer AttachmentID);


	public Attachment getAttachment(int AttachmentID);
}
