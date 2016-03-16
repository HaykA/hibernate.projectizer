package com.projectizer.enums;

public enum ProjectStatus {
	CREATED, VIEWED, APPROVED, DISPUTED, PROCESSING, FINALIZED, CANCELLED;
	
	public int getIndex() {
		switch (this) {
		case CREATED:
			return 0;
		case VIEWED:
			return 1;
		case APPROVED:
			return 2;
		case DISPUTED:
			return 3;
		case PROCESSING:
			return 4;
		case FINALIZED:
			return 5;
		case CANCELLED:
			return 6;
		default:
			return -1;
		}
	}
}

