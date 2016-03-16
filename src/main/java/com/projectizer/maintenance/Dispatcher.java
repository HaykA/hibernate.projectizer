package com.projectizer.maintenance;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.projectizer.core.valueobjects.CoreUser;

public final class Dispatcher {
	private Dispatcher() {}
	
	public static CoreUser getCoreUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		CoreUser coreUser = null;
		if (session != null) {
			coreUser = (CoreUser) session.getAttribute(CoreUser.SINGLE);
		}
		return coreUser;
	}
	
	public static CoreUser getCoreUser(ServletRequest request) {
		return getCoreUser((HttpServletRequest) request);
	}
}
