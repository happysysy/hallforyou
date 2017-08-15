<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page session = "true" %>     
<%@ page import = "com.spring.vo.*" %>
<%	String member_id = (String)session.getAttribute("member_id");
	BookokVO vo = (BookokVO)request.getAttribute("vo");
	String ok = (String)request.getAttribute("ok");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > mypage</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<style>
 		.contents{padding-top:20px;padding-bottom:40px;background:white;width:1200px;margin:auto;margin-top:20px;}
 		.hfu_mypage_qna{display:block;width:1200px;margin:auto;}
 		h3{display:inline-block;width:140px;text-align:center;}
 		
 		span.hfu_mypage_bookbtn {
			display:inline-block;padding:5px 8px;color:black;margin:10px 20px;
			text-align:center;border-radius:4px;border:2px solid black;}
		span.hfu_mypage_qnabtn:hover{text-decoration:none;}
	  	span.hfu_mypage_infobtn,span.hfu_mypage_qnabtn,span.hfu_mypage_wishbtn {
			display:inline-block;padding: 5px 8px;margin:10px 20px;color:#C3C3C3;
			text-align:center;border-radius:4px;border:1px solid gray;}
		span.hfu_mypage_infobtn:hover, span.hfu_mypage_bookbtn:hover,span.hfu_mypage_wishbtn:hover {border:2px solid gray;background-color:#FFDFDC;color:gray;}
		img.hfu_mp_img{width:60px;height:40px;}
		
		/*q&a 테이블*/
		.qna_list{display:block;width:90%;margin:auto;}
		table{width:100%;text-align:center;}
		table th{text-align:center;padding:7px;border-top:2px solid gray;border-bottom:2px solid gray;background:#e2e2e2;}
		table td{padding:10px;font-size:11pt;}
		.ttitle{text-align:left;}
		span.write{display:inline-block;padding:5px 8px;border-radius:4px;float:right;}
 		color:white;font-wright:bold;text-align:center;float:right; margin-bottom:20px;}
	  	a:link{color:black;text-decoration:none;}
	  	a:hover{text-decoration: underline;}
	  	a:visited{color:black;}
 	</style>
</head>
<body>
	<!-- ########## header start ########## -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>
	          
	<!-- ########## content start ########## -->
	<div class="contents">
		<div class="hfu_mypageqna">
		<h3>마이페이지</h3>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_qna.do?mamber_id=${member_id}">
		<span class="hfu_mypage_qnabtn"><img src="http://localhost:9000/hallforyou/img/chat.png" class="hfu_mp_img">질문내역</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_book.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">예약확인</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_wishlist.do">
		<span class="hfu_mypage_wishbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">찜 목록</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_infocheck.do">
		<span class="hfu_mypage_infobtn"><img src="http://localhost:9000/hallforyou/img/chat.png" class="hfu_mp_img">회원정보</span>
		</a>
		<div class="book_check">
			<h4 class="checkform">예약서</h4><hr>
		</div>
		<% if(ok == "2"){ %>	
		<% }else{ %>	 
		<table style="width:400px;">
			<tr>
				<td class="tmenu" style="text-align:right">이름</td>
				<td><input class="scon" type="text" name="mname" id="mname" value="<%= vo.getMname() %>" readonly></input>	
			</tr>
			<tr>
				<td class="tmenu" style="text-align:right">홀 이름</td>
				<td><input class="scon" type="text" name="" id="" value="<%= vo.getHname() %>" readonly></input></td>
			</tr>
			<tr>
				<td class="tmenu" style="text-align:right">날짜</td>
				<td><input class="scon" type="text" name="wdate" id="wdate" value="<%= vo.getWdate() %>" readonly></input></td>
			</tr>
			<tr>
				<td class="tmenu" style="text-align:right">시간</td>
				<td><input class="scon" type="text" name="wtime" id="wtime" value="<%= vo.getWtime() %>" readonly></input></td>
			</tr>
			<tr>
				<td class="tmenu" style="text-align:right">홀 타입</td>
				<td><input class="scon" type="text" name="" id="" value="<%= vo.getHtype() %>" readonly></input></td>
			</tr>
		</table>	
		<% } %>
		</div>
	</div>
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>