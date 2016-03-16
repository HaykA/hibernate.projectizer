package com.projectizer.projects.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectizer.db.services.ProjectService;
import com.projectizer.entities.Project;
import com.projectizer.entities.User;
import com.projectizer.exceptions.ProjectNotFoundException;
import com.projectizer.util.Attrib;

/**
 * Servlet implementation class ProjectServlet
 */
@WebServlet(ProjectServlet.PATH)
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected static final String PATH = "/project.htm";
	public static final String RELOAD_PATH = "%s" + PATH;
	
	private static final String VIEW = "/WEB-INF/JSP/projects/project.jsp";
	
	private final transient ProjectService projectService = new ProjectService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id != null) {
			try {
				long projectId = Long.parseLong(id);
				User user = (User)request.getAttribute(Attrib.USER);
				if (user.isRelevantProject(projectId)) {
					request.setAttribute(Project.SINGLE, projectService.read(projectId));
				} else {
					throw new ProjectNotFoundException();
				}
				request.getRequestDispatcher(VIEW).forward(request, response);
			} catch (NumberFormatException ex) {
				throw new ProjectNotFoundException(ex);
			}
		} else {
			response.sendRedirect(String.format(ProjectsServlet.RELOAD_PATH, request.getContextPath()));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
