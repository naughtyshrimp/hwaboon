package com.hwaboon.myapp.item.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hwaboon.myapp.item.commons.paging.SearchCriteria;
import com.hwaboon.myapp.item.dao.IItemDao;
import com.hwaboon.myapp.item.model.ItemVO;
import com.hwaboon.myapp.item.model.ReviewBoardUploadFileVO;


@Service
public class ItemService implements IItemService{

	@Autowired
	IItemDao dao;

	@Override
	public void iteminsert(ItemVO item) throws Exception {
		dao.iteminsert(item);
	}
	

	@Override
	public void itemupdate(ItemVO item) throws Exception {
		dao.itemupdate(item);
	}

	@Override
	public ItemVO itemselect(int itemNo) throws Exception {
		return dao.itemselect(itemNo);
	}

	@Override
	public List<ItemVO> itemlistAll(SearchCriteria cri) throws Exception {
		return dao.itemlistAll(cri);
	}

	@Override
	public int itemcount(SearchCriteria cri) throws Exception {
		return dao.itemcount(cri);
	}

	@Override
	public void itemdelete(int itemNo) throws Exception {
		dao.itemdelete(itemNo);
	}

	@Transactional
	@Override
	public void insertFileData(ItemVO item, ReviewBoardUploadFileVO file) throws Exception {
		dao.iteminsert(item);
		if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
			file.setItemNo(dao.selectMaxItemNo());
			dao.insertFileData(file);
		}
	}

	@Override
	public ReviewBoardUploadFileVO getFile(int fileId) {
		return dao.getFile(fileId);
	}

	@Override
	public ItemVO itemNo(int itemNo) throws Exception {
		return dao.itemNo(itemNo);
		
		
	}

	@Override
	public int lotioncount(String itemSubject) throws Exception {
		return dao.lotioncount(itemSubject);
	}

	@Override
	public List<ItemVO> lotion(String itemSubject, SearchCriteria cri) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("itemSubject", itemSubject);
		datas.put("cri", cri);
		return dao.lotion(datas);
	}

	@Override
	public int cushioncount(String itemSubject) throws Exception {
		return dao.cushioncount(itemSubject);
	}

	@Override
	public List<ItemVO> cushion(String itemSubject, SearchCriteria cri) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("itemSubject", itemSubject);
		datas.put("cri", cri);
		return dao.cushion(datas);
	}

	@Override
	public int tonnercount(String itemSubject) throws Exception {
		return dao.tonnercount(itemSubject);
	}

	@Override
	public List<ItemVO> tonner(String itemSubject, SearchCriteria cri) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("itemSubject", itemSubject);
		datas.put("cri", cri);
		return dao.tonner(datas);
	}

	@Override
	public int suncreamcount(String itemSubject) throws Exception {
		return dao.suncreamcount(itemSubject);
	}

	@Override
	public List<ItemVO> suncream(String itemSubject, SearchCriteria cri) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("itemSubject", itemSubject);
		datas.put("cri", cri);
		return dao.suncream(datas);
	}

	@Override
	public int skincount(String itemSubject) throws Exception {
		return dao.skincount(itemSubject);
	}

	@Override
	public List<ItemVO> skin(String itemSubject, SearchCriteria cri) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("itemSubject", itemSubject);
		datas.put("cri", cri);
		return dao.skin(datas);
	}

	
	

	







	

	
	
}
