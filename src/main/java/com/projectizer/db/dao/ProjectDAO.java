package com.projectizer.db.dao;

import com.projectizer.entities.Project;

public class ProjectDAO extends AbstractDAO {
	
	public Project read(long id) {
		return getEntityManager().find(Project.class, id);
	}

}
