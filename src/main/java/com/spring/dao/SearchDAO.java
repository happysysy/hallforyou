package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.AreaVO;
import com.spring.vo.HallVO;
import com.spring.vo.SearchVO;

public interface SearchDAO {
	public ArrayList<AreaVO> getArea(String id, String option);
	public ArrayList<SearchVO> execSelect();
	public ArrayList<SearchVO> execSelectHall(SearchVO vo);
}
