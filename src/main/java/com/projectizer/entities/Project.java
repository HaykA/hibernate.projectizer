package com.projectizer.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.projectizer.enums.ProjectStatus;
import com.projectizer.valueobjects.Address;

@Entity
@Table(name = "project")
public class Project implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "project";
	public static final String MULTIPLE = "projects";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String reference;
	private String name;
	private String description;
	private BigDecimal budget;
	@Enumerated(EnumType.STRING)
	private ProjectStatus status;
	@Temporal(TemporalType.DATE)
	private Date creationDate;
	@Temporal(TemporalType.DATE)
	private Date startDate;
	@Temporal(TemporalType.DATE)
	private Date endDate;
	@Embedded
	private Address address;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "managerId")
	private Contractor manager;
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "customerId")
	private Customer customer;
	@OneToMany(mappedBy = "project")
	private Set<Contract> contracts = new HashSet<>();
	@ManyToMany
	@JoinTable(
	name = "project_assistant",
	joinColumns = @JoinColumn(name="projectId"),
	inverseJoinColumns = @JoinColumn(name="contractorId"))
	private Set<Contractor> assistants = new HashSet<>();
	
	protected Project() {}
	
	public Project(String name, String description, ProjectStatus status,
			Date creationDate, Date startDate, Date endDate,
			String street, String houseNumber, String postalIndex, String city) {
		this.name = name;
		this.description = description;
		this.status = status;
		this.creationDate = creationDate;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	public long getId() {
		return id;
	}
	
	public String getReference() {
		return reference;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}
	
	public BigDecimal getBudget() {
		return budget;
	}

	public ProjectStatus getStatus() {
		return status;
	}

	public Date getCreationDate() {
		return creationDate;
	}
	
	public Date getStartDate() {
		return startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public Address getAddress() {
		return address;
	}
	
	public Contractor getManager() {
		return manager;
	}
	
	public Set<Contractor> getAssistants() {
		return Collections.unmodifiableSet(assistants);
	}

	public Customer getCustomer() {
		return customer;
	}

	public Set<Contract> getContracts() { //TODO order by type >> name
		return Collections.unmodifiableSet(contracts);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Project)) {
			return false;
		}
		Project project = (Project) obj;
		return project.name.equalsIgnoreCase(name)
				&& project.status.equals(status);
	}
	
	@Override
	public int hashCode() {
		int hash = 13;
        hash = 87 * hash + Objects.hashCode(name.toLowerCase(Locale.ENGLISH));
        hash = 87 * hash + Objects.hashCode(status);
        return hash;
	}
	
	@Override
	public String toString() {
		return String.valueOf(id) + status.toString();
	}
}
