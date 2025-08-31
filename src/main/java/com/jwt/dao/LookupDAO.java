package com.jwt.dao;

import java.util.List;

import com.jwt.model.Lookup;

public interface  LookupDAO {
	public List<Lookup> getLookup(int LookupId);
}
