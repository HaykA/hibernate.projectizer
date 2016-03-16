package com.projectizer.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
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

import com.projectizer.comparators.ProjectComparator;
import com.projectizer.enums.Gender;
import com.projectizer.enums.UserType;
import com.projectizer.valueobjects.Address;
import com.projectizer.valueobjects.ContactHyperlink;
import com.projectizer.valueobjects.ContactNumber;

@Entity
@Table(name = "customer")
public class Customer implements Serializable, User {

	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "customer";
	public static final String MULTIPLE = "customers";

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

	@OneToMany(mappedBy = "customer")
	private Set<Project> projects = new HashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "customer_contactnumber",
	joinColumns = @JoinColumn(name = "customerId") )
	private Set<ContactNumber> contactNumbers = new LinkedHashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "customer_contacthyperlink",
	joinColumns = @JoinColumn(name = "customerId") )
	private Set<ContactHyperlink> contactHyperlinks = new LinkedHashSet<>();
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "customer_contactlanguage",
		joinColumns = @JoinColumn(name = "customerId"),
		inverseJoinColumns = @JoinColumn(name = "contactLanguageId"))
	private Set<Language> contactLanguages = new LinkedHashSet<>();
	
protected Customer() {}
	
	public Customer(String email) {
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

	@Override
	public Set<Project> getProjects() {
		List<Project> projectList = new ArrayList<>(projects);
		Collections.sort(projectList, new ProjectComparator());
		return Collections.unmodifiableSet(new LinkedHashSet<>(projectList));
	}
	
	@Override
	public Set<ContactNumber> getContactNumbers() {
		return Collections.unmodifiableSet(contactNumbers);
	}

	public Set<ContactHyperlink> getContactHyperlinks() {
		return Collections.unmodifiableSet(contactHyperlinks);
	}
	
	public Set<Language> getContactLanguages() {
		return Collections.unmodifiableSet(contactLanguages);
	}
	
	@Override
	public String getName() {
		return firstname + ' ' + secondname;
	}
	
	@Override
	public UserType getType() {
		return UserType.CUSTOMER;
	}
	
	@Override
	public String getClassNameToLowerCase() {
		return this.getClass().getSimpleName().toLowerCase(Locale.ENGLISH);
	}
	
	@Override
	public int getProjectCount() {
		return projects.size();
	}
	
	@Override
	public String getImageName() {
		if (company != null) {
			return String.valueOf(company.getId());
		}
		return String.valueOf(id);
	}
	
	@Override
	public boolean isRelevantProject(long id) {
		return isRelevantProject(projects, id);
	}
	
	protected static boolean isRelevantProject(Set<Project> projectSet, long id) {
		return projectSet.stream().map(Project::getId).collect(Collectors.toSet()).contains(id);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Customer)) {
			return false;
		}
		Customer customer = (Customer) obj;
		return customer.email.equalsIgnoreCase(email);
	}
	
	@Override
	public int hashCode() {
		int hash = 13;
        hash = 87 * hash + Objects.hashCode(email.toLowerCase(Locale.ENGLISH));
        return hash;
	}
}
