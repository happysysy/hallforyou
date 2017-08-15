package com.spring.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.AreaDAO;
import com.spring.dao.EventDAO;
import com.spring.vo.AreaVO;
import com.spring.vo.EventVO;
import com.spring.vo.HallVO;

@Controller
public class Ha_eventController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/admin/event.do")
	public ModelAndView event(String page, HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			EventDAO dao = sqlSession.getMapper(EventDAO.class);
			//startpage, endpage계산
			//페이지 네비게이션 변수 선언- startCount, endCount를 구하는 로직
			int startCount=0;
			int endCount=0;
			int pageSize = 5;	//한 페이지의 게시물 수	
			int grpSize = 3;	//그룹의 크기
			int reqPage = 1;	//요청 페이지 : linkPage 값
			int pageCount = 1;	//전체 페이지 수
			int dbCount = dao.execPageCount();	//DB에서 가져온 전체 행 수
			
			//총 페이지수 계산
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
			//요청 페이지 시작행 계산
			//String page = request.getParameter("reqPage");
			if(page != null){//page는 실행할 때마다 인자로 받을 것임
				reqPage = Integer.parseInt(page);	
				startCount = (reqPage-1) * pageSize+1;	//3페이지 시작행:(3-1)*5+1 =11
				endCount = reqPage*pageSize; 			//3페이지 종료행:3*5 = 15
			}else{
				startCount = 1;
				endCount = 5;
			}
			ArrayList<EventVO> list= dao.execSelect(startCount, endCount);
			mv.addObject("tcount",dbCount);
			mv.addObject("list", list);
			mv.setViewName("/admin/ha_event/ha_event_list.jsp");
		}
		return mv;
	}
	@RequestMapping(value="/admin/event_insert.do", method=RequestMethod.POST)
	public String eventInsert(EventVO vo, String nkey, HttpServletRequest request, HttpSession session) throws IOException{
		if(session.getAttribute("member_id")==null){
			return ("redirect:../loginnecessary.jsp");
		}else{
			EventDAO dao = sqlSession.getMapper(EventDAO.class);
			CommonsMultipartFile file=vo.getFile();
			if(vo.getFile()!=null){
				String path=request.getSession().getServletContext().getRealPath("/upload");
				String fpath=path+"\\"+vo.getPimage();
				FileOutputStream fos= new FileOutputStream(fpath);
				fos.write(file.getBytes());
				fos.close();
				if(nkey.equals("insert")){
					dao.execInsert(vo);
				}else if(nkey.equals("update")){
					dao.execUpdate(vo);
				}
			}
			
			//파일이 null일때 update부분
			else{
				if(nkey.equals("update")){
					dao.execUpdateFilenull(vo);
				}
			}
			if(nkey.equals("delete")){
				dao.execDelete(vo.getEno());
			}
			return "redirect:/admin/event.do";
		}
	}
	
	@RequestMapping("/admin/callEvent.do")
	@ResponseBody
	public JSONObject addressCall(String eno){
		JSONObject jo = new JSONObject();
		EventDAO dao = sqlSession.getMapper(EventDAO.class);
		EventVO vo = dao.execSelectByNo(Integer.parseInt(eno));
		jo.put("hno", vo.getHno());
		jo.put("image", vo.getImage());
		jo.put("url", vo.getUrl());
		return jo;
	}
}
