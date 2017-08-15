package com.spring.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.EstimateDAO;
import com.spring.dao.HallDAO;
import com.spring.vo.EstimateVO;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class Ha_estimateController {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@RequestMapping("/admin/estimate_insert.do")
	public String estimateInsert(HttpSession session){
		if(session.getAttribute("member_id")==null){
			return "redirect:../loginnecessary.jsp";
		}
		else {
			return "/admin/ha_hall/ha_estimate_insert.jsp";
		}
	}

	@RequestMapping("/admin/estimate_update.do")
	public ModelAndView estimateUpdate(String typeno,HttpSession session){
		//join해서 typeno에 해당되는 halltype, selection, meal, drink 전부 가져오기
		ModelAndView mv = new ModelAndView();
		String admin_id=(String)session.getAttribute("member_id");
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}
		else{
			HallDAO halldao = sqlSession.getMapper(HallDAO.class);
			String hno=halldao.execSelectByMemberid(admin_id);
			
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			//admin_id를 가지고 관리하는 hno를 불러와야함.
		
			mv.addObject("typeno",typeno);
			ArrayList<EstimateVO> elist = dao.execSelectHtype(hno);
			mv.addObject("elist", elist);
			mv.setViewName("/admin/ha_hall/ha_estimate_update.jsp");
			if(typeno!=null){
				EstimateVO halltype=dao.execSelectHtypeByTypeno(typeno);
				mv.addObject("halltype",halltype);
				ArrayList<EstimateVO> slist=dao.execSelectSelectionByTypeno(typeno);
				mv.addObject("slist",slist);
				ArrayList<EstimateVO> mlist=dao.execSelectMealByTypeno(typeno);
				mv.addObject("mlist",mlist);
				ArrayList<EstimateVO> dlist=dao.execSelectDrinkByTypeno(typeno);
				mv.addObject("dlist",dlist);
			}
		}
		return mv;
	}
	@RequestMapping("/admin/htypeInsert.do")
	public String estimateInsertSave(EstimateVO vo,HttpSession session){
		EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
		HallDAO halldao = sqlSession.getMapper(HallDAO.class);
		String admin_id=(String)session.getAttribute("member_id");
		if(session.getAttribute("member_id")==null){
			return ("redirect:../loginnecessary.jsp");
		}else{
			int hno=Integer.parseInt(halldao.execSelectByMemberid(admin_id));
			vo.setHno(hno);
			dao.execInsertHtype(vo);
			vo.setHno(Integer.parseInt(halldao.execSelectByMemberid(admin_id)));//이부분은 hno를 session을 이용해 해당 사용자가 관리하는 hno를 불러올 것임
			vo.setTypeno(dao.execSelectTypeno(vo));
			dao.execUpdateSelectionTypeno(vo);
			dao.execUpdateMealTypeno(vo);
			dao.execUpdateDrinkTypeno(vo);
			return "redirect:/admin/estimate_update.do";
		}
	}
	@ResponseBody
	@RequestMapping("/admin/insertSelection.do")
	public JSONArray insertSelection(EstimateVO vo){
		JSONArray jlist = new JSONArray();
		EstimateDAO dao=sqlSession.getMapper(EstimateDAO.class);
		dao.execInsertSelection(vo);
		ArrayList<EstimateVO> slist= dao.execSelectSelection(vo.getRannum());
		for(EstimateVO s : slist){
			JSONObject jo = new JSONObject();
			jo.put("sno", s.getSno());
			jo.put("sname", s.getSname());
			jo.put("sprice", s.getSprice());
			jo.put("sref", s.getSref());
			jo.put("scontent", s.getScontent());
			jlist.add(jo);
		}
		
		return jlist;
	}
	
	@ResponseBody
	@RequestMapping("/admin/insertMeal.do")
	public JSONArray insertMeal(EstimateVO vo, HttpSession session){
		JSONArray jlist = new JSONArray();
		String admin_id=(String)session.getAttribute("member_id");
		if(admin_id!=null){
			EstimateDAO dao=sqlSession.getMapper(EstimateDAO.class);
			HallDAO halldao = sqlSession.getMapper(HallDAO.class);
			String hno =halldao.execSelectByMemberid(admin_id);
			vo.setHno(Integer.parseInt(hno));		
			dao.execInsertMeal(vo);
			ArrayList<EstimateVO> mlist= dao.execSelectMeal(vo.getRannum());
			for(EstimateVO m : mlist){
				JSONObject jo = new JSONObject();
				jo.put("mno", m.getMno());
				jo.put("mealtype", m.getMealtype());
				jo.put("mealprice", m.getMealprice());
				jo.put("mealcontent", m.getMealcontent());
				jlist.add(jo);
			}
		}

		return jlist;
	}
	
	@ResponseBody
	@RequestMapping("/admin/insertDrink.do")
	public JSONArray insertDrink(EstimateVO vo){
		JSONArray jlist = new JSONArray();
		EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
		dao.execInsertDrink(vo);
		ArrayList<EstimateVO> dlist = dao.execSelectDrink(vo.getRannum());
		for(EstimateVO d: dlist){
			JSONObject jo=new JSONObject();
			jo.put("dno", d.getDno());
			jo.put("drink", d.getDrink());
			jo.put("drinkprice", d.getDrinkprice());
			jlist.add(jo);
		}
		return jlist;
	}
	
	@ResponseBody
	@RequestMapping("/admin/deleteSelection.do")
	public void deleteSelection(String sno, HttpSession session){
		if(session.getAttribute("member_id")!=null){
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			dao.execUpdateDeleteSelection(sno);
		}
	}
	@ResponseBody
	@RequestMapping("/admin/deleteMeal.do")
	public void deleteMeal(String mno, HttpSession session){
		if(session.getAttribute("member_id")!=null){
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			dao.execUpdateDeleteMeal(mno);
		}
	}
	
	@ResponseBody
	@RequestMapping("/admin/deleteDrink.do")
	public void deleteDrink(String dno,HttpSession session){
		if(session.getAttribute("member_id")!=null){
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			dao.execUpdateDeleteDrink(dno);
		}
	}
	
	@ResponseBody
	@RequestMapping("/admin/updateTypeinfoInsert.do")
	public JSONObject updateSelectionInsert(EstimateVO vo, String insertwhat, HttpSession session){
		JSONObject jo = new JSONObject();
		String admin_id = (String)session.getAttribute("member_id");
		if(admin_id!=null){
			HallDAO halldao =sqlSession.getMapper(HallDAO.class);
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			String hno =halldao.execSelectByMemberid(admin_id);
			vo.setHno(Integer.parseInt(hno));
			if(insertwhat.equals("insertBtnSelection")){
				dao.execUpdateInsertSelection(vo);
				jo.put("sname", vo.getSname());
				jo.put("sref", vo.getSref());
				jo.put("sprice", vo.getSprice());
				jo.put("scontent", vo.getScontent());
			}
			if(insertwhat.equals("insertBtnMeal")){
				dao.execUpdateInsertMeal(vo);
				jo.put("mealtype", vo.getMealtype());
				jo.put("mealprice", vo.getMealprice());
				jo.put("mealcontent", vo.getMealcontent());
			}
			if(insertwhat.equals("insertBtnDrink")){
				dao.execUpdateInsertDrink(vo);
				jo.put("drink", vo.getDrink());
				jo.put("drinkprice", vo.getDrinkprice());
	
			}
		}
		return jo;
	}
	@RequestMapping("/admin/htypeUpdate.do")
	public String htypeUpdate(EstimateVO vo, HttpSession session){
		if(session.getAttribute("member_id")==null){
			return ("redirect:../loginnecessary.jsp");
		}else{
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			dao.execUpdateHtype(vo);
			return "redirect:/admin/estimate_update.do?typeno="+vo.getTypeno();
		}
	}
	
	@RequestMapping("/admin/htypeDelete.do")
	public String htypeDelete(String typeno, HttpSession session){
		if(session.getAttribute("member_id")==null){
			return ("redirect:../loginnecessary.jsp");
		}else{
			EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
			dao.execDeleteHtype(typeno);
			return "redirect:/admin/estimate_update.do";
		}
	}
}
