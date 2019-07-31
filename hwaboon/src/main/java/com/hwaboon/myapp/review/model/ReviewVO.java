package com.hwaboon.myapp.review.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int reviewNo;
	private int viewCnt;
	private int likeCnt;
	private String title;
	private String writer;
	private String content;
	private Date regDate ;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", viewCnt=" + viewCnt + ", likeCnt=" + likeCnt + ", title=" + title
				+ ", writer=" + writer + ", content=" + content + ", regDate=" + regDate + "]";
	}
	
	
	
}
