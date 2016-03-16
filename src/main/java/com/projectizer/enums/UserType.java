package com.projectizer.enums;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

public enum UserType {
	CUSTOMER, CONTRACTOR, ADMIN;
	
	public static Map<String, String> getMap() {
		Map<String, String> map = new LinkedHashMap<>();
		Arrays.asList(UserType.values()).stream().map(value
				-> value.toString()).forEach(value
					-> map.put(value,
							value.charAt(0) + value.substring(1).toLowerCase(Locale.ENGLISH)));
		return map;
	}
}
