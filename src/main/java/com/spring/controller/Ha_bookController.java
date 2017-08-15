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

import com.spring.dao.BookDAO;
import com.spring.dao.EstimateDAO;
import com.spring.dao.HallDAO;
import com.spring.dao.MemberDAO;
import com.spring.vo.BookVO;
import com.spring.vo.BookokVO;
import com.spring.vo.EstimateVO;
import com.spring.vo.HallVO;

@Controller
public class Ha_bookController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/admin/book_datatable.do")
	public ModelAndView ha_book_datatable(HttpSession session){
		ArrayList<BookVO> list = null;
		ModelAndView mv = new ModelAndView();
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}
		else{
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		MemberDAO mdao = sqlSession.getMapper(MemberDAO.class);
		String hno = mdao.execSelectHno(admin_id);
		String hname = mdao.execSelectHname(admin_id);
		
		if(admin_id.equals("mainadmin")){
			list = dao.execAllSelect();
		}else{
			list = dao.execSelect(admin_id);
		}
		mv.addObject("list", list);
		mv.addObject("hno", hno);
		mv.addObject("hname", hname);
		
		mv.setViewName("/admin/ha_book/ha_book_datatable.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/admin/book_content.do")
	public ModelAndView ha_book_content(String bno, String rno, HttpSession session){
		ModelAndView mv = new ModelAndView();
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		String admin_id =(String)session.getAttribute("member_id");
		if(admin_id==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			BookVO vo = dao.execContent(bno);
			mv.addObject("vo", vo);
			mv.addObject("rno", rno);
			mv.setViewName("/admin/ha_book/ha_book_content.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/admin/halltype.do")
	@ResponseBody
	public JSONArray halltype(String hno){
		JSONArray halltype = new JSONArray();
		
		EstimateDAO edao=sqlSession.getMapper(EstimateDAO.class);
		
		ArrayList<EstimateVO> typename=edao.execHalltypeContent(hno);
		
		for(EstimateVO evo : typename){
			JSONObject jo = new JSONObject();
			
			jo.put("typename",evo.getTypename());
			
			halltype.add(jo);		
		}		
		return halltype;	
	}
	
	@RequestMapping("/admin/book_complete.do")
	public ModelAndView ha_book_complete(String bno, String rno, HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		String admin_id =(String)session.getAttribute("member_id");
		if(admin_id==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			BookDAO dao = sqlSession.getMapper(BookDAO.class);
			BookVO vo = dao.execComplete(bno);
			mv.addObject("vo", vo);
			mv.addObject("rno", rno);
			mv.setViewName("/admin/ha_book/ha_book_complete.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/admin/book_form.do")
	public String ha_book_form(HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			return "/admin/ha_book/ha_book_form.jsp";
		}
	}
	
	@RequestMapping(value="/admin/book_save.do", method=RequestMethod.POST)
	public String book_save(BookVO vo, String typename, HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			BookDAO dao = sqlSession.getMapper(BookDAO.class);
			vo.setHtype(typename);
			
			int result = dao.execBookInsert(vo);
			dao.execCheckUpdate(vo);
			dao.execBcountUpdate(vo);
			return "redirect:/admin/book_datatable.do";
		}
		
	}
	
	@RequestMapping("/admin/list_delete.do")
	public String list_delete(String bno, HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			BookDAO dao = sqlSession.getMapper(BookDAO.class);
			dao.execListDelete(bno);
			return "redirect:/admin/book_datatable.do";
		}
		
	}
	
	@RequestMapping("/admin/book_delete.do")
	public String book_delete(String bno, HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			BookDAO dao = sqlSession.getMapper(BookDAO.class);
			dao.execBookDelete(bno);
			dao.execListDelete(bno);
			
			return "redirect:/admin/book_datatable.do";
	
		}
	}

	@RequestMapping(value="/admin/newinsertController.do", method=RequestMethod.POST)
	public String addmap_update(BookVO vo, String typename, HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id==null){
			return "redirect:../loginnecessary.jsp";
		}else{
			BookDAO dao = sqlSession.getMapper(BookDAO.class);
			vo.setHtype(typename);
			
			int result = dao.execNewBookInsert(vo);
			
			return "redirect:/admin/book_datatable.do";
		}
	}
	
}
