package com.projectizer.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class PageLayout implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String PAGINATION = "pagination";
	
	public static final Map<String, Integer> MAXRESULTS = initPerPage();
	private static Map<String, Integer> initPerPage() {
		Map<String, Integer> map = new LinkedHashMap<>();
		map.put("1", 25);
		map.put("2", 50);
		map.put("3", 75);
		map.put("4", 100);
		return map;
	}
	
	private final int pageGroupLength;
	
	public PageLayout() {
		this.pageGroupLength = 4;
	}
	
	public PageLayout(int pageGroupLength) {
		if (pageGroupLength < 2) {
			this.pageGroupLength = 4;
		} else {
			this.pageGroupLength = pageGroupLength;
		}
	}
	
	public Pagination getPagination(int entityCount, String paramMaxResultKey, String paramPage) {
		return PaginationFactory.createPagination(entityCount, getMaxResult(paramMaxResultKey),
				getPage(paramPage), pageGroupLength);
	}
	
	public Pagination getPagination(int entityCount, int maxResult, int currentPage) {
		return PaginationFactory.createPagination(entityCount, maxResult,
				currentPage, pageGroupLength);
	}
	
	private int getMaxResult(String maxResultKey) {
		return (MAXRESULTS.containsKey(maxResultKey))
				? MAXRESULTS.get(maxResultKey)
				: (new ArrayList<>(MAXRESULTS.values())).get(0);
	}
	
	private int getPage(String paramPage) {
		try {
			return Integer.parseInt(paramPage);
		} catch (NumberFormatException ex) {
			return 1;
		}
	}
}
