package com.projectizer.util;

import java.util.LinkedHashSet;
import java.util.Set;

public class PaginationFactory {
	
	private int entityCount;
	private int maxResult;
	private int currentPage;
	private int pageGroupLength;

	private PaginationFactory(int entityCount, int maxResult, int currentPage, int pageGroupLength) {
		this.entityCount = entityCount;
		this.maxResult = maxResult;
		this.currentPage = getCorrectedCurrentPage(currentPage);
		this.pageGroupLength = pageGroupLength;
	}
	
	public static Pagination createPagination(int entityCount, int maxResult,
			int currentPage, int pageGroupLength) {
		return Pagination.getInstance(new PaginationFactory(entityCount, maxResult,
				currentPage, pageGroupLength));
	}
	
	private int getPageCount() {
		int pageCount = entityCount / maxResult;
		return ((entityCount % maxResult) == 0)
				? pageCount
				: pageCount + 1;
	}
	
	private int getPageGroupCount() {
		int pageCount = getPageCount();
		int pageGroupCount = pageCount / pageGroupLength;
		return ((pageCount % pageGroupLength) == 0)
				? pageGroupCount
				: pageGroupCount + 1;
	}
	
	private int getCurrentPageGroup() {
		int currentPageGroup = currentPage / pageGroupLength;
		return ((currentPage % pageGroupLength) == 0)
				? currentPageGroup
				: currentPageGroup + 1;
	}
	
	private int getFirstPageOfCurrentPageGroup() {
		return (getCurrentPageGroup() - 1) * pageGroupLength + 1;
	}
	
	
	/* PAGES */
	
	protected Page getFirstPage() {
		return (getCurrentPageGroup() > 1)
				? new Page(1)
				: null;
	}
	
	protected Page getLastPage() {
		return (getCurrentPageGroup() < getPageGroupCount())
				? new Page(getPageCount())
				: null;
	}
	
	protected Page getPreviousPage() {
		return (currentPage > 1)
				? new Page(currentPage - 1)
				: null;
	}
	
	protected Page getNextPage() {
		return (currentPage < getPageCount())
				? new Page(currentPage + 1)
				: null;
	}
	
	protected Page getStepBackward() {
		return (getCurrentPageGroup() > 1)
				? new Page(getCorrectedCurrentPage(currentPage - pageGroupLength))
				: null;
	}
	
	protected Page getStepForward() {
		return (getCurrentPageGroup() < getPageGroupCount())
				? new Page(getCorrectedCurrentPage(currentPage + pageGroupLength))
				: null;
	}

	protected Set<Page> getPages() {
		Set<Page> pages = new LinkedHashSet<>();
		int firstPageOfCurrentPageGroup = getFirstPageOfCurrentPageGroup();
		int lastPage = getPageCount();
		for (int page = firstPageOfCurrentPageGroup;
				page < firstPageOfCurrentPageGroup + pageGroupLength; page++) {
			if (page <= lastPage) {
				pages.add((page == currentPage)
						? new Page(page, true)
						: new Page(page));
			}
		}
		return pages;
	}
	
	protected int getMaxResult(){
		return maxResult;
	}
	
	protected boolean isStepper() {
		return getPageGroupCount() > 1;
	}
	
	protected int getStartPosition() {
		return maxResult * (currentPage - 1) + 1;
	}

	private int getCorrectedCurrentPage(int currentPage) {
		if (currentPage <= 0) {
			return 1;
		}
		if (currentPage > getPageCount()) {
			return getPageCount();
		}
		return currentPage;
	}
	
}
