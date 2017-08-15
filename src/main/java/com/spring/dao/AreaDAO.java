package com.spring.dao;

import java.util.ArrayList;
import com.spring.vo.AreaVO;

public interface AreaDAO {
	public ArrayList<String> execSelectCity();
	public ArrayList<String> execSelectGu(String city);
	public int execSelectAno(AreaVO vo);
	public AreaVO execSelectByAno(int ano);
	public ArrayList<AreaVO> getAddressCall(String id, String option);
}
