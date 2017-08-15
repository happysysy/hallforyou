package com.spring.dao;


import java.util.ArrayList;

import com.spring.vo.Hfu_HalldetailVO;
import com.spring.vo.ImageVO;
public interface Hfu_HalldetailDAO {
	//hall detail 불러오기
	public Hfu_HalldetailVO execContent(String hno);
	
	//캘린더 예약현황 불러오기
	public ArrayList<Hfu_HalldetailVO> execBookSelect(String hno);
	
	//qna form에서 홀이름 select-option으로 불러오기
	public ArrayList<Hfu_HalldetailVO> execHname();
	
	//wishlist
	public int execWishlistInsert(Hfu_HalldetailVO vo);
	public int getWishlistCheck(Hfu_HalldetailVO vo);
	
	//image
	public ArrayList<ImageVO> execImageSelect(String hno);
}
