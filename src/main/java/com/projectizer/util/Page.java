package com.projectizer.util;

import java.io.Serializable;

public class Page implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private final int number;
	private boolean current;
	
	Page(int number) {
		this.number = number;
	}
	
	public Page(int number, boolean current) {
		this(number);
		this.current = current;
	}
	
	public boolean isCurrent() {
		return current;
	}
	
	@Override
	public String toString() {
		return String.valueOf(number);
	}

}
