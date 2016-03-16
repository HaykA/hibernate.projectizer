package com.projectizer.maintenance;

import java.io.Serializable;

public class TableMetaData implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long count;
	private Long max;
	
	protected TableMetaData(){}
	
	public TableMetaData(Long count, Long max) {
		this.count = count;
		this.max = max;
	}
	
	public Long getCount() {
		return count;
	}
	
	public Long getMax() {
		return max;
	}
	
	public Long getDifference() {
		return max - count;
	}
}
