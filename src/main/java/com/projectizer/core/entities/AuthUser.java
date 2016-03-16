package com.projectizer.core.entities;

import com.projectizer.enums.UserType;
import com.projectizer.valueobjects.UserSettings;

public interface AuthUser {
	long getId();
	String getEmail();
	String getPassword();
	UserSettings getSettings();
	UserType getType();
}
