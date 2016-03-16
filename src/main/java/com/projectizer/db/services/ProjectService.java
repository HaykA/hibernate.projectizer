package com.projectizer.db.services;

import com.projectizer.db.dao.ProjectDAO;
import com.projectizer.entities.Project;

public class ProjectService extends AbstractService {
	private final ProjectDAO projectDAO = new ProjectDAO();
	
	public Project read(long id) {
		return projectDAO.read(id);
	}

}
