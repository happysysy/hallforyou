package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.AreaVO;
import com.spring.vo.Hfu_MemberVO;
import com.spring.vo.MemberVO;

public interface idpwDAO {
		
	public int execSelect(Hfu_MemberVO vo);
	public int execSelect2(Hfu_MemberVO vo);
	public String execId(Hfu_MemberVO vo);
	public String execPw(Hfu_MemberVO vo);
}
