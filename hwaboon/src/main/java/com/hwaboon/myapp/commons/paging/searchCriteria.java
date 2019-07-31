package com.hwaboon.myapp.commons.paging;

public class searchCriteria extends Criteria {
	
	private String condition;
	private String keyword;
	
	public searchCriteria() {
		super();
		this.condition = "";
		this.keyword = "";
	}
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "searchCriteria [condition=" + condition + ", keyword=" + keyword + "]";
	}
	
}