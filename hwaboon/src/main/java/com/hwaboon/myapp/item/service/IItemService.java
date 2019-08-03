package com.hwaboon.myapp.item.service;

import java.util.List;
import java.util.Map;

import com.hwaboon.myapp.item.commons.paging.Criteria;
import com.hwaboon.myapp.item.commons.paging.SearchCriteria;
import com.hwaboon.myapp.item.model.ItemVO;
import com.hwaboon.myapp.item.model.ReviewBoardUploadFileVO;

public interface IItemService {
	
	void iteminsert(ItemVO item) throws Exception;
	
	void itemupdate(ItemVO item) throws Exception;
	
	ItemVO itemselect(int itemNo) throws Exception;
	
	List<ItemVO> itemlistAll(SearchCriteria cri) throws Exception;
	
	int itemcount(SearchCriteria cri) throws Exception;
	
	void itemdelete(int itemNo) throws Exception;
	
	void insertFileData(ItemVO item, ReviewBoardUploadFileVO file) throws Exception;
	
	ReviewBoardUploadFileVO getFile(int fileId);

	ItemVO itemNo(int itemNo) throws Exception;
	
	int lotioncount(String itemSubject) throws Exception;
	List<ItemVO> lotion(String itemSubject, SearchCriteria cri) throws Exception;
	
	int cushioncount(String itemSubject) throws Exception;
	List<ItemVO> cushion(String itemSubject, SearchCriteria cri) throws Exception;
	
	int tonnercount(String itemSubject) throws Exception;
	List<ItemVO> tonner(String itemSubject, SearchCriteria cri) throws Exception;
	
	int suncreamcount(String itemSubject) throws Exception;
	List<ItemVO> suncream(String itemSubject, SearchCriteria cri) throws Exception;
	
	int skincount(String itemSubject) throws Exception;
	List<ItemVO> skin(String itemSubject, SearchCriteria cri) throws Exception;
}
