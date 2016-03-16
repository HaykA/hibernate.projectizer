package com.projectizer.entities;

import java.io.Serializable;
import java.util.Locale;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "country")
public class Country implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "country";
	public static final String MULTIPLE = "countries";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String shortname;
	
	protected Country() {}
	
	public Country(String name, String shortname) {
		setName(name);
		setShortname(shortname);
	}
	
	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public String getHtml() {
		String br = "<br/>";
		return (new StringBuilder())
				.append("Id: ").append(id).append(br)
				.append("Name: ").append(name)
		.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Country)) {
			return false;
		}
		return ((Country) obj).name.equals(name);
	}
	
	@Override
	public int hashCode() {
        return name.toLowerCase(Locale.ENGLISH).hashCode();
	}
	
	@Override
	public String toString() {
		return name;
	}
}
