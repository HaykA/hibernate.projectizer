package com.projectizer.valueobjects;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.projectizer.enums.ContactNumberType;

@Embeddable
public class ContactNumber implements Serializable {

	private static final long serialVersionUID = 1L;

	private String value;
	@Enumerated(EnumType.STRING)
	private ContactNumberType type;
	
	protected ContactNumber() {}
	
	public ContactNumber(String value, ContactNumberType type) {
		this.value = value;
		this.type = type;
	}

	public String getValue() {
		return value;
	}

	public ContactNumberType getType() {
		return type;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof ContactNumber)) {
			return false;
		}
		ContactNumber contactNumber = (ContactNumber) obj;
		return contactNumber.value.equals(value)
				&& contactNumber.type.equals(type);
	}
	
	@Override
	public int hashCode() {
		int hash = 43;
        hash = 31 * hash + Objects.hashCode(value);
        hash = 31 * hash + Objects.hashCode(type);
        return hash;
	}
	
	@Override
	public String toString() {
		return value;
	}
	
}
