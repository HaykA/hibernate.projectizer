package com.projectizer.maintenance;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public final class Maintenance {
	
	private Maintenance() {}
	// TODO Country Database Reorganization
	
	public static void invalidateSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
	}
}
