package com.projectizer.db.services;

import com.projectizer.db.dao.MaintenanceDAO;
import com.projectizer.maintenance.TableMetaData;

public class MaintenanceService extends AbstractService {
	private final MaintenanceDAO maintenanceDAO = new MaintenanceDAO();
	
	public TableMetaData trackCountryMetaData() {
		return maintenanceDAO.trackCountryMetaData();
	}
}
