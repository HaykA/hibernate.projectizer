package com.projectizer.core.valueobjects;

import java.io.Serializable;

import com.projectizer.enums.UserType;

public class CoreUser implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "coreUser";
	
	private final long id;
	private final UserType type;
	
	protected CoreUser (long id, UserType type) {
		this.id = id;
		this.type = type;
	}

	public long getId() {
		return id;
	}

	public UserType getType() {
		return type;
	}
}
