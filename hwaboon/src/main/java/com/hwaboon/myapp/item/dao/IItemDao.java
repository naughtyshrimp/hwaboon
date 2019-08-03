package com.hwaboon.myapp.item.dao;

import java.util.List;
import java.util.Map;

import com.hwaboon.myapp.item.commons.paging.SearchCriteria;
import com.hwaboon.myapp.item.model.ItemVO;
import com.hwaboon.myapp.item.model.ReviewBoardUploadFileVO;



public interface IItemDao {
	//아이템 입력하기
	void iteminsert(ItemVO item) throws Exception;
	
	//아이템 정보 수정하기
	void itemupdate(ItemVO item) throws Exception;
	
	//해당 아이템 정보 불러오기
	ItemVO itemselect(int itemNo) throws Exception;
	
	//총 게시물 목록 or 검색된 총 게시물 목록 불러오기
	List<ItemVO> itemlistAll(SearchCriteria cri) throws Exception;
	
	//총 게시물 or 검색된 총 게시물 갯수 불러오기
	int itemcount(SearchCriteria cri) throws Exception;
	
	//아이템 삭제
	void itemdelete(int itemNo) throws Exception;
	
	//이미지 첨부 기능
	void insertFileData(ItemVO item, ReviewBoardUploadFileVO file) throws Exception;
	
	//방금 등록한 최대 itemNo 넘버 구해오기
	int selectMaxItemNo();
	
	//이미지 파일 등록
	void insertFileData(ReviewBoardUploadFileVO file);
	
	//이미지정보를 불러오기 기능
	ReviewBoardUploadFileVO getFile(int fileId);
	
	ItemVO itemNo(int itemNo) throws Exception;
	
	int lotioncount(String itemSubject) throws Exception;
	List<ItemVO> lotion(Map<String, Object> datas) throws Exception;
	
	int cushioncount(String itemSubject) throws Exception;
	List<ItemVO> cushion(Map<String, Object> datas) throws Exception;
	
	int tonnercount(String itemSubject) throws Exception;
	List<ItemVO> tonner(Map<String, Object> datas) throws Exception;
	
	int suncreamcount(String itemSubject) throws Exception;
	List<ItemVO> suncream(Map<String, Object> datas) throws Exception;
	
	int skincount(String itemSubject) throws Exception;
	List<ItemVO> skin(Map<String, Object> datas) throws Exception;
	
	
	
	
	
	
	
	

}
