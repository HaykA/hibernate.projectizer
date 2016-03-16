package com.projectizer.projects.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectizer.entities.Contractor;
import com.projectizer.entities.User;
import com.projectizer.enums.UserType;
import com.projectizer.util.Attrib;

/**
 * Servlet implementation class ProjectsServlet
 */
@WebServlet(ProjectsServlet.PATH)
public class ProjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static final String PATH = "/projects.htm";
	public static final String RELOAD_PATH = "%s" + PATH;
		
	private static final String VIEW = "/WEB-INF/JSP/projects.jsp";
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getAttribute(Attrib.USER);
		if (user.getType().equals(UserType.CONTRACTOR)) {
			Contractor contractor = (Contractor)request.getAttribute(Attrib.USER);  
			request.setAttribute(Contractor.SINGLE, contractor);
		}
		request.getRequestDispatcher(VIEW).forward(request, response);
	}
}
