package com.projectizer.db.dao;

import javax.persistence.NoResultException;

import com.projectizer.core.entities.AuthAdmin;
import com.projectizer.core.entities.AuthUser;
import com.projectizer.entities.Admin;
import com.projectizer.entities.Customer;
import com.projectizer.entities.User;

public class AdminDAO extends AbstractDAO {

	public Admin read(long id) {
		return getEntityManager().find(Admin.class, id);
	}
	
	public User readUser(long id) {
		return read(id);
	}
	
	public AuthUser findAuthAdmin(String email, String password) {
		try {
			return getEntityManager()
					.createNamedQuery("Admin.findAuthAdmin", AuthAdmin.class)
					.setParameter("email", email)
					.setParameter("password", password)
					.getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}
	
	
	//TODO edit for admin
	public int getProjectCount(Customer customer) {
		return getEntityManager()
				.createNamedQuery("Customer.getProjectCount", Long.class)
				.setParameter("customer", customer)
				.getSingleResult().intValue();
	}
}
