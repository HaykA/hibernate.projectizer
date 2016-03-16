package com.projectizer.entities;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import com.projectizer.valueobjects.Address;
import com.projectizer.valueobjects.ContactHyperlink;
import com.projectizer.valueobjects.ContactNumber;

@Entity
@Table(name = "company")
public class Company implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String taxIdNumber;
	@Embedded
	private Address address;
	private String websiteUrl;
	
	@ElementCollection
	@CollectionTable(name = "company_contactnumber",
	joinColumns = @JoinColumn(name = "companyId") )
	private Set<ContactNumber> contactNumbers = new LinkedHashSet<>();
	
	@ElementCollection
	@CollectionTable(name = "company_contacthyperlink",
	joinColumns = @JoinColumn(name = "companyId") )
	private Set<ContactHyperlink> contactHyperlinks = new LinkedHashSet<>();
	
	protected Company() {}

	
	public Company(String name, String taxIdNumber, Address address, String websiteUrl) { {
		this.name = name;
		this.taxIdNumber = taxIdNumber;
		this.address = address;
		this.websiteUrl = websiteUrl;
	}
		
	}
	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getTaxIdNumber() {
		return taxIdNumber;
	}

	public Address getAddress() {
		return address;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public Set<ContactNumber> getContactNumbers() {
		return contactNumbers;
	}

	public Set<ContactHyperlink> getContactHyperlinks() {
		return contactHyperlinks;
	}
	
	@Override
	public String toString() {
		return name;
	}
}
