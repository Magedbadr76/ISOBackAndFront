package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.LookupDAO;
import com.jwt.model.Lookup;
@Service
@Transactional
public class LookupServiceImpl implements LookupService {
	@Autowired
	private LookupDAO LookupDAO ;
	
	@Override
	@Transactional
	public List<Lookup> getAllLookups(int LookupId) {
		// TODO Auto-generated method stub
		return LookupDAO.getLookup(LookupId);
	}

}
