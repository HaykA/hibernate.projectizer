package com.projectizer.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectizer.core.valueobjects.CoreUser;
import com.projectizer.db.services.UserService;
import com.projectizer.maintenance.Dispatcher;
import com.projectizer.maintenance.Maintenance;
import com.projectizer.servlets.SignInServlet;
import com.projectizer.util.Attrib;

/**
 * Servlet Filter implementation class SignInFilter
 */
@WebFilter("*.htm")
public class SignInFilter implements Filter {

	private final transient UserService userService = new UserService();
	public final static String CURRENCY = "EUR";
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		if (req.getParameter("signout") != null) {
			loadSignIn(req, resp);
		} else {
			CoreUser coreUser = null;
			if (session != null) {
				coreUser = (CoreUser) session.getAttribute(CoreUser.SINGLE);
			}
			boolean signInRequest = String.format(SignInServlet.RELOAD_PATH, req.getContextPath()).equals(req.getRequestURI());
			if (session == null || coreUser == null) {
				if (!signInRequest) {
					loadSignIn(req, resp);
				} else {
					chain.doFilter(request, response);
				}
			} else {
				request.setAttribute(Attrib.CURRENCY, CURRENCY);
				request.setAttribute(Attrib.USER, userService.readUser(Dispatcher.getCoreUser(request)));
				chain.doFilter(request, response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {}
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {}

	private void loadSignIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Maintenance.invalidateSession(request);
		response.sendRedirect(String.format(SignInServlet.RELOAD_PATH, request.getContextPath()));
	}
}
