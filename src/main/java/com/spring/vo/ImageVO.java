package com.spring.vo;

import java.util.Random;

public class ImageVO {
	int fno, hno;
	String fname, pfname;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		int idx= fname.lastIndexOf(".");
		String tmpext = fname.substring(idx);
		setPfname(Integer.toString(new Random().nextInt(100000000))+tmpext);

		this.fname = fname;
	}
	public String getPfname() {
		return pfname;
	}
	public void setPfname(String pfname) {
		this.pfname = pfname;
	}
	
	
}
