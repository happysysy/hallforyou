package com.spring.dao;

import java.sql.*;
import java.util.*;
import com.spring.vo.QnaVO;

public interface QnaDAO {
	
	//qna list 출력(halladmin)
	public ArrayList<QnaVO> execSelect(String admin_id);	
	
	//qna list 출력
	public ArrayList<QnaVO> execAllSelect();	
	
	//qna content 출력
	public QnaVO execContent(String qno);	
	//qna 수정
	public int execUpdate(QnaVO vo);
	
	//qna answer update
	public int execAnswerUpdate(QnaVO vo);
	
	//qna delete
	public int execDelete(String qno);
	
}
