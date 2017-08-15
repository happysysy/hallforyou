package com.spring.dao;
import com.spring.vo.HallVO;
import com.spring.vo.ImageVO;

import java.util.ArrayList;
public interface HallDAO {
	public String execSelectByMemberid(String admin_id);
	public void execInsert(HallVO vo);
	public HallVO execSelectByNo(String hno);
	public void execUpdate(HallVO vo);
	public void execDelete(String hno);
	public void execMapUpdate(HallVO vo);
	public void execGethall(HallVO vo);
	public void execDeleteHall(String admin_id);
	public void execInsertImage(ImageVO vo);
	public ArrayList<ImageVO> execSelectImage(String hno);
	public void execDeleteImage(String fno);
	public void execDeleteImageByHno(String hno);
	
	public int execPageCount();
	public ArrayList<HallVO> execSelect(int startcount, int endcount);
	public void execUpdateAdminByHno(String hno);
	
	public ArrayList<HallVO> execbhall();
}
