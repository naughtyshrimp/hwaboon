package com.hwaboon.myapp.commons.paging;

public class Criteria {
	
	private int page;
	private int countPerPage;
	
	public Criteria() {
		this.page = 1;
		this.countPerPage = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		if(countPerPage <= 0 || countPerPage > 100) {
			this.countPerPage = 10;
			return;
		}
		this.countPerPage = countPerPage;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", countPerPage=" + countPerPage + "]";
	}
	
	public int getPageStart() {
		return (this.page - 1) * countPerPage;
	}

}
