package com.hwaboon.myapp.item.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ItemVO {
	private int itemNo;
	private int itemPrice;
	private Date itemRegDate;
	private Date itemRegupDate;
	private String itemSubject;
	private String itemName;
	private String itemInformation;
	private String itemCompany;
	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private MultipartFile file;
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Date getItemRegDate() {
		return itemRegDate;
	}
	public void setItemRegDate(Date itemRegDate) {
		this.itemRegDate = itemRegDate;
	}
	public Date getItemRegupDate() {
		return itemRegupDate;
	}
	public void setItemRegupDate(Date itemRegupDate) {
		this.itemRegupDate = itemRegupDate;
	}
	public String getItemSubject() {
		return itemSubject;
	}
	public void setItemSubject(String itemSubject) {
		this.itemSubject = itemSubject;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemInformation() {
		return itemInformation;
	}
	public void setItemInformation(String itemInformation) {
		this.itemInformation = itemInformation;
	}
	public String getItemCompany() {
		return itemCompany;
	}
	public void setItemCompany(String itemCompany) {
		this.itemCompany = itemCompany;
	}
	@Override
	public String toString() {
		return "ItemVO [itemNo=" + itemNo + ", itemPrice=" + itemPrice + ", itemRegDate=" + itemRegDate
				+ ", itemRegupDate=" + itemRegupDate + ", itemSubject=" + itemSubject + ", itemName=" + itemName
				+ ", itemInformation=" + itemInformation + ", itemCompany=" + itemCompany + ", fileId=" + fileId
				+ ", fileName=" + fileName + ", fileSize=" + fileSize + ", fileContentType=" + fileContentType
				+ ", file=" + file + "]";
	}
	
	
	
	
	
	
	
}
