package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.MemberVO;

public interface MemberDAO {
	
	//member list ���
	public ArrayList<MemberVO> execSelect();
	
	//member content ���
	public MemberVO execMemberContent(String id);
	
	public MemberVO execNonAdminContent(String id);
	
	public MemberVO execAdminContent(String id);
	
	public int execSubmit(MemberVO vo); 
	
	public String execSelectHno(String id);
	
	public String execSelectHname(String id);
	
}
