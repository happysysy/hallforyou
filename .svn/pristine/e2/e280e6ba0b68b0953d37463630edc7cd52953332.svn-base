package com.spring.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.AreaDAO;
import com.spring.dao.MyhallDAO;
import com.spring.vo.AreaVO;
import com.spring.vo.HallVO;
import com.spring.vo.MemberVO;

@Controller
public class Hfu_myhallController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("user/hfu_myhall.do")
	public ModelAndView hfu_myhall(HttpSession session){

		ModelAndView mv = new ModelAndView();
		MyhallDAO dao = sqlSession.getMapper(MyhallDAO.class);
		
		//회원 정보(추가정보) 불러오기
		String member_id=(String)session.getAttribute("member_id");	
		MemberVO vo = dao.execMemberContent(member_id);
		
		
		//홀 불러오기
		if(vo.getMenu()==null){
			vo.setMenu("0");
		}
		if(vo.getHtype()==null){
			vo.setHtype("0");
		}
		
		//지역넘기기(city, gu를 ano로) 
		AreaDAO areadao = sqlSession.getMapper(AreaDAO.class);
		AreaVO areavo = new AreaVO ();
		areavo.setCity(vo.getCity());
		areavo.setGu(vo.getGu());
		int ano= areadao.execSelectAno(areavo);
		vo.setAno(ano);
		
		//검색조건에 맞는 홀 불러오기
		ArrayList<HallVO> hallList = dao.execSelectHall(vo);
			
		mv.addObject("vo", vo);
		mv.addObject("hallList", hallList);
		mv.setViewName("user/hfu_myhall/hfu_myhall.jsp");
		return mv;
	}
}
