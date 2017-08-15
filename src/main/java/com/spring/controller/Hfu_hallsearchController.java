package com.spring.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;





import com.spring.dao.AreaDAO;
import com.spring.dao.SearchDAO;
import com.spring.vo.AreaVO;
import com.spring.vo.HallVO;
import com.spring.vo.SearchVO;

@Controller
public class Hfu_hallsearchController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("user/hfu_hallsearch.do")
	public ModelAndView hfu_hallsearch(){
		ModelAndView mv = new ModelAndView();
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		AreaDAO areadao = sqlSession.getMapper(AreaDAO.class);
		ArrayList<SearchVO> SearchList = dao.execSelect();
		for(SearchVO vo:SearchList){
			AreaVO area = areadao.execSelectByAno(vo.getAno());
			vo.setCity(area.getCity());
			vo.setGu(area.getGu());
		}
		
		mv.addObject("SearchList", SearchList);
		mv.setViewName("user/hfu_hallinfo/hfu_hallsearch.jsp");
		return mv;
	}
	@RequestMapping("/area.do")
	@ResponseBody
	public JSONArray addressCall(String id, String option){
		JSONArray addrList = new JSONArray();
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		ArrayList<AreaVO> list = dao.getArea(id, option);
		
		for(AreaVO vo : list){
			JSONObject jo = new JSONObject();
			jo.put("city", vo.getCity());
			jo.put("gu", vo.getGu());
			
			addrList.add(jo);		
		}
		
		return addrList;
	}
	@ResponseBody
	@RequestMapping(value="user/hfu_search_check.do", method=RequestMethod.POST)
	public JSONArray hfu_search_check(SearchVO vo){
		JSONArray jlist = new JSONArray();
		SearchDAO dao = sqlSession.getMapper(SearchDAO.class);
		
		//지역넘기기(city, gu를 ano로) 
		AreaDAO areadao = sqlSession.getMapper(AreaDAO.class);
		AreaVO areavo = new AreaVO ();
		areavo.setCity(vo.getCity());
		areavo.setGu(vo.getGu());
		int ano= areadao.execSelectAno(areavo);
		vo.setAno(ano);
		
		//홀타입선택
		ArrayList<String> hlist = vo.getCheckhlist();
		for(String s: hlist){
			if(s.equals("일반홀"))
				vo.setHall("%일반홀%");
			else if(s.equals("컨벤션"))
				vo.setConvention("%컨벤션%");
			else if(s.equals("호텔"))
				vo.setHotel("%호텔%");
			else if(s.equals("야외"))
				vo.setOutside("%야외%");
			else if(s.equals("전통"))
				vo.setTraditional("%전통%");
			else if(s.equals("전통"))
				vo.setReligion("%종교%");
			else if(s.equals("하우스"))
				vo.setHouse("%하우스%");
		}
		if(vo.getHall()==null)
			vo.setHall("null");
		if(vo.getConvention()==null)
			vo.setConvention("null");
		if(vo.getHotel()==null)
			vo.setHotel("null");
		if(vo.getOutside()==null)
			vo.setOutside("null");
		if(vo.getTraditional()==null)
			vo.setTraditional("null");
		if(vo.getReligion()==null)
			vo.setReligion("null");
		if(vo.getHouse()==null)
			vo.setHouse("null");
		
		//메뉴선택
		ArrayList<String> mlist=vo.getCheckmlist();
		for(String s :mlist){
			if(s.equals("한식"))
				vo.setKorean("%한식%");
			else if(s.equals("중식"))
				vo.setChinese("%중식%");
			else if(s.equals("일식"))
				vo.setJapanese("%일식%");
			else if(s.equals("양식"))
				vo.setWestern("%양식%");
			else if(s.equals("뷔페"))
				vo.setBuffet("%뷔페%");
		}
		if(vo.getKorean()==null)
			vo.setKorean("null");	
		if(vo.getChinese()==null)
			vo.setChinese("null");		
		if(vo.getJapanese()==null)
			vo.setJapanese("null");		
		if(vo.getWestern()==null)
			vo.setWestern("null");		
		if(vo.getBuffet()==null)
			vo.setBuffet("null");
		
		
		ArrayList<SearchVO> halllist = dao.execSelectHall(vo);
		for(SearchVO searchvo: halllist){
			JSONObject jo = new JSONObject();
			jo.put("hno", searchvo.getHno());
			jo.put("hname", searchvo.getHname());
			jo.put("city", searchvo.getCity());
			jo.put("gu", searchvo.getGu());
			jo.put("wguest", searchvo.getWguest());
			jo.put("minprice", searchvo.getMinprice());
			jo.put("maxprice", searchvo.getMaxprice());
			jo.put("mlist", searchvo.getMlist());
			jo.put("hlist", searchvo.getHlist());
			jo.put("pthumbnail", searchvo.getPthumbnail());
			jo.put("hcomment", searchvo.getHcomment());
			jlist.add(jo);	
			
		}
		for(int i=0;i<jlist.size();i++){
			jlist.getJSONObject(i);
		}	
		return jlist;	
	}
	

}
