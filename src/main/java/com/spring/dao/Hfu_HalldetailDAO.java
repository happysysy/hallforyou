package com.spring.dao;


import java.util.ArrayList;

import com.spring.vo.Hfu_HalldetailVO;
import com.spring.vo.ImageVO;
public interface Hfu_HalldetailDAO {
	//hall detail �ҷ�����
	public Hfu_HalldetailVO execContent(String hno);
	
	//Ķ���� ������Ȳ �ҷ�����
	public ArrayList<Hfu_HalldetailVO> execBookSelect(String hno);
	
	//qna form���� Ȧ�̸� select-option���� �ҷ�����
	public ArrayList<Hfu_HalldetailVO> execHname();
	
	//wishlist
	public int execWishlistInsert(Hfu_HalldetailVO vo);
	public int getWishlistCheck(Hfu_HalldetailVO vo);
	
	//image
	public ArrayList<ImageVO> execImageSelect(String hno);
}
