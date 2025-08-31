package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Attachment;
import com.jwt.model.Employee;
@Repository
public class AttachmentDAOImpl implements  AttachmentDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addAttachment(Attachment attachment) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(attachment);

		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Attachment> getAllAttachment(Employee emp) {
		// TODO Auto-generated method stub
		
		return sessionFactory.getCurrentSession().createQuery("from Attachment A where A.TICKET_ID="+emp.getId()).list();
	}

	@Override
	public void deleteAttachment(Integer AttachmentID) {
		// TODO Auto-generated method stub
		Attachment attachment=(Attachment)sessionFactory.getCurrentSession().load(Attachment.class, AttachmentID);
	    if(attachment!=null)
		sessionFactory.getCurrentSession().delete(attachment);
		
	}

	@Override
	public Attachment getAttachment(int AttachmentID) {
		// TODO Auto-generated method stub
		return (Attachment)sessionFactory.getCurrentSession().get(Attachment.class, AttachmentID);
	}

}
