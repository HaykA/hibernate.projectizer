package com.projectizer.core.entities;

import java.io.Serializable;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.projectizer.enums.UserType;
import com.projectizer.valueobjects.UserSettings;

@Entity
@Table(name = "customer")
public class AuthCustomer implements Serializable, AuthUser {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String email;
	private String password;
	@Embedded
	private UserSettings settings;
	
	protected AuthCustomer() {}
	
	public AuthCustomer(String email, String password) {
		this.email = email;
		this.password = password;
	}

	@Override
	public long getId() {
		return id;
	}

	@Override
	public String getEmail() {
		return email;
	}

	@Override
	public String getPassword() {
		return password;
	}
	
	@Override
	public UserSettings getSettings() {
		return settings;
	}
	
	@Override
	public UserType getType() {
		return UserType.CUSTOMER;
	}
}
