package com.spring.dao;

import java.util.ArrayList;
import com.spring.vo.EstimateVO;

public interface EstimateDAO {
	//htype의 부가정보(사용료, 가격, 음료)를 삽입할 때 필요한 메소드
	public void execInsertSelection(EstimateVO vo);
	public void execInsertMeal(EstimateVO vo);
	public void execInsertDrink(EstimateVO vo);
	public ArrayList<EstimateVO> execSelectSelection(String rannum);
	public ArrayList<EstimateVO> execSelectMeal(String rannum);
	public ArrayList<EstimateVO> execSelectDrink(String rannum);
	
	//typeno로 해당 홀타입정보, selection, meal, drink의 정보를 가져오기 위한 메소드
	public ArrayList<EstimateVO> execSelectSelectionByTypeno(String typeno);
	public ArrayList<EstimateVO> execSelectMealByTypeno(String typeno);
	public ArrayList<EstimateVO> execSelectDrinkByTypeno(String typeno);
	public EstimateVO execSelectHtypeByTypeno(String typeno);
	
	//halltype insert 시 필요한 메소드
	public void execInsertHtype(EstimateVO vo);
	public int execSelectTypeno(EstimateVO vo);
	public void execUpdateSelectionTypeno(EstimateVO vo);
	public void execUpdateMealTypeno(EstimateVO vo);
	public void execUpdateDrinkTypeno(EstimateVO vo);
	
	public ArrayList<EstimateVO> execSelectHtype(String hno);//해당 hno가 가지고 있는 halltype을 모두 가져온다.
	
	//update화면에서 selection, drink, meal 추가하기
	public void execUpdateHtype(EstimateVO vo);
	public void execUpdateInsertSelection(EstimateVO vo);
	public void execUpdateInsertDrink(EstimateVO vo);
	public void execUpdateInsertMeal(EstimateVO vo);
	public void execUpdateDeleteSelection(String sno);
	public void execUpdateDeleteMeal(String mno);
	public void execUpdateDeleteDrink(String dno);
	public void execDeleteHtype(String typeno);
	
	//상담 예약 신청시 필요한 typename 불러오기
	public ArrayList<EstimateVO> execHalltypeContent(String hno);
}
