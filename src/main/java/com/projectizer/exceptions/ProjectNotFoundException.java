package com.projectizer.exceptions;

public class ProjectNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public ProjectNotFoundException() {}
	
	public ProjectNotFoundException(Throwable cause) {
		super(cause);
	}
}
