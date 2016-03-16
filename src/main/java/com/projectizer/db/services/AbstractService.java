package com.projectizer.db.services;

import javax.persistence.EntityManager;

import com.projectizer.filters.JPAFilter;

abstract class AbstractService {

	private EntityManager getEntityManager() {
		return JPAFilter.getEntityManager();
	}
	
	protected void beginTransaction() {
		getEntityManager().getTransaction().begin();
	}
	
	protected void commit() {
		getEntityManager().getTransaction().commit();
	}
	
	protected void rollback() {
		getEntityManager().getTransaction().rollback();
	}
}
