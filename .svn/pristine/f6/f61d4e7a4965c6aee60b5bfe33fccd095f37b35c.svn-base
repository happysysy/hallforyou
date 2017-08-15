package com.spring.dao;

import java.sql.*;
import java.util.*;
import com.spring.vo.BookVO;
import com.spring.vo.BookokVO;

public interface BookDAO {

	//book list 출력(halldamin)
	public ArrayList<BookVO> execSelect(String admin_id);
	
	//book list 출력(mainadmin)
	public ArrayList<BookVO> execAllSelect();
	
	//book content 출력
	public BookVO execContent(String bno);
	
	//book_ok insert
	public int execBookInsert(BookVO vo);
	
	//book_check update
	public int execCheckUpdate(BookVO vo);
	
	//book complete 출력
	public BookVO execComplete(String bno);
	
	//book list delete
	public int execListDelete(String bno);
	
	//book ok delete
	public int execBookDelete(String bno);
	
	//public ArrayList<BookVO> getHtype(String id, String option);
	
	//userpage book insert
	public int execConsultInsert(BookVO vo);
	
	//new book insert
	public int execNewBookInsert(BookVO vo);
	
	//hall bcount update
	public int execBcountUpdate(BookVO vo);
	
	//mypage 예약 확인
	public BookokVO execSelect2(String member_id);
	public int execSelect3(String member_id);
}
