package com.hwaboon.myapp.item.model;

import java.util.Arrays;

public class ReviewBoardUploadFileVO {
	private int fileId;
	private int itemNo;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private byte[] fileData;
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	@Override
	public String toString() {
		return "ReviewBoardUploadFileVO [fileId=" + fileId + ", itemNo=" + itemNo + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", fileContentType=" + fileContentType + ", fileData="
				+ Arrays.toString(fileData) + "]";
	}
	
}
