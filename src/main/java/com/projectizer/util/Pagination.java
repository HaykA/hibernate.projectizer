package com.projectizer.util;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class Pagination implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private final Page firstPage;
	private final Page stepBackward;
	private final Page previousPage;
	private final Set<Page> pages;
	private final Page nextPage;
	private final Page stepForward;
	private final Page lastPage;
	private final int startPosition;
	private final int maxResult;
	private boolean stepper;
	
	
	private Pagination(Page firstPage, Page stepBackward, Page previousPage,
			Set<Page> pages, Page nextPage, Page stepForward, Page lastPage,
			int startPosition, int maxResult, boolean stepper) {
		this.firstPage = firstPage;
		this.stepBackward = stepBackward;
		this.previousPage = previousPage;
		this.pages = pages;
		this.nextPage = nextPage;
		this.stepForward = stepForward;
		this.lastPage = lastPage;
		this.startPosition = startPosition;
		this.maxResult = maxResult;
		this.stepper = stepper;
	}
	
	public static Pagination getInstance(PaginationFactory paginator) {
		return new Pagination(paginator.getFirstPage(), paginator.getStepBackward(),
				paginator.getPreviousPage(), paginator.getPages(), paginator.getNextPage(),
				paginator.getStepForward(), paginator.getLastPage(),
				paginator.getStartPosition(), paginator.getMaxResult(), paginator.isStepper());
	}

	public Page getFirstPage() {
		return firstPage;
	}


	public Page getStepBackward() {
		return stepBackward;
	}


	public Page getPreviousPage() {
		return previousPage;
	}

	public Set<Page> getPages() {
		return pages;
	}
	
	public Page getNextPage() {
		return nextPage;
	}


	public Page getStepForward() {
		return stepForward;
	}
	
	public Page getCurrentPage() {
		return pages.stream()
				.filter(Page::isCurrent)
				.collect(Collectors.toList()).get(0);
	}


	public Page getLastPage() {
		return lastPage;
	}


	public int getMaxResult() {
		return maxResult;
	}

	public long getStartPosition() {
		return startPosition;
	}
	
	public boolean isStepper() {
		return stepper;
	}
	
	public Map<String, Integer> getMaxResults() {
		return PageLayout.MAXRESULTS;
	}
}
