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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.AreaDAO;
import com.spring.dao.HallDAO;
import com.spring.vo.AreaVO;
import com.spring.vo.HallVO;
import com.spring.vo.ImageVO;

@Controller
public class Ha_hallController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/admin/hall.do")
	public ModelAndView hall(String page, HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			HallDAO dao = sqlSession.getMapper(HallDAO.class);
			AreaDAO areadao = sqlSession.getMapper(AreaDAO.class);
	//		ArrayList<HallVO> hallList = dao.execSelect();
			
			
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
			ArrayList<HallVO> hallList= dao.execSelect(startCount, endCount);
			
			for(HallVO vo:hallList){
				AreaVO area = areadao.execSelectByAno(vo.getAno());
				vo.setCity(area.getCity());
				vo.setGu(area.getGu());
			}
			mv.addObject("tcount",dbCount);
			mv.addObject("hallList", hallList);
			mv.setViewName("/admin/ha_hall/ha_hall_list.jsp");
		}
		return mv;
	}
	
	@RequestMapping(value="/admin/addmapController.do", method=RequestMethod.POST)
	public String addmap_update(HallVO vo, HttpSession session){
		if(session.getAttribute("member_id")==null){
			return ("redirect:../loginnecessary.jsp");
		}else{
			HallDAO dao = sqlSession.getMapper(HallDAO.class);
			dao.execMapUpdate(vo);
			
			return "redirect:/admin/hall.do";
		}
	}
	
	@RequestMapping("/admin/hall_insert.do")
	public ModelAndView hallInsert(HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("member_id")==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			AreaDAO dao = sqlSession.getMapper(AreaDAO.class);
			ArrayList<String> cityList = dao.execSelectCity();
			ArrayList<String> guList = dao.execSelectGu("서울");
			mv.setViewName("/admin/ha_hall/ha_hall_insert.jsp");
			mv.addObject("cityList", cityList);
			mv.addObject("guList", guList);
			
		}
		return mv;
	}
	
	@RequestMapping("/admin/addressCall.do")
	@ResponseBody
	public JSONArray addressCall(String id, String option){
		JSONArray addrList = new JSONArray();
		AreaDAO dao = sqlSession.getMapper(AreaDAO.class);
		ArrayList<AreaVO> list=new ArrayList<AreaVO>();
		list=dao.getAddressCall(id, option);
		if(id==null){
			for(AreaVO vo : list){
				JSONObject jo = new JSONObject();
				jo.put("city", vo.getCity());
				addrList.add(jo);
			}
		}
		else if(id.equals("city")){
			for(AreaVO vo : list){
				JSONObject jo = new JSONObject();
				jo.put("gu", vo.getGu());
				addrList.add(jo);		
			}
		}
		
		
		return addrList;
	}
	@RequestMapping(value="/admin/hall_save.do")
	public ModelAndView hallSave(HallVO vo, AreaVO area, HttpServletRequest request, String minguest, String maxguest, HttpSession session) throws IOException{
		//guest-> min과 max를 받아와서 string형으로 합치기
		//관리자의 아이디는
		String admin_id=(String)session.getAttribute("member_id");
		
		ModelAndView mv = new ModelAndView();
		if(admin_id==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			String guest = "최소보증인원 "+minguest+"/최대수용인원 "+maxguest;
			vo.setGuest(guest);
			HallDAO halldao=sqlSession.getMapper(HallDAO.class);
			AreaDAO areadao=sqlSession.getMapper(AreaDAO.class);
	
			/*파일관련 로직시작*/
			CommonsMultipartFile file=vo.getFile();
			String path=request.getSession().getServletContext().getRealPath("/upload");
			String fpath=path+"\\"+vo.getPthumbnail();
			FileOutputStream fos= new FileOutputStream(fpath);
			fos.write(file.getBytes());
			fos.close();
			/*파일관련 끝*/
			
			//hall insert 먼저
			vo.setAdmin_id(admin_id);
			vo.setAno(areadao.execSelectAno(area));
			halldao.execInsert(vo);
			//해당 관리자가 관리하는 hno의 번호는 
			String hno = halldao.execSelectByMemberid(admin_id);
			/*사진올리기 로직시작*/
			CommonsMultipartFile[] imageArray = vo.getImageArray();
			for(CommonsMultipartFile image: imageArray){
				if(!image.getOriginalFilename().equals("")){
					ImageVO imgvo = new ImageVO();
					imgvo.setFname(image.getOriginalFilename());
					String imgpath=request.getSession().getServletContext().getRealPath("/upload");
					String imgfpath=imgpath+"\\"+imgvo.getPfname();
					FileOutputStream fileos= new FileOutputStream(imgfpath);
					fileos.write(image.getBytes());
					fileos.close();
					//데이터 삽입로직시작
					imgvo.setHno(Integer.parseInt(hno));
					halldao.execInsertImage(imgvo);
					//데이터 삽입로직 끝
				}
			}
			/*사진올리기 로직 끝*/
			
			mv.setViewName("redirect:/admin/hall_content.do");
			vo.setHno(Integer.parseInt(hno));
			halldao.execGethall(vo);
		}
		return mv;
	}
	@RequestMapping("/admin/hall_content.do")
	public ModelAndView hallContent(HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		ModelAndView mv = new ModelAndView();
		if(admin_id==null){
			mv.setViewName("redirect:../loginnecessary.jsp");
		}else{
			mv.setViewName("/admin/ha_hall/ha_hall_content.jsp");
			
			HallDAO dao = sqlSession.getMapper(HallDAO.class);
			AreaDAO areadao = sqlSession.getMapper(AreaDAO.class);
			String hno=dao.execSelectByMemberid(admin_id);
			HallVO vo = dao.execSelectByNo(hno);
			AreaVO areavo = areadao.execSelectByAno(vo.getAno());
			ArrayList<ImageVO> imgList = dao.execSelectImage(hno);
			//"최소보증인원 "+minguest+"/최대수용인원 "+maxguest
			
			mv.addObject("imgList", imgList);
			mv.addObject("areavo", areavo);
			mv.addObject("vo",vo);
		}
		return mv;
	}
	@RequestMapping("/admin/hall_update.do")
	public ModelAndView hallUpdate(String hno, HttpSession session){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/ha_hall/ha_hall_update.jsp");
		HallDAO halldao = sqlSession.getMapper(HallDAO.class);
		AreaDAO areadao = sqlSession.getMapper(AreaDAO.class);
		HallVO hallvo = halldao.execSelectByNo(hno);
		ArrayList<String> cityList = areadao.execSelectCity();
		ArrayList<String> guList = areadao.execSelectGu("서울");
		ArrayList<ImageVO> imgList = halldao.execSelectImage(hno);
		AreaVO areavo = areadao.execSelectByAno(hallvo.getAno());
		hallvo.setCity(areavo.getCity());
		hallvo.setGu(areavo.getGu());
		String minguest=hallvo.getGuest().substring(7, hallvo.getGuest().indexOf("/", 1));
		String maxguest=hallvo.getGuest().substring(hallvo.getGuest().lastIndexOf(" ")+1, hallvo.getGuest().length());
		if(imgList.size()!=0){
			int num= imgList.get(0).getFno()+6-imgList.size();
			String num2=String.valueOf(num);
			mv.addObject("num", num2);
		}else{
			mv.addObject("num", "5");
		}
		
		mv.addObject("minguest", minguest);
		mv.addObject("maxguest", maxguest);
		mv.addObject("areavo", areavo);
		mv.addObject("hallvo", hallvo);
		mv.addObject("cityList", cityList);
		mv.addObject("guList", guList);
		mv.addObject("imgList", imgList);
		System.out.println(hallvo.getHcomment());
		return mv;
	}
	@RequestMapping("/admin/hall_update_save.do")
	public ModelAndView hallUpdateSave(HallVO vo, HttpServletRequest request, String minguest, String maxguest) throws IOException{
		/*파일관련 로직시작*/
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		if(vo.getFile()!=null){
			CommonsMultipartFile file=vo.getFile();
			String path=request.getSession().getServletContext().getRealPath("/upload");
			String fpath=path+"\\"+vo.getPthumbnail();
			FileOutputStream fos= new FileOutputStream(fpath);
			fos.write(file.getBytes());
			fos.close();
		}
		/*파일관련 끝*/
		
		/*사진올리기 로직시작*/
		if(vo.getImageArray()!=null){
		CommonsMultipartFile[] imageArray = vo.getImageArray();
		
		for(CommonsMultipartFile image: imageArray){
			
			if(!image.getOriginalFilename().equals("")){
				ImageVO imgvo = new ImageVO();
				imgvo.setFname(image.getOriginalFilename());
				String imgpath=request.getSession().getServletContext().getRealPath("/upload");
				String imgfpath=imgpath+"\\"+imgvo.getPfname();
				FileOutputStream fileos= new FileOutputStream(imgfpath);
				fileos.write(image.getBytes());
				fileos.close();
				//데이터 삽입로직시작
				imgvo.setHno((vo.getHno()));
				dao.execInsertImage(imgvo);
				//데이터 삽입로직 끝
			}
		}}
		vo.setGuest("최소보증인원 "+minguest+"/최대수용인원 "+maxguest);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admin/hall_content.do");

		dao.execUpdate(vo);
		return mv;
	}
	
	//halladmin이 hall삭제시
	@RequestMapping("/admin/hall_delete.do")
	public String hallDelete(HttpSession session){
		String admin_id = (String)session.getAttribute("member_id");
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		String hno =dao.execSelectByMemberid(admin_id);
		dao.execDeleteImageByHno(hno);
		dao.execDelete(hno);//해당 hall을 지우기
		dao.execDeleteHall(admin_id);
		return "redirect:/ha_index.do?hno=0";
	}
	
	
	//mainadmin이 hall삭제시
	@RequestMapping("/admin/hallDeleteByMainadmin.do")
	public String hallDeleteByMainadmin(String selectno, HttpSession session){
		if(session.getAttribute("member_id")!=null){
			return "redirect:../loginnecessary.jsp";
		}else{
			HallDAO dao = sqlSession.getMapper(HallDAO.class);
			String hno = selectno;
			dao.execDeleteImageByHno(hno);//해당 홀이 가지고 있는 사진을 delete한다.
			dao.execDelete(hno);
			dao.execUpdateAdminByHno(hno);//해당 홀을 가지고 있는 admin의 hno를 null로 update해준다.
			return "redirect:/admin/hall.do";
		}		
	}
	
	@ResponseBody
	@RequestMapping("/admin/imgDelete.do")
	public JSONArray imgDelete(String[] checkList, HttpSession session){
		JSONArray jlist = new JSONArray();
		String admin_id = (String)session.getAttribute("member_id");
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		for(int i=0; i<checkList.length; i++){
			dao.execDeleteImage(checkList[i]);
		}
		
		String hno = dao.execSelectByMemberid(admin_id);
		ArrayList<ImageVO> imgList = dao.execSelectImage(hno);
		for(ImageVO img: imgList){
			JSONObject jo = new JSONObject();
			jo.put("fno", img.getFno());
			jo.put("fname", img.getFname());
			jo.put("pfname", img.getPfname());
			jlist.add(jo);
		}
		return jlist;
		
	}
}
