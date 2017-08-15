package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import com.spring.dao.QnaDAO;
import com.spring.vo.QnaVO;

@Controller
public class Ha_qnaController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/admin/qna_datatable.do")
	public ModelAndView ha_qna_datatable(HttpSession session){
		
		ArrayList<QnaVO> list = null;
		
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
			String admin_id = (String)session.getAttribute("member_id");
			
			if(admin_id.equals("mainadmin")){
				list = dao.execAllSelect();
			}else{
				list = dao.execSelect(admin_id);
			}
			mv.addObject("list", list);
			mv.setViewName("/admin/ha_qna/ha_qna_datatable.jsp");	
		}
				
		return mv;
	}
	
	@RequestMapping("/admin/qna_content.do")
	public ModelAndView ha_qna_content(String qno, String rno, HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
			QnaVO vo = dao.execContent(qno);
			
			mv.addObject("vo", vo);
			mv.addObject("rno", rno);
			mv.setViewName("/admin/ha_qna/ha_qna_content.jsp");
		}		
		return mv;
	}
	
	@RequestMapping("/admin/qna_answer.do")
	public ModelAndView ha_qna_answer(String qno, String rno, HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
			QnaVO vo = dao.execContent(qno);
			mv.addObject("vo", vo);
			mv.addObject("rno", rno);
			mv.setViewName("/admin/ha_qna/ha_qna_answer.jsp");	
		}		
		return mv;
	
	}
	
	@RequestMapping(value="/admin/qna_answer_update.do", method=RequestMethod.POST)
	public String qna_answer_update(QnaVO vo, HttpSession session){
		if(session.getAttribute("member_id")==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
			dao.execAnswerUpdate(vo);
			return "redirect:/admin/qna_content.do?qno="+vo.getQno()+"&rno="+ vo.getRno();
		}
	}
	
	@RequestMapping("/admin/qna_delete.do")
	public String qna_delete(String qno, HttpSession session){
		if(session.getAttribute("member_id")==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
			dao.execDelete(qno);
			
			return "redirect:/admin/qna_datatable.do";
	
		}
	}
}
