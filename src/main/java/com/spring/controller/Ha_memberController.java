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

import com.spring.dao.MemberDAO;
import com.spring.vo.MemberVO;

@Controller
public class Ha_memberController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/admin/member_datatable.do")
	public ModelAndView ha_member_datatable(HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}
		else{
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			ArrayList<MemberVO> list = dao.execSelect();
			mv.addObject("list", list);
			mv.setViewName("/admin/ha_member/ha_member_datatable.jsp");	
		}
		return mv;
	}
	
	@RequestMapping("/admin/member_content.do")
	public ModelAndView ha_member_content(String id, String rno, HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			MemberVO vo = dao.execMemberContent(id);
			
			mv.addObject("vo", vo);
			mv.addObject("rno", rno);
			mv.setViewName("/admin/ha_member/ha_member_content.jsp");	
		}
		return mv;
	}
	
	@RequestMapping("/admin/admin_content.do")
	public ModelAndView ha_admin_content(String id, String rno, HttpSession session){
		
		MemberVO vo = null;
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			
			String hno = dao.execSelectHno(id);
			System.out.println("controller hno = " + hno);
			
			if(hno == null){
				vo = dao.execNonAdminContent(id);
			}else{
				vo = dao.execAdminContent(id);
			}
			
			mv.addObject("vo", vo);
			mv.addObject("rno", rno);
			mv.setViewName("/admin/ha_member/ha_admin_content.jsp");
		}
				
		return mv;
	}
	
	@RequestMapping("/admin/admin_submit.do")
	public String admin_submit(MemberVO vo, HttpSession session){
		if(session.getAttribute("member_id")==null){
			return "redirect:../loginnecessary.jsp";
		}
		else{
			MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
			dao.execSubmit(vo);
			return "redirect:/admin/member_datatable.do";
		}
	}
}
