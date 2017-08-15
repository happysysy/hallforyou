package com.spring.vo;

public class EstimateVO {
	
	//halltype테이블
	String rannum;//estimate insert페이지 내에서 meal, drink, selection을 저장시에 일단 설정해줄 임의의 typeno
	int typeno, hno, wguest;
	String typename, wtype, tinterval;
	
	//selection테이블
	int sno, sprice;
	String sname, sref, scontent;
	
	String drink;
	int dno,drinkprice;
	
	//meal테이블
	int mealprice;
	String mno, mealtype, mealcontent;
	
	
	
	public String getRannum() {
		return rannum;
	}
	public void setRannum(String rannum) {
		this.rannum = rannum;
	}
	public int getTypeno() {
		return typeno;
	}
	public void setTypeno(int typeno) {
		this.typeno = typeno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getWguest() {
		return wguest;
	}
	public void setWguest(int wguest) {
		this.wguest = wguest;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getWtype() {
		return wtype;
	}
	public void setWtype(String wtype) {
		this.wtype = wtype;
	}
	public String getTinterval() {
		return tinterval;
	}
	public void setTinterval(String tinterval) {
		this.tinterval = tinterval;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public String getSref() {
		return sref;
	}
	public void setSref(String sref) {
		this.sref = sref;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public int getMealprice() {
		return mealprice;
	}
	public void setMealprice(int mealprice) {
		this.mealprice = mealprice;
	}
	public String getMealtype() {
		return mealtype;
	}
	public void setMealtype(String mealtype) {
		this.mealtype = mealtype;
	}
	public String getMealcontent() {
		return mealcontent;
	}
	public void setMealcontent(String mealcontent) {
		this.mealcontent = mealcontent;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public int getDrinkprice() {
		return drinkprice;
	}
	public void setDrinkprice(int drinkprice) {
		this.drinkprice = drinkprice;
	}
	
	
	
}
