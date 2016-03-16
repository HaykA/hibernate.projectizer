package com.projectizer.valueobjects;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.projectizer.entities.Language;

@Embeddable
public class UserSettings implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private boolean active;
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "languageId")
	private Language language;
	private int sessionMaxInactiveInterval;

	protected UserSettings() {}
	
	public UserSettings(int sessionMaxInactiveInterval) {
		this.sessionMaxInactiveInterval = sessionMaxInactiveInterval; 
	}

	public boolean isActive() {
		return active;
	}

	public Language getLanguage() {
		return language;
	}
	
	public int getSessionMaxInactiveInterval() {
		return sessionMaxInactiveInterval;
	}

	
}
