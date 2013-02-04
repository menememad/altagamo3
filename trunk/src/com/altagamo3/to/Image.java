package com.altagamo3.to;

import java.io.File;
import java.io.Serializable;

public class Image implements Serializable{

	private static final long serialVersionUID = -257110176756842139L;
	private File file;
	private String contentType;
	private String fileName;
	private byte[] fileBytes;
	private float fileSize;
	public Image(){}
	public Image(File imageFile, String imageContentType){
		file = imageFile;
		contentType = imageContentType;
	}
	public Image(File imageFile, String imageFileName, String imageContentType){
		file = imageFile;
		fileName = imageFileName;
		contentType = imageContentType;
	}

	public File getFile() {
		return file;
	}
	public String getContentType() {
		return contentType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public byte[] getFileBytes() {
		return fileBytes;
	}
	public void setFileBytes(byte[] fileBytes) {
		this.fileBytes = fileBytes;
	}
	public float getFileSize() {
		return fileSize;
	}
	public void setFileSize(float fileSize) {
		this.fileSize = fileSize;
	}
	
}
