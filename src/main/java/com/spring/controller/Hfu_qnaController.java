package com.spring.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.Hfu_HalldetailDAO;
import com.spring.dao.Hfu_QnaDAO;
import com.spring.vo.Hfu_HalldetailVO;
import com.spring.vo.QnaVO;

@Controller
public class Hfu_qnaController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("user/hfu_qna_list.do")
	public ModelAndView hfu_qna_list(){
		ModelAndView mv = new ModelAndView();
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		
		ArrayList<QnaVO> list = dao.execSelect();
				
		mv.addObject("list", list);
		mv.setViewName("user/hfu_qna/hfu_qna_list.jsp");
		
		return mv;
	}
	@RequestMapping("user/hfu_qna_pw.do")
	public ModelAndView hfu_qna_pw(String qno){
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("qno",qno);
		mv.setViewName("user/hfu_qna/hfu_qna_pw.jsp");
		return mv;
	}
	@RequestMapping(value= "user/qna_pw_check.do", method=RequestMethod.POST)
	public ModelAndView qna_pw_check(String qno, String hfu_qp_pw){
	
		ModelAndView mv = new ModelAndView();
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		
		QnaVO vo = new QnaVO();
		vo.setQno(Integer.parseInt(qno));
		vo.setQna_pw(hfu_qp_pw);						
		int result = dao.execSelectPw(vo);
		
		if(result==1){			
			mv.addObject("hfu_qp_pw",hfu_qp_pw);
			mv.setViewName("redirect:hfu_qna_content.do?qno="+qno);
		}else
			mv.setViewName("redirect:hfu_qna_list.do");		
		return mv;
	}
	
	@RequestMapping("user/hfu_qna_content.do")
	public ModelAndView hfu_qna_content(String qno){
		ModelAndView mv = new ModelAndView();
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		QnaVO vo = null;
		String hno = dao.execSelectHno(qno);
		
		if(hno == null){
			vo = dao.execContent(qno);
		}else{
			vo = dao.execHnoContent(qno);
		}
		
		mv.addObject("vo",vo);
		mv.setViewName("user/hfu_qna/hfu_qna_content.jsp");

		return mv;
	}
	@RequestMapping("user/hfu_qna_update.do")
	public ModelAndView hfu_qna_update(String no,String rno){
		ModelAndView mv = new ModelAndView();
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		QnaVO vo = dao.execContent(no);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		mv.setViewName("user/hfu_qna/hfu_qna_update.jsp");
		return mv;
	}
	@RequestMapping(value="user/qna_update_save.do", method=RequestMethod.POST)
	public String qna_update_save(QnaVO vo){
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		dao.execUpdate(vo);
		
		return "redirect:hfu_qna_list.do";
	}
	@RequestMapping("user/hfu_qna_form.do")
	public String hfu_qna_form(){

		return "user/hfu_qna/hfu_qna_form.jsp";
	}
	@RequestMapping("/user/hname.do")
	@ResponseBody
	public JSONArray hnameContent(){
		
		JSONArray nameList = new JSONArray();
		Hfu_HalldetailDAO dao = sqlSession.getMapper(Hfu_HalldetailDAO.class);
		ArrayList<Hfu_HalldetailVO> hname = dao.execHname();
		
		for(Hfu_HalldetailVO vo : hname){
			JSONObject jo = new JSONObject();
			
			jo.put("hname",vo.getHname());
			nameList.add(jo);		
		}
		return nameList;
	}
	@RequestMapping(value="user/hfu_qna_save.do", method=RequestMethod.POST)
	public String qna_save(QnaVO vo, String member_id, String hname){
		vo.setMember_id(member_id);
		vo.setHname(hname);
		
		Hfu_QnaDAO dao=sqlSession.getMapper(Hfu_QnaDAO.class);
		int result=dao.execInsert(vo);

		return "redirect:hfu_qna_list.do";
	}
	@RequestMapping("user/hfu_qna_delete.do")
	public String hfu_qna_delete(String qno){
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		dao.execDelete(qno);

		return "redirect:hfu_qna_list.do";
	}@RequestMapping("user/qna_delete.do")
	public String qna_delete(){

		return "user/hfu_qna/qna_delete.jsp";
	}
	
}
