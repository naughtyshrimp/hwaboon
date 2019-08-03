package com.hwaboon.myapp.item.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hwaboon.myapp.item.commons.paging.Criteria;
import com.hwaboon.myapp.item.commons.paging.PageCreator;
import com.hwaboon.myapp.item.commons.paging.SearchCriteria;
import com.hwaboon.myapp.item.model.ItemVO;
import com.hwaboon.myapp.item.model.ReviewBoardUploadFileVO;
import com.hwaboon.myapp.item.service.IItemService;


@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	IItemService service;
	
	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public String productdetail(Model model, @RequestParam("itemNo") int itemNo, SearchCriteria cri) throws Exception{
			PageCreator pc = new PageCreator();
			pc.setCriteria(cri);
			model.addAttribute("item", service.itemNo(itemNo));
			model.addAttribute("PageCreator", pc);
		return "/boot/product-detail";
	}
	
	@RequestMapping(value="/itemlist")
	public String itemListAll(Model model, SearchCriteria cri, String bin) throws Exception{
			bin = "itemlist";
			PageCreator pc = new PageCreator();
			pc.setCriteria(cri);
			pc.setitemTotalCount(service.itemcount(cri));
			model.addAttribute("PageCreator", pc);
			model.addAttribute("itemlist", service.itemlistAll(cri));
			model.addAttribute("is", bin);
		return "/boot/product";
	}
	
	@RequestMapping(value = "/lotion")
	public String lotion(Model model, @RequestParam String itemSubject, SearchCriteria cri) throws Exception{
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setitemTotalCount(service.lotioncount(itemSubject));
		model.addAttribute("itemlist", service.lotion(itemSubject, cri));
		model.addAttribute("is", itemSubject.toLowerCase());
		model.addAttribute("PageCreator", pc);
		return "/boot/product";
	}
	
	@RequestMapping(value = "/skin")
	public String skin(Model model, @RequestParam String itemSubject, SearchCriteria cri) throws Exception{
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setitemTotalCount(service.skincount(itemSubject));
		model.addAttribute("itemlist", service.skin(itemSubject, cri));
		model.addAttribute("is", itemSubject.toLowerCase());
		model.addAttribute("PageCreator", pc);
		return "/boot/product";
	}
	
	@RequestMapping(value = "/tonner")
	public String tonner(Model model, @RequestParam String itemSubject, SearchCriteria cri) throws Exception{
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setitemTotalCount(service.tonnercount(itemSubject));
		model.addAttribute("itemlist", service.tonner(itemSubject, cri));
		model.addAttribute("is", itemSubject.toLowerCase());
		model.addAttribute("PageCreator", pc);
		return "/boot/product";
	}
	
	@RequestMapping(value = "/suncream")
	public String suncream(Model model, @RequestParam String itemSubject, SearchCriteria cri) throws Exception{
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setitemTotalCount(service.suncreamcount(itemSubject));
		model.addAttribute("itemlist", service.suncream(itemSubject, cri));
		model.addAttribute("is", itemSubject.toLowerCase());
		model.addAttribute("PageCreator", pc);
		return "/boot/product";
	}
	
	@RequestMapping(value = "/cushion")
	public String cushion(Model model, @RequestParam String itemSubject, SearchCriteria cri) throws Exception{
		PageCreator pc = new PageCreator();
		pc.setCriteria(cri);
		pc.setitemTotalCount(service.cushioncount(itemSubject));
		model.addAttribute("itemlist", service.cushion(itemSubject, cri));
		model.addAttribute("is", itemSubject.toLowerCase());
		model.addAttribute("PageCreator", pc);
		return "/boot/product";
	}
	
	

	
	//상품 등록
	@RequestMapping(value="/iteminsert", method = RequestMethod.GET)
	public String insert() {
		
		return "/item/iteminsert";
	}
	
	
	
	
	@RequestMapping(value="/iteminsert", method = RequestMethod.POST)
	public String insert(ItemVO item) throws Exception {
		
		MultipartFile mfile = item.getFile();
		
		if(mfile != null && !mfile.isEmpty()) {
			//파일이 업로드된 상황
			ReviewBoardUploadFileVO file = new ReviewBoardUploadFileVO();
			file.setFileName(mfile.getOriginalFilename());
			file.setFileSize(mfile.getSize());
			file.setFileData(mfile.getBytes());
			file.setFileContentType(mfile.getContentType());
			System.out.println("file: " + file);
			service.insertFileData(item, file);
		}else {
			//게시물만 업로드된 상황
			service.iteminsert(item);
		}
		return "redirect:/item/itemlist";
	}
	
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(Model model, Criteria cri, @RequestParam("itemNo") int itemNo) throws Exception{
			
			PageCreator pc = new PageCreator();
			pc.setCriteria(cri);
			model.addAttribute("item", service.itemselect(itemNo));
			model.addAttribute("PageCreator", pc);
		return "/item/content";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model, SearchCriteria cri, @RequestParam("itemNo") int itemNo) throws Exception{
			PageCreator pc = new PageCreator();
			pc.setCriteria(cri);
			pc.setitemTotalCount(service.itemcount(cri));
			model.addAttribute("PageCreator", pc);
			model.addAttribute("item", service.itemselect(itemNo));
		return "/item/modify";
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, Criteria cri, ItemVO item) throws Exception{
			
			model.addAttribute("cri", cri);
			service.itemupdate(item);
		return "redirect:/item/itemlist";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, int itemNo, SearchCriteria cri) throws Exception{
			model.addAttribute("cri", cri);
			service.itemdelete(itemNo);
		return "redirect:/item/itemlist";
	}
	
	@RequestMapping(value= "/product",method = RequestMethod.GET)
	public String product() throws Exception{
			
		return "/boot/product";
	}
	
	
	
	
	
	
	
	
}
