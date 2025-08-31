package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.AttachmentDAO;
import com.jwt.dao.CommentDAO;
import com.jwt.model.Attachment;
import com.jwt.model.Employee;
@Service
@Transactional
public class AttachmentServiceImpl  implements AttachmentService{
	@Autowired
	private AttachmentDAO attachmentDAO ;
	@Override
	@Transactional
	public void addAttachment(Attachment attachment) {
		// TODO Auto-generated method stub
		attachmentDAO.addAttachment(attachment);
	}

	@Override
	@Transactional

	public List<Attachment> getAllAttachment(Employee emp) {
		// TODO Auto-generated method stub
		return attachmentDAO.getAllAttachment(emp);
	}

	@Override
	@Transactional

	public void deleteAttachment(Integer AttachmentID) {
		// TODO Auto-generated method stub
		attachmentDAO.deleteAttachment(AttachmentID);
		
	}

	@Override
	@Transactional

	public Attachment getAttachment(int AttachmentID) {
		// TODO Auto-generated method stub
		return attachmentDAO.getAttachment(AttachmentID);
	}

}
