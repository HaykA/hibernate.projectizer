package com.projectizer.db.dao;

import javax.persistence.NoResultException;

import com.projectizer.core.entities.AuthCustomer;
import com.projectizer.core.entities.AuthUser;
import com.projectizer.entities.Customer;
import com.projectizer.entities.Project;
import com.projectizer.entities.User;
import com.projectizer.exceptions.ProjectNotFoundException;

public class CustomerDAO extends AbstractDAO {
	
	public Customer read(long id) {
		return getEntityManager().find(Customer.class, id);
	}
	
	public User readUser(long id) {
		return read(id);
	}
	
	public AuthUser findAuthCustomer(String email, String password) {
		try {
			return getEntityManager()
					.createNamedQuery("Customer.findAuthCustomer", AuthCustomer.class)
					.setParameter("email", email)
					.setParameter("password", password)
					.getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}
	
	
	public Project findProject(User user, long projectId) {
		try {
			return getEntityManager()
					.createNamedQuery("Customer.findProject", Project.class)
					.setParameter("customer", user)
					.setParameter("id", projectId)
					.getSingleResult();
		} catch (NoResultException ex) {
			throw new ProjectNotFoundException(ex);
		}
	}

	
}
