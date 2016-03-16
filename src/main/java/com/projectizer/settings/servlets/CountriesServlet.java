package com.projectizer.settings.servlets;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectizer.db.services.CountryService;
import com.projectizer.maintenance.TableMetaData;
import com.projectizer.util.Attrib;
import com.projectizer.util.Breadcrumb;
import com.projectizer.util.PageLayout;

/**
 * Servlet implementation class CountriesServlet
 */
@WebServlet(CountriesServlet.PATH)
public class CountriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static final String NAME = "Countries";
	protected static final String PATH = "/settings/countries.htm";
	
	private static final String VIEW = "/WEB-INF/JSP/settings/countries.jsp";
	private static final Breadcrumb breadcrumb = new Breadcrumb();
	
	private final PageLayout pageLayout = new PageLayout();
	
	private final transient CountryService countryService = new CountryService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("countryMetaData", new TableMetaData(123L, 289L));
		request.setAttribute("countryCount", countryService.getCount());
		request.setAttribute(Breadcrumb.SINGLE, breadcrumb);
		request.setAttribute(Attrib.SERVLETPATH, PATH);
		request.setAttribute(PageLayout.PAGINATION, pageLayout.getPagination(101, 25, 1));
		request.getRequestDispatcher(VIEW).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		breadcrumb.addLevel(SettingsServlet.NAME, SettingsServlet.PATH);
		breadcrumb.addLevel(NAME, PATH);
	}
}
