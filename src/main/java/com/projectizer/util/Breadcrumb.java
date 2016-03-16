package com.projectizer.util;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

public class Breadcrumb implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String SINGLE = "breadcrumb";
	
	private final Map<String, String> levels = new LinkedHashMap<>();
	
	public void addLevel(String name, String url) {
		levels.put(name,  url);
	}
	
	public void removeLevel(String name) {
		levels.remove(name);
	}
	
	public Map<String, String> getLevels() {
		return levels;
	}

}
