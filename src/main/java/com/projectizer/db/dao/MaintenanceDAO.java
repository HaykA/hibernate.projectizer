package com.projectizer.db.dao;

import com.projectizer.maintenance.TableMetaData;

public class MaintenanceDAO extends AbstractDAO {
	
	public TableMetaData trackCountryMetaData() {
		return getEntityManager()
				.createNamedQuery("Maintenance.trackCountryMetaData", TableMetaData.class)
				.getSingleResult();
	}
}
