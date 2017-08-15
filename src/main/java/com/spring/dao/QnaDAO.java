package com.spring.dao;

import java.sql.*;
import java.util.*;
import com.spring.vo.QnaVO;

public interface QnaDAO {
	
	//qna list ���(halladmin)
	public ArrayList<QnaVO> execSelect(String admin_id);	
	
	//qna list ���
	public ArrayList<QnaVO> execAllSelect();	
	
	//qna content ���
	public QnaVO execContent(String qno);	
	//qna ����
	public int execUpdate(QnaVO vo);
	
	//qna answer update
	public int execAnswerUpdate(QnaVO vo);
	
	//qna delete
	public int execDelete(String qno);
	
}
