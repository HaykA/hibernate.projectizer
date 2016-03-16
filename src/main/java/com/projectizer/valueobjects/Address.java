package com.projectizer.valueobjects;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.projectizer.entities.Country;

@Embeddable
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String street;
	private String houseNumber;
	private String postalIndex;
	private String city;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "countryId")
	private Country country;
	
	protected Address() {}
	
	public Address(String street, String houseNumber, String postalIndex, String city) {
		this.street = street;
		this.houseNumber = houseNumber;
		this.postalIndex = postalIndex;
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public String getHouseNumber() {
		return houseNumber;
	}
	
	public String getStreetAndNumber() {
		return street + ' ' + houseNumber;
	}
	
	public String getPostalIndexAndCity() {
		return postalIndex + ' ' + city;
	}
	
	public String getCityAndCountry() {
		return city + ", " + country;
	}
	
	public String getHref() {
		StringBuilder sb = new StringBuilder();
		if (street != null) {
			sb.append(street.replace(' ', '+'));
			if (houseNumber.replace(' ', '+') != null) {
				sb.append("+").append(houseNumber);
			}
		}
		if (city != null) {
			if (!sb.toString().isEmpty()) {
				sb.append(",+");
			}
			sb.append(city.replace(' ', '+'));
		}
		return sb.toString();
	}

	public String getPostalIndex() {
		return postalIndex;
	}

	public String getCity() {
		return city;
	}

	public Country getCountry() {
		return country;
	}
}
