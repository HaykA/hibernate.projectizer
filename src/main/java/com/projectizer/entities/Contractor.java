package com.projectizer.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.projectizer.enums.Gender;
import com.projectizer.enums.UserType;
import com.projectizer.valueobjects.Address;
import com.projectizer.valueobjects.ContactHyperlink;
import com.projectizer.valueobjects.ContactNumber;
import com.projectizer.valueobjects.ContractorProfile;

@Entity
@Table(name = "contractor")
public class Contractor implements Serializable, User {
	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "contractor";
	public static final String MULTIPLE = "contractors";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String email;
	
	private String firstname;
	private String secondname;
	@Enumerated(EnumType.STRING)
	private Gender gender;
	@Embedded
	private Address address;
	
	@ManyToOne
	@JoinColumn(name = "companyId")
	private Company company;
	
	private BigDecimal hourSalary;

	@OneToMany(mappedBy="contractor")
	private Set<Contract> contracts = new HashSet<>();

	@OneToMany(mappedBy = "manager")
	private Set<Project> managedByMeProjects = new LinkedHashSet<>();
	
	@ManyToMany(mappedBy = "assistants")
	private Set<Project> assistedByMeProjects = new LinkedHashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "contractor_contactnumber",
	joinColumns = @JoinColumn(name = "contractorId") )
	private Set<ContactNumber> contactNumbers = new LinkedHashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "contractor_contacthyperlink",
	joinColumns = @JoinColumn(name = "contractorId") )
	private Set<ContactHyperlink> contactHyperlinks = new LinkedHashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "contractor_profile",
	joinColumns = @JoinColumn(name = "contractorId") )
	private Set<ContractorProfile> profiles = new HashSet<>();
	
	protected Contractor() {}
	
	public Contractor(String email) {
		this.email = email;
	}
	
	@Override
	public long getId() {
		return id;
	}

	@Override
	public String getEmail() {
		return email;
	}
	
	public Gender getGender() {
		return gender;
	}

	public String getFirstname() {
		return firstname;
	}

	public String getSecondname() {
		return secondname;
	}
	
	public Address getAddress() {
		return address;
	}
	
	@Override
	public Company getCompany() {
		return company;
	}

	public BigDecimal getHourSalary() {
		return hourSalary;
	}

	public void setHourSalary(BigDecimal hourSalary) {
		this.hourSalary = hourSalary;
	}
	
	public Set<Contract> getContracts() {
		return Collections.unmodifiableSet(contracts);
	}
	
	public Set<Project> getManagedByMeProjects() {
		return Collections.unmodifiableSet(managedByMeProjects);
	}

	public Set<Project> getAssistedByMeProjects() {
		return Collections.unmodifiableSet(assistedByMeProjects);
	}

	@Override
	public Set<ContactNumber> getContactNumbers() {
		return Collections.unmodifiableSet(contactNumbers);
	}

	public Set<ContactHyperlink> getContactHyperlinks() {
		return Collections.unmodifiableSet(contactHyperlinks);
	}

	public Set<ContractorProfile> getProfiles() {
		return Collections.unmodifiableSet(profiles);
	}
	
	@Override
	public boolean isRelevantProject(long id) {
		return isRelevantProject(getProjects(), id)
				|| isRelevantProject(getManagedByMeProjects(), id)
				|| isRelevantProject(getAssistedByMeProjects(), id);
	}
	
	protected static boolean isRelevantProject(Set<Project> projectSet, long id) {
		return projectSet.stream().map(Project::getId)
				.collect(Collectors.toSet()).contains(id);
	}

	@Override
	public Set<Project> getProjects() {
		return getContracts().stream().map(Contract::getProject)
				.collect(Collectors.toSet());
	}
	
	@Override
	public String getName() {
		return firstname + ' ' + secondname;
	}

	@Override
	public UserType getType() {
		return UserType.CONTRACTOR;
	}
	
	@Override
	public String getClassNameToLowerCase() {
		return this.getClass().getSimpleName().toLowerCase(Locale.ENGLISH);
	}
	
	@Override
	public int getProjectCount() {
		return getProjects().size();
	}
	
	@Override
	public String getImageName() {
		if (company != null) {
			return String.valueOf(company.getId());
		}
		return String.valueOf(id);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Contractor)) {
			return false;
		}
		Contractor contractor = (Contractor) obj;
		return contractor.id == id && contractor.email.equals(email);
	}
	
	@Override
	public int hashCode() {
		int hash = 7;
        hash = 23 * hash + Objects.hashCode(id);
        hash = 23 * hash + Objects.hashCode(email);
        return hash;
	}
}
