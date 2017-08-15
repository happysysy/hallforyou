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
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BookDAO;
import com.spring.dao.EstimateDAO;
import com.spring.dao.Hfu_HalldetailDAO;
import com.spring.dao.ReviewDAO;
import com.spring.vo.BookVO;
import com.spring.vo.EstimateVO;
import com.spring.vo.Hfu_HalldetailVO;
import com.spring.vo.ImageVO;
import com.spring.vo.ReviewVO;

@Controller
public class Hfu_halldetailController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/user/hfu_halldetail.do")
	public ModelAndView hfu_hallDetail(String hno, String page){
		
		ModelAndView mv = new ModelAndView();
		Hfu_HalldetailDAO dao = sqlSession.getMapper(Hfu_HalldetailDAO.class);
		ReviewDAO rdao = sqlSession.getMapper(ReviewDAO.class);
		EstimateDAO edao = sqlSession.getMapper(EstimateDAO.class);
		
		Hfu_HalldetailVO vo = dao.execContent(hno); //세부사항
		ArrayList<ImageVO> ilist = dao.execImageSelect(hno);//이미지
		ArrayList<Hfu_HalldetailVO> blist = dao.execBookSelect(hno);  //예약현황
		ArrayList<ReviewVO> rlist = rdao.execReviewSelect(hno);//리뷰	
		ArrayList<ReviewVO> rllist = rdao.execReviewListSelect(hno);//리뷰전체
		ArrayList<EstimateVO> elist = edao.execSelectHtype(hno);//견적서-홀 불러오기
		
		mv.addObject("vo", vo);
		mv.addObject("ilist",ilist);
		mv.addObject("blist", blist);
		mv.addObject("rlist", rlist);
		mv.addObject("rllist", rllist);
		mv.addObject("elist",elist);
		mv.setViewName("user/hfu_hallinfo/hfu_halldetail.jsp");
		
		return mv;
	}

	@RequestMapping("/user/halltype.do")
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
	@RequestMapping("/calendar.do")
	@ResponseBody
	public JSONArray calendarContent(String hno){
		JSONArray calList = new JSONArray();
		Hfu_HalldetailDAO dao = sqlSession.getMapper(Hfu_HalldetailDAO.class);
		ArrayList<Hfu_HalldetailVO> blist = dao.execBookSelect(hno);
		
		for(Hfu_HalldetailVO detailvo : blist){
			JSONObject jo = new JSONObject();
			
			jo.put("hno",detailvo.getHno());
			jo.put("title", detailvo.getMname() +"-" + detailvo.getWtime());
			jo.put("id", detailvo.getMname());
			jo.put("start", detailvo.getWdate());
			jo.put("end", detailvo.getWdate());
			
			calList.add(jo);		
		}		
		return calList;	
	}
	@RequestMapping("/wishlist.do")
	@ResponseBody
	public String wishlistContent(Hfu_HalldetailVO vo, HttpSession session){

		Hfu_HalldetailDAO dao = sqlSession.getMapper(Hfu_HalldetailDAO.class);
		String member_id=(String)session.getAttribute("member_id");
		
		vo.setMember_id(member_id);
		
		int result = dao.execWishlistInsert(vo);

		return "redirect:/user/hfu_halldetail.do?hno="+vo.getHno();	
	}
	@RequestMapping("/wishlistCheck.do")
	@ResponseBody
	public String wishlistCheck(Hfu_HalldetailVO vo, HttpSession session){
		
		Hfu_HalldetailDAO dao = sqlSession.getMapper(Hfu_HalldetailDAO.class);
		String member_id=(String)session.getAttribute("member_id");
			
		vo.setMember_id(member_id);
		
		int result = dao.getWishlistCheck(vo);
		String succ = "";
		
		if(result == 0){
			//사용가능
			succ = "Y";
		}else{
			//사용불가
			succ = "N";
		}
		
		return succ;
	
	}
	@RequestMapping(value="user/hfu_detail_consult.do", method=RequestMethod.POST)
	public String hfu_detail_consult(BookVO vo, String member_id, String typename){
		vo.setMember_id(member_id);
		vo.setHtype(typename);
	
		BookDAO dao=sqlSession.getMapper(BookDAO.class);			
		int result=dao.execConsultInsert(vo);
			
		return "redirect:/user/hfu_halldetail.do?hno="+vo.getHno();		
	}	
	
	@RequestMapping(value="user/hfu_halldetail_review.do", method=RequestMethod.POST)
	public String hfu_halldetail_review(ReviewVO vo, String member_id){
		vo.setMember_id(member_id);
		ReviewDAO dao=sqlSession.getMapper(ReviewDAO.class);
		int result=dao.execReviewInsert(vo);
		
		return "redirect:/user/hfu_halldetail.do?hno="+vo.getHno();		
	}
	@RequestMapping("/hfu_estimate_selection.do")
	@ResponseBody
	public JSONArray hfu_estimate_check(String typeno){

		JSONArray estList = new JSONArray();
		EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
		ArrayList<EstimateVO> elist = dao.execSelectSelectionByTypeno(typeno);

		for(EstimateVO evo : elist){
			JSONObject jo = new JSONObject();
			
			jo.put("typeno",evo.getTypeno());
			jo.put("sname",evo.getSname());
			jo.put("sprice", evo.getSprice());
			jo.put("sref", evo.getSref());
			jo.put("scontent", evo.getScontent());
			
			estList.add(jo);		
		}		

		return estList;	
	}
	@RequestMapping("/hfu_estimate_meal.do")
	@ResponseBody
	public JSONArray hfu_estimate_meal(String typeno){
		
		JSONArray estList = new JSONArray();
		EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
		ArrayList<EstimateVO> mlist=dao.execSelectMealByTypeno(typeno);
	
		for(EstimateVO evo : mlist){
			JSONObject jo = new JSONObject();
			
			jo.put("typeno",evo.getTypeno());
			jo.put("mealprice",evo.getMealprice());
			jo.put("mealtype",evo.getMealtype());
			jo.put("mealcontent",evo.getMealcontent());
			
			estList.add(jo);		
		}
		return estList;	
	}
	@RequestMapping("/hfu_estimate_drink.do")
	@ResponseBody
	public JSONArray hfu_estimate_drink(String typeno){

		JSONArray estList = new JSONArray();
		EstimateDAO dao = sqlSession.getMapper(EstimateDAO.class);
		ArrayList<EstimateVO> dlist=dao.execSelectDrinkByTypeno(typeno);
	
		for(EstimateVO dvo : dlist){
			JSONObject jo = new JSONObject();
			
			jo.put("typeno",dvo.getTypeno());
			jo.put("dno", dvo.getDno());
			jo.put("drink",dvo.getDrink());
			jo.put("drinkprice",dvo.getDrinkprice());
			
			estList.add(jo);		
		}
		return estList;	
	}
}
