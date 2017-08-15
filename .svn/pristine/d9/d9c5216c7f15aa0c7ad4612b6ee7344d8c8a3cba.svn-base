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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.EventDAO;
import com.spring.dao.Hfu_MemberDAO;
import com.spring.vo.AreaVO;
import com.spring.vo.EventVO;

@Controller
public class Hfu_eventController {
	
	@Autowired
	 private SqlSessionTemplate sqlSession;

	@RequestMapping("user/hfu_event.do")
	public ModelAndView hfu_event(EventVO vo){
		
		ModelAndView mv = new ModelAndView();
		EventDAO dao = sqlSession.getMapper(EventDAO.class);
		
		ArrayList<EventVO> list = dao.getEventList();
		
		mv.addObject("list", list);
		mv.setViewName("user/hfu_event/hfu_event.jsp");
		
		return mv;
	}
	@RequestMapping("user/hfu_event_detail.do")
	public String hfu_event_detail(){
		return "user/hfu_event/hfu_event_detail.jsp";
	}
	
}