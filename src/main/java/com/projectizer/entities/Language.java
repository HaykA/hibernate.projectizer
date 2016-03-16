package com.projectizer.entities;

import java.io.Serializable;
import java.util.Locale;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "language")
public class Language implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "language";
	public static final String MULTIPLE = "languages";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String shortname;
	private String nativename;
	private String nativeShortname;
	
	protected Language() {}
	
	public Language(String name, String shortname,
			String nativename, String nativeShortname) {
		setName(name);
		setShortname(shortname);
		setNativename(nativename);
		setNativeShortname(nativeShortname);
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
	
	public String getNativename() {
		return nativename;
	}

	public void setNativename(String nativename) {
		this.nativename = nativename;
	}

	public String getNativeShortname() {
		return nativeShortname;
	}

	public void setNativeShortname(String nativeShortname) {
		this.nativeShortname = nativeShortname;
	}

	public String getHtml() {
		String br = "<br/>";
		return (new StringBuilder())
				.append("Id: ").append(id).append(br)
				.append("Name: ").append(name).append(br)
				.append("Shortname: ").append(shortname).append(br)
				.append("Native name: ").append(nativename).append(br)
				.append("Native shortname: ").append(nativeShortname)
		.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Language)) {
			return false;
		}
		return ((Language) obj).name.equals(name);
	}
	
	@Override
	public int hashCode() {
        return name.toLowerCase(Locale.ENGLISH).hashCode();
	}
}
