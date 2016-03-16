package com.projectizer.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectizer.core.entities.AuthUser;
import com.projectizer.core.valueobjects.CoreUser;
import com.projectizer.core.valueobjects.CoreUserFactory;
import com.projectizer.db.services.UserService;
import com.projectizer.enums.UserType;
import com.projectizer.util.Attrib;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet(SignInServlet.PATH)
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final String PATH = "/signin.htm";
	public static final String RELOAD_PATH = "%s" + PATH;
	private static final String VIEW = "/WEB-INF/JSP/signin.jsp";
	
	
	private final transient UserService userService = new UserService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			request.setAttribute(Attrib.USERTYPES, UserType.getMap());
			request.getRequestDispatcher(VIEW).forward(request, response);
		} else {
			response.sendRedirect(String.format(IndexServlet.RELOAD_PATH, request.getContextPath()));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Boolean> errors = new HashMap<>();
		String email = request.getParameter("email");
		if (email == null || email.isEmpty()) {
			errors.put("email", true);
		}
		String password = request.getParameter("password");
		if (password == null || password.isEmpty()) {
			errors.put("password", true);
		}
		String userType = request.getParameter("userType");
		if (userType == null || userType.isEmpty()) {
			errors.put("userType", true);
		}
		
		AuthUser authUser = null;
		if (errors.isEmpty()) {
			authUser = userService.findAuthUser(UserType.valueOf(userType), email, password);
			if (authUser == null) {
				errors.put("user", true);
			}
		}
		if (errors.isEmpty()) {
			HttpSession session = request.getSession(true);
			session.setMaxInactiveInterval(authUser.getSettings().getSessionMaxInactiveInterval());
			session.setAttribute(CoreUser.SINGLE, CoreUserFactory.createCoreUser(authUser));
			response.sendRedirect(String.format(IndexServlet.RELOAD_PATH, request.getContextPath()));
		} else {
			request.setAttribute(Attrib.ERRORS, errors);
			doGet(request, response);
		}
	}
}
