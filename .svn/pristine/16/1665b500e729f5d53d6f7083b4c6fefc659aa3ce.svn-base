package com.spring.vo;

import java.util.Random;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class EventVO {
	int eno, hno, rno;
	String image, url, pimage, hname;
	CommonsMultipartFile file;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		if(!file.getOriginalFilename().equals("")){
			String filename=file.getOriginalFilename();
			int idx= filename.lastIndexOf(".");
			String tmpext = filename.substring(idx);
			this.file = file;
			setPimage(Integer.toString(new Random().nextInt(100000000))+tmpext);
		}
	}
	
}
