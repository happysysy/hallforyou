package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.AreaVO;
import com.spring.vo.EventVO;

public interface EventDAO {
	public ArrayList<EventVO> execSelect(int startCount, int endCount);
	public EventVO execSelectByNo(int eno);
	public void execInsert(EventVO vo);
	public void execUpdate(EventVO vo);
	public void execUpdateFilenull(EventVO vo);
	public void execDelete(int eno);
	public ArrayList<EventVO> getEventList();
	public int execPageCount();
}
