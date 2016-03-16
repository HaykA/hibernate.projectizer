package com.projectizer.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.projectizer.valueobjects.Cost;
import com.projectizer.valueobjects.Performance;

@Entity
@Table(name = "contract")
public class Contract implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "contract";
	public static final String MULTIPLE = "contracts";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Temporal(TemporalType.DATE)
	private Date date;
	private BigDecimal hourSalary;
	private int distance;
	private String skill;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "projectId")
	private Project project;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "contractorId")
	private Contractor contractor;
	
	@ElementCollection
	@CollectionTable(name = "contract_performance",
	joinColumns = @JoinColumn(name = "contractId") )
	private Set<Performance> performances;
	
	@ElementCollection
	@CollectionTable(name = "contract_cost",
	joinColumns = @JoinColumn(name = "contractId") )
	private Set<Cost> costs;
	
	protected Contract() {}
	
	public Contract(Date date, BigDecimal hourSalary, int distance, String skill) {
		setDate(date);
		setHourSalary(hourSalary);
		setDistance(distance);
		setSkill(skill);
		performances = new LinkedHashSet<>();
		costs = new LinkedHashSet<>();
	}
	
	public long getId() {
		return id;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}

	public BigDecimal getHourSalary() {
		return hourSalary;
	}

	public void setHourSalary(BigDecimal hourSalary) {
		this.hourSalary = hourSalary;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public Project getProject() {
		return project;
	}

	public Contractor getContractor() {
		return contractor;
	}

	public Set<Performance> getPerformances() {
		return Collections.unmodifiableSet(performances);
	}

	public Set<Cost> getCosts() {
		return Collections.unmodifiableSet(costs);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Contract)) {
			return false;
		}
		Contract contract = (Contract) obj;
		return contract.date == date && contract.id == id;
	}
	
	@Override
	public int hashCode() {
		int hash = 5;
        hash = 59 * hash + Objects.hashCode(date);
        hash = 59 * hash + Objects.hashCode(id);
        return hash;
	}
	
}
