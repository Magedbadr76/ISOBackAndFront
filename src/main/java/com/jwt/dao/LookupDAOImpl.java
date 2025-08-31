package com.jwt.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.Lookup;

@Repository
public class LookupDAOImpl implements LookupDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public  List<Lookup> getLookup(int LookupId) {
		return sessionFactory.getCurrentSession().createQuery("from Lookup c where c.LOOKUP_ID="+LookupId).list();

	}
}
