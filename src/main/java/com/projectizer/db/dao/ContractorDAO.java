package com.projectizer.db.dao;

import javax.persistence.NoResultException;

import com.projectizer.core.entities.AuthContractor;
import com.projectizer.core.entities.AuthUser;
import com.projectizer.entities.Contractor;
import com.projectizer.entities.User;

public class ContractorDAO extends AbstractDAO {

	public Contractor read(long id) {
		return getEntityManager().find(Contractor.class, id);
	}
	
	public User readUser(long id) {
		return read(id);
	}
	
	public AuthUser findAuthContractor(String email, String password) {
		try {
			return getEntityManager()
					.createNamedQuery("Contractor.findAuthContractor", AuthContractor.class)
					.setParameter("email", email)
					.setParameter("password", password)
					.getSingleResult();
		} catch (NoResultException ex) {
			return null;
		}
	}
	

}
