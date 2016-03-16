package com.projectizer.valueobjects;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Embeddable
public class Performance implements Serializable {

	private static final long serialVersionUID = 1L;

	@Temporal(TemporalType.DATE)
	private Date date;
	private int totalQuarterHours;
	private String description;
	private BigDecimal hourSalary;
	private int distance;
	private int additionalDistance;
	private boolean approved;
	private boolean paid;
	
	protected Performance() {}
	
	public Performance(Date date, int totalQuarterHours, String description,
			BigDecimal hourSalary, int distance, int additionalDistance,
			boolean approved, boolean paid) {
		this.date = date;
		this.totalQuarterHours = totalQuarterHours;
		this.description = description;
		this.hourSalary = hourSalary;
		this.distance = distance;
		this.additionalDistance = additionalDistance;
		this.approved = approved;
		this.paid = paid;
	}

	public Date getDate() {
		return date;
	}

	public int getTotalQuarterHours() {
		return totalQuarterHours;
	}

	public String getDescription() {
		return description;
	}

	public BigDecimal getHourSalary() {
		return hourSalary;
	}

	public int getDistance() {
		return distance;
	}

	public int getAdditionalDistance() {
		return additionalDistance;
	}

	public boolean isApproved() {
		return approved;
	}

	public boolean isPaid() {
		return paid;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Performance)) {
			return false;
		}
		Performance performance = (Performance) obj;
		return performance.date.equals(date)
				&& performance.totalQuarterHours == totalQuarterHours
				&& performance.description.equals(description)
				&& performance.hourSalary == hourSalary
				&& performance.distance == distance
				&& performance.additionalDistance == additionalDistance
				&& performance.approved == approved
				&& performance.paid == paid;
	}
	
	@Override
	public int hashCode() {
		int hash = 61;
        hash = 97 * hash + Objects.hashCode(date);
        hash = 97 * hash + Objects.hashCode(totalQuarterHours);
        hash = 97 * hash + Objects.hashCode(description);
        hash = 97 * hash + Objects.hashCode(hourSalary);
        hash = 97 * hash + Objects.hashCode(distance);
        hash = 97 * hash + Objects.hashCode(additionalDistance);
        hash = 97 * hash + Objects.hashCode(approved);
        hash = 97 * hash + Objects.hashCode(paid);
        return hash;
	}
	
}
