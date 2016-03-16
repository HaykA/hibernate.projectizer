package com.projectizer.entities;

import java.io.Serializable;
import java.util.Locale;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "skill")
public class Skill implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String SINGLE = "skill";
	public static final String MULTIPLE = "skills";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String description;
	
	protected Skill() {}
	
	public Skill(String name, String description) {
		setName(name);
		setDescription(description);
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getHtml() {
		String br = "<br/>";
		return (new StringBuilder())
				.append("Id: ").append(id).append(br)
				.append("Description: ").append(description)
		.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof Skill)) {
			return false;
		}
		return ((Skill) obj).name.equals(name);
	}
	
	@Override
	public int hashCode() {
        return name.toLowerCase(Locale.ENGLISH).hashCode();
	}
}
