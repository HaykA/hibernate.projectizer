package com.projectizer.comparators;

import java.util.Comparator;

import com.projectizer.entities.Project;

public class ProjectComparator implements Comparator<Project> {

	@Override
	public int compare(Project p1, Project p2) {
		return (p1.getStatus().getIndex() + p1.getName()).compareToIgnoreCase((p2.getStatus().getIndex() + p2.getName()));
	}

}
