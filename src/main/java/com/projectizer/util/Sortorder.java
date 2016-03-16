package com.projectizer.util;

public enum Sortorder {
	DEFAULT, ASC, DESC;
	
	public static Sortorder getFromString(String sortorder) {
		try {
			return Sortorder.valueOf(sortorder.toUpperCase());
		} catch (IllegalArgumentException ex) {
			return DEFAULT;
		}
	}
}
