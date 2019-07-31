package com.hwaboon.myapp.commons.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageCreator {
	
	private Criteria criteria;
	private int articleTotalCount;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private final int displayPageNum = 10;
	
	public String makePageURI(int page) {
		UriComponents ucp = UriComponentsBuilder.newInstance()
							.queryParam("page", page)
							.queryParam("countPerPage", criteria.getCountPerPage())
							.build();
		return ucp.toUriString();
	}
		
	public String makeSearchURI(int page) {
		UriComponents ucp2 = UriComponentsBuilder.newInstance()
							.queryParam("page", page)
							.queryParam("countPerPage", criteria.getCountPerPage())
							.queryParam("condition", ((searchCriteria)criteria).getCondition())
							.queryParam("keyword", ((searchCriteria)criteria).getKeyword())
							.build();
		return ucp2.toUriString();
	}
	
	private void calcDataOfPage() {
		endPage = (int)(Math.ceil(criteria.getPage() / (double)displayPageNum) * displayPageNum);		
		beginPage = (endPage - displayPageNum) + 1;
		int temp = (int)(Math.ceil(articleTotalCount / (double)criteria.getCountPerPage()));
		if(endPage > temp) {
			endPage = temp;
		}
		
		prev = (beginPage == 1) ? false : true;
		next = (endPage == temp) ? false : true;
		// next = (articleTotalCount <= (endPage * criteria.getCountPerPage())) ? false : true;
	}
	
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	public int getArticleTotalCount() {
		return articleTotalCount;
	}
	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	@Override
	public String toString() {
		return "PageCreator [criteria=" + criteria + ", articleTotalCount=" + articleTotalCount + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
	

}
