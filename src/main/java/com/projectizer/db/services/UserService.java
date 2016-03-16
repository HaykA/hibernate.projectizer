package com.projectizer.db.services;

import com.projectizer.core.entities.AuthUser;
import com.projectizer.core.valueobjects.CoreUser;
import com.projectizer.db.dao.AdminDAO;
import com.projectizer.db.dao.ContractorDAO;
import com.projectizer.db.dao.CustomerDAO;
import com.projectizer.entities.Customer;
import com.projectizer.entities.Project;
import com.projectizer.entities.User;
import com.projectizer.enums.UserType;

public class UserService extends AbstractService {
	
	private AdminDAO adminDAO = new AdminDAO();
	private ContractorDAO contractorDAO = new ContractorDAO();
	private CustomerDAO customerDAO = new CustomerDAO();
	
	public AuthUser findAuthUser(UserType userType, String email, String password) {
		switch (userType) {
		case CUSTOMER:
			return customerDAO.findAuthCustomer(email, password);
		case ADMIN:
			return adminDAO.findAuthAdmin(email, password);
		case CONTRACTOR:
			return contractorDAO.findAuthContractor(email, password);
			default:
				return null;
		}
	}
	
	public User readUser(CoreUser coreUser) {
		switch (coreUser.getType()) {
		case CUSTOMER:
			return customerDAO.readUser(coreUser.getId());
		case ADMIN:
			return adminDAO.readUser(coreUser.getId());
		case CONTRACTOR:
			return contractorDAO.readUser(coreUser.getId());
			default:
				return null;
		}
	}
	
	public Project findProject(User user, long projectId) {
		if (user instanceof Customer) {
			return customerDAO.findProject(user, projectId);
		}
		return null;
	}

}
