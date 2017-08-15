package com.spring.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.AreaDAO;
import com.spring.dao.BookDAO;
import com.spring.dao.Hfu_MemberDAO;
import com.spring.dao.Hfu_QnaDAO;
import com.spring.dao.LoginDAO;
import com.spring.dao.MyhallDAO;
import com.spring.dao.SearchDAO;
import com.spring.dao.idpwDAO;
import com.spring.vo.AreaVO;
import com.spring.vo.BookVO;
import com.spring.vo.BookokVO;
import com.spring.vo.HallVO;
import com.spring.vo.Hfu_MemberVO;
import com.spring.vo.LoginVO;
import com.spring.vo.MemberVO;
import com.spring.vo.QnaVO;

@Controller
public class Hfu_mypageController {

	@Autowired
	 private SqlSessionTemplate sqlSession;

	@Autowired
	 private JavaMailSender mailSender;
	
	int mailc;
	  // mailSending 코드
	  @RequestMapping(value = "/mail/mailSending")
	  @ResponseBody
	  public String mailSending(HttpServletRequest request, String email) {
		  Random random = new Random();
		  mailc = random.nextInt(9000)+1000;
		  String content = String.valueOf(mailc);
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom("tjdan862@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(email);     // 받는사람 이메일
	      messageHelper.setSubject("HallForYou 이메일 인증입니다."); // 메일제목은 생략이 가능하다
	      messageHelper.setText("인증번호 : " + content);  // 메일 내용
	     
	      mailSender.send(message);
	      
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return email;
	  }
	  
	  
	  
	  // 아이디 중복 확인
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String idCheck(String member_id){
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		int result = dao.getIdCheck(member_id);
		if (result == 0)
			result = dao.getIdCheck2(member_id);
		String member_idc = "";
		if(result == 0){
			//사용가능
			member_idc = "Y";
		}else{
			//사용불가
			
			member_idc = "N";
		}
		return member_idc;
	}
	
	
	@RequestMapping("/joinarea")
	@ResponseBody
	public JSONArray addressCall(String id, String option){
		JSONArray addrList = new JSONArray();
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		ArrayList<AreaVO> list = dao.getJoinArea(id, option);
		
		for(AreaVO vo : list){
			JSONObject jo = new JSONObject();
			jo.put("city", vo.getCity());
			jo.put("gu", vo.getGu());
			
			addrList.add(jo);
		}
		
		return addrList;
	}
	
	/* member 회원가입 */
	@RequestMapping(value="/user/member_join", method=RequestMethod.POST)
	public String member_join(Hfu_MemberVO vo){
		if(mailc == vo.getEmailc()){
			Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
			
			int result = dao.execInsert(vo);
		}
		return "redirect:/user/hfu_index.do";
	}
	

	/* admin 회원가입 */
	@RequestMapping(value="/user/admin_join", method=RequestMethod.POST)
	public String admin_join(Hfu_MemberVO vo){
			Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
			vo.setLicensee_no(vo.getL1()+vo.getL2()+vo.getL3());
			int result = dao.execAdminInsert(vo);
		return "redirect:/user/hfu_index.do";
	}
	
	/* 아이디 찾기 */
	@RequestMapping(value="/user/idinquiry1", method=RequestMethod.POST)
	public String idinquiry(Hfu_MemberVO vo){

		if(mailc == vo.getEmailc()){
			idpwDAO dao = sqlSession.getMapper(idpwDAO.class);
			int result = dao.execSelect(vo);
			if(result == 1){
			    try {
			    	MimeMessage message = mailSender.createMimeMessage();
				    MimeMessageHelper messageHelper 
				                    = new MimeMessageHelper(message, true, "UTF-8");
					messageHelper.setFrom("tjdan862@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
				    messageHelper.setTo(vo.getEmail());     // 받는사람 이메일
				    messageHelper.setSubject("HallForYou 이메일 인증입니다."); // 메일제목은 생략이 가능하다
				    messageHelper.setText("회원님의 아이디는 '" + dao.execId(vo) + "' 입니다.");  // 메일 내용
				 
			  	    mailSender.send(message);
				  
			    }catch(Exception e){
					System.out.println(e);
				}
			}
		}
		return "/user/hfu_member/hfu_member_help.jsp";
	}
	/* 비밀번호 찾기 */
	@RequestMapping(value="/user/pwinquiry1", method=RequestMethod.POST)
	public String pwinquiry(Hfu_MemberVO vo){

		if(mailc == vo.getEmailc()){
			idpwDAO dao = sqlSession.getMapper(idpwDAO.class);
			int result = dao.execSelect(vo);
			if(result == 1){
			    try {
			    	MimeMessage message = mailSender.createMimeMessage();
				    MimeMessageHelper messageHelper 
				                    = new MimeMessageHelper(message, true, "UTF-8");
					messageHelper.setFrom("tjdan862@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
				    messageHelper.setTo(vo.getEmail());     // 받는사람 이메일
				    messageHelper.setSubject("HallForYou 이메일 인증입니다."); // 메일제목은 생략이 가능하다
				    messageHelper.setText("회원님의 비밀번호는 '" + dao.execPw(vo) + "' 입니다.");  // 메일 내용
				 
			  	    mailSender.send(message);
				  
			    }catch(Exception e){
					System.out.println(e);
				}
			}
		}
		return "/user/hfu_member/hfu_member_help.jsp";
	}
		 
	
	/* 정보 체크 */
	@RequestMapping(value="/user/passCheck", method=RequestMethod.POST)
	public String infocheck(Hfu_MemberVO vo){
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		int result = dao.execSelect(vo);
		if(result == 1){
			return "user/hfu_member/hfu_mypage_info.jsp";
		}
		return "/user/hfu_index.jsp";
	}
	
	/* 정보 수정 */
	@RequestMapping(value="/user/update", method=RequestMethod.POST)
	public String info(Hfu_MemberVO vo){
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		dao.execUpdate(vo);
		return "/user/hfu_index.jsp";
	}
	/* 회원 탈퇴 */
	@RequestMapping(value="/user/drop", method=RequestMethod.POST)
	public String drop(Hfu_MemberVO vo){
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		if(dao.execSelect(vo) == 1){
			dao.execQnaDelete(vo);
			dao.execIdDelete(vo);
		}
		return "redirect:/user/logout.do";
	}
	
	
	@RequestMapping("user/hfu_mypage_book.do")
	public ModelAndView hfu_mypage_book(HttpSession session){
		ModelAndView mv = new ModelAndView();
		BookDAO dao = sqlSession.getMapper(BookDAO.class);
		String member_id = (String)session.getAttribute("member_id");
		if(dao.execSelect3(member_id) == 1){
			String ok = "1";
			BookokVO vo = dao.execSelect2(member_id);
			mv.addObject("vo", vo);
			mv.addObject("ok", ok);
		}else{
			String ok = "2";
			mv.addObject("ok", ok);
		}
		mv.setViewName("user/hfu_member/hfu_mypage_book.jsp");
		return mv;
	}
	
	@RequestMapping("user/hfu_mypage_qna.do")
	public ModelAndView hfu_mypage_qna(HttpSession session){
		String member_id=(String)session.getAttribute("member_id");
		ModelAndView mv = new ModelAndView();
		Hfu_QnaDAO dao = sqlSession.getMapper(Hfu_QnaDAO.class);
		
		ArrayList<QnaVO> list = dao.execSelect2(member_id);
				
		mv.addObject("list", list);
		mv.setViewName ("user/hfu_member/hfu_mypage_qna.jsp");
		
		return mv;
	}
	@RequestMapping("user/hfu_mypage_wishlist.do")
	public ModelAndView hfu_mypage_wishlist(HttpSession session){		
		ModelAndView mv = new ModelAndView();
		Hfu_MemberDAO dao = sqlSession.getMapper(Hfu_MemberDAO.class);
		//회원 정보(추가정보) 불러오기
		String member_id = (String)session.getAttribute("member_id");
		
		//검색조건에 맞는 홀 불러오기
		ArrayList<Hfu_MemberVO> hallList = dao.execMemberWish(member_id);
		mv.addObject("hallList", hallList);
		mv.setViewName("user/hfu_member/hfu_mypage_wishlist.jsp");

		return mv;
	}
	@RequestMapping("user/hfu_mypage_infocheck.do")
	public String hfu_mypage_infocheck(){
		return "user/hfu_member/hfu_mypage_infocheck.jsp";
	}
	@RequestMapping("user/hfu_mypage_info.do")
	public String hfu_mypage_info(){
		return "user/hfu_member/hfu_mypage_info.jsp";
	}
	@RequestMapping("user/hfu_mypage_drop.do")
	public String hfu_mypage_drop(){
		return "user/hfu_member/hfu_mypage_drop.jsp";
	}
	@RequestMapping("user/hfu_help_idinquiry.do")
	public String hfu_help_idinquiry(){
		return "user/hfu_member/hfu_member_help_idinquiry.jsp";
	}
	@RequestMapping("user/hfu_help_pwinquiry.do")
	public String hfu_help_pwinquiry(){
		return "user/hfu_member/hfu_member_help_pwinquiry.jsp";
	}
	@RequestMapping("user/hfu_help_pwchange.do")
	public String hfu_help_pwchange(){
		return "user/hfu_member/hfu_member_help_pwchange.jsp";
	}
	@RequestMapping("user/hfu_help.do")
	public String hfu_help(){
		return "user/hfu_member/hfu_member_help.jsp";
	}
	@RequestMapping("user/hfu_join.do")
	public String hfu_join(){
		return "user/hfu_member/hfu_member_join.jsp";
	}
	@RequestMapping("user/hfu_join_admin.do")
	public String hfu_join_admin(){
		return "user/hfu_member/hfu_member_join_admin.jsp";
	}
	@RequestMapping(value = "user/hfu_join_user.do")
	public String mailForm() {
		return "user/hfu_member/hfu_member_join_user.jsp";
	}  
	 
}
