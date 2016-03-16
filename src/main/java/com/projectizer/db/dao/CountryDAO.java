package com.projectizer.db.dao;

import java.util.List;

import com.projectizer.entities.Country;

public class CountryDAO extends AbstractDAO {
	
	public Country read(long id) {
		return getEntityManager().find(Country.class, id);
	}
	
	public List<Country> findAll(int startPosition, int maxResult) {
		return getEntityManager()
			.createNamedQuery("Country.findAll", Country.class)
			.setFirstResult(startPosition)
			.setMaxResults(maxResult)
			.getResultList();
	}
	
	public int getCount() {
		return (Integer) getEntityManager()
				.createNamedQuery("Country.getCount", Long.class)
				.getSingleResult().intValue();
	}
}
