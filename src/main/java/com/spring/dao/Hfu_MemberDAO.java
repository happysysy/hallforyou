
package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.AreaVO;
import com.spring.vo.HallVO;
import com.spring.vo.Hfu_MemberVO;
import com.spring.vo.MemberVO;

public interface Hfu_MemberDAO {
		
	public int execInsert(Hfu_MemberVO vo);
	public int execAdminInsert(Hfu_MemberVO vo);
	public int getIdCheck(String id);
	public int getIdCheck2(String id);
	public int getPassCheck(String id, String pass);
	public int getPassCheck2(String id, String pass);
	public ArrayList<AreaVO> getJoinArea(String id, String option);
	public int execSelect(Hfu_MemberVO vo);
	public void execUpdate(Hfu_MemberVO vo);
	public void execIdDelete(Hfu_MemberVO vo);
	public void execQnaDelete(Hfu_MemberVO vo);
	public ArrayList<Hfu_MemberVO> execMemberWish(String member_id);
}
