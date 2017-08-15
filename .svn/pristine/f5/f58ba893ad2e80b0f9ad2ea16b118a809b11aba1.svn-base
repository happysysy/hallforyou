package com.spring.dao;

import java.sql.*;
import java.util.*;

import com.spring.vo.QnaVO;

public interface Hfu_QnaDAO {
	//qna 입력
	public int execInsert(QnaVO vo);
	//qna list 출력
	public ArrayList<QnaVO> execSelect();
	//qna pw 확인
	public Integer execSelectPw(QnaVO vo);
	//qna content 출력
	public String execSelectHno(String qno);
	public QnaVO execContent(String qno);
	public QnaVO execHnoContent(String qno);
	//qna 수정
	public int execUpdate(QnaVO vo);
	//qna 삭제
	public int execDelete(String qno);
	
	

	public ArrayList<QnaVO> execSelect2(String member_id);
}
