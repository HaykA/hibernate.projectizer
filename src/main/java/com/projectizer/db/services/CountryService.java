package com.projectizer.db.services;

import java.util.List;

import com.projectizer.db.dao.CountryDAO;
import com.projectizer.entities.Country;

public class CountryService {

	private final CountryDAO countryDAO = new CountryDAO();
	
	public Country read(long id) {
		return countryDAO.read(id);
	}
	
	public List<Country> findAll(int startPosition, int maxResult) {
		return countryDAO.findAll(startPosition, maxResult);
	}
	
	public int getCount() {
		return countryDAO.getCount();
	}
}
