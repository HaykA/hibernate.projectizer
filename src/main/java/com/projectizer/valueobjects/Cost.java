package com.projectizer.valueobjects;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Embeddable
public class Cost implements Serializable {

	private static final long serialVersionUID = 1L;

	@Temporal(TemporalType.DATE)
	private Date date;
	private String description;
	private boolean approved;
	private boolean paid;
	
	protected Cost() {}
	
	public Cost(Date date, String description,
			boolean approved, boolean paid) {
		this.date = date;
		this.description = description;
		this.approved = approved;
		this.paid = paid;
	}

	public Date getDate() {
		return date;
	}

	public String getDescription() {
		return description;
	}

	public boolean isApproved() {
		return approved;
	}

	public boolean isPaid() {
		return paid;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Cost)) {
			return false;
		}
		Cost cost = (Cost) obj;
		return cost.date.equals(date)
				&& cost.description.equals(description)
				&& cost.approved == approved
				&& cost.paid == paid;
	}
	
	@Override
	public int hashCode() {
		int hash = 39;
        hash = 89 * hash + Objects.hashCode(date);
        hash = 89 * hash + Objects.hashCode(description);
        hash = 89 * hash + Objects.hashCode(approved);
        hash = 89 * hash + Objects.hashCode(paid);
        return hash;
	}
}
