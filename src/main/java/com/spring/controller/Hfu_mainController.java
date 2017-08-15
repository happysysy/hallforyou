package com.spring.controller;


import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.HallDAO;
import com.spring.dao.Hfu_MemberDAO;
import com.spring.dao.LoginDAO;
import com.spring.vo.HallVO;
import com.spring.vo.Hfu_MemberVO;
import com.spring.vo.LoginVO;
import com.spring.vo.MemberVO;


@Controller
public class Hfu_mainController {

	@Autowired	
	SqlSessionTemplate sqlSession;

	@RequestMapping(value="/user/loginCheck", method=RequestMethod.POST)
	public String loginCheck(LoginVO vo, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception{
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		int result = dao.execSelect(vo);
		int result2 = dao.execSelect2(vo);
		String url = vo.getUrl();
		String strresult = "redirect:" + url;

		if(result == 1){
			Hfu_MemberVO mvo = dao.execInfo(vo);
			strresult="redirect:" + url;
			session.setAttribute("member_id", vo.getId());
			session.setAttribute("member_name", mvo.getMember_name());
			session.setAttribute("email", mvo.getEmail());
			session.setAttribute("member_phone", mvo.getMember_phone());
			session.setAttribute("gender", mvo.getGender());
			return strresult;
		}else if(result2 == 1){
			session.setAttribute("member_id", vo.getId());
			MemberVO mvo = dao.execSelectHno(vo);
			
			if(mvo.getHno() == 0){
				session.setAttribute("hno", "0");
			}else{
				session.setAttribute("hno", String.valueOf(mvo.getHno()));
			}
			
			strresult = "redirect:/ha_index.do";
			return strresult;	
		}
		return strresult;
	}
	
	@RequestMapping(value = "/loginSuccessCheck")
	@ResponseBody
	public String loginSuccessCheck(String id, String pass){
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		
		int idResult = dao.getIdCheck(id);
		int passResult = 0;
		String loginSuccessCheck = "";
		
		if(idResult == 0){
			idResult = dao.getIdCheck2(id);
			passResult = dao.getPassCheck2(id, pass);
			
			if(idResult == 0){
				loginSuccessCheck = "IN";
			}else{
				if(passResult == 0){
					loginSuccessCheck = "PN";
				}else{
					loginSuccessCheck = "Y";
				}
			}
		}else{
			passResult = dao.getPassCheck(id, pass);
			if(passResult == 0){
				loginSuccessCheck = "PN";
			}else{
				loginSuccessCheck = "Y";
			}
		}
		
		return loginSuccessCheck;
	}
	
	@RequestMapping("/user/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/user/hfu_index.do";
	}
	@RequestMapping("user/hfu_index.do")
	public ModelAndView hfu_index(HttpSession session){
		ModelAndView mv = new ModelAndView();
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		ArrayList<HallVO> besthall = dao.execbhall();
		mv.addObject("besthall", besthall);
		mv.setViewName("user/hfu_index.jsp");
		return mv;
	}
	@RequestMapping("user/hfu_header.do")
	public String hfu_header(){
		return "user/hfu_header.jsp";
	}
	@RequestMapping("user/hfu_sheader.do")
	public String hfu_sheader(){
		return "user/hfu_sheader.jsp";
	}
	@RequestMapping("user/hfu_footer.do")
	public String hfu_footer(){
		return "user/hfu_footer.jsp";
	}
}