package com.projectizer.entities;

import java.io.Serializable;
import java.util.Set;

import com.projectizer.enums.UserType;
import com.projectizer.valueobjects.ContactNumber;

public class Admin implements Serializable, User {

	private static final long serialVersionUID = 1L;

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Set<Project> getProjects() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserType getType() {
		return UserType.ADMIN;
	}

	@Override
	public Company getCompany() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<ContactNumber> getContactNumbers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getClassNameToLowerCase() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getProjectCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getImageName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isRelevantProject(long id) {
		// TODO Auto-generated method stub
		return false;
	}
}
