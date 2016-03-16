package com.projectizer.db.dao;

import javax.persistence.EntityManager;

import com.projectizer.filters.JPAFilter;

abstract class AbstractDAO {
	
	protected EntityManager getEntityManager() {
		return JPAFilter.getEntityManager();
	}
}
