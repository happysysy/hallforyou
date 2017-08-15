package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dao.LoginDAO;
import com.spring.vo.MemberVO;

@Controller
public class Ha_mainController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/ha_header.do")
	public String header(){
		return "/admin/ha_header.jsp";
	}
	
	@RequestMapping("/ha_hmheader.do")
	public String hmheader(){
		return "/admin/ha_hmheader.jsp";
	}
	
	@RequestMapping("/ha_index.do")
	public String index(HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		String link="";
		if(admin_id == null){
			link= "redirect:/loginnecessary.jsp";
		}else{
			link= "/admin/ha_index.jsp";
		}
		return link;
	}
	
	@RequestMapping("/ha_footer.do")
	public String ha_footer(){
		return "/admin/ha_footer.jsp";
	}
}
