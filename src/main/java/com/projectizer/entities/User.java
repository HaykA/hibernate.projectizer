package com.projectizer.entities;

import java.util.Set;

import com.projectizer.enums.UserType;
import com.projectizer.valueobjects.ContactNumber;

public interface User {
	long getId();
	String getEmail();
	String getName();
	UserType getType();
	Company getCompany();
	Set<Project> getProjects();
	Set<ContactNumber> getContactNumbers();
	String getClassNameToLowerCase();
	int getProjectCount();
	String getImageName();
	boolean isRelevantProject(long id);
}
