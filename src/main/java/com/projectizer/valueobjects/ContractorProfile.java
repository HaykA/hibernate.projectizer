package com.projectizer.valueobjects;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.projectizer.entities.Skill;
import com.projectizer.enums.SkillDegree;

@Embeddable
public class ContractorProfile implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Enumerated(EnumType.STRING)
	private SkillDegree degree = SkillDegree.UNKNOWN;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "skillId")
	private Skill skill;
	
	protected ContractorProfile() {}
	
	public ContractorProfile(SkillDegree degree) {
		this.degree = degree;
	}
	
	public SkillDegree getDegree() {
		return degree;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof ContractorProfile)) {
			return false;
		}
		ContractorProfile profile = (ContractorProfile) obj;
		return profile.degree.equals(degree)
				&& profile.skill.equals(skill);
	}
	
	@Override
	public int hashCode() {
		int hash = 43;
        hash = 31 * hash + Objects.hashCode(degree);
        hash = 31 * hash + Objects.hashCode(skill);
        return hash;
	}	
}
