package com.spring.vo;

import java.util.Random;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HallVO {
	int rno, hno, ano, avgscore, bcount;
	String hname, admin_id, address, hlist, mlist, mprice, tel, guest, wguest, hcomment, mealprice, minprice, maxprice, hurl;
	String thumbnail, hmap, pthumbnail;
	String city, gu;
	CommonsMultipartFile file;//홀관리자가 thumbnail로 올린 실제파일
	CommonsMultipartFile imageArray[];
	
	public String getWguest() {
		return wguest;
	}
	public String getMealprice() {
		return mealprice;
	}
	public void setMealprice(String mealprice) {
		this.mealprice = mealprice;
	}
	public void setWguest(String wguest) {
		this.wguest = wguest;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getAvgscore() {
		return avgscore;
	}
	public void setAvgscore(int avgscore) {
		this.avgscore = avgscore;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHlist() {
		return hlist;
	}
	public void setHlist(String hlist) {
		this.hlist = hlist;
	}
	public String getMlist() {
		return mlist;
	}
	public void setMlist(String mlist) {
		this.mlist = mlist;
	}
	public String getMprice() {
		return mprice;
	}
	public void setMprice(String mprice) {
		this.mprice = mprice;
	}
	public String getMinprice() {
		return minprice;
	}
	public void setMinprice(String minprice) {
		this.minprice = minprice;
	}
	public String getMaxprice() {
		return maxprice;
	}
	public void setMaxprice(String maxprice) {
		this.maxprice = maxprice;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGuest() {
		return guest;
	}
	public void setGuest(String guest) {
		this.guest = guest;
	}
	public String getHcomment() {
		return hcomment;
	}
	public void setHcomment(String hcomment) {
		this.hcomment = hcomment;
	}
	
	public String getHmap() {
		return hmap;
	}
	public void setHmap(String hmap) {
		this.hmap = hmap;
	}
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getPthumbnail() {
		return pthumbnail;
	}
	public void setPthumbnail(String pthumbnail) {
		this.pthumbnail = pthumbnail;
	}
	
	public String getHurl() {
		return hurl;
	}
	public void setHurl(String hurl) {
		this.hurl = hurl;
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
			setPthumbnail(Integer.toString(new Random().nextInt(100000000))+tmpext);
		}
	}
	public CommonsMultipartFile[] getImageArray() {
		return imageArray;
	}
	public void setImageArray(CommonsMultipartFile[] imageArray) {
		this.imageArray = imageArray;
	}
	
	

}
