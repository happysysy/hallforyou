<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	String member_id = (String)request.getParameter("member_id");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Hall for you</title>
	
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/bootstrap.css">
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
</head>
	<header>
		<div class="hs_manu">
		<nav>
				<ul>
					<li><a href="http://localhost:9000/hallforyou/user/logout.do">로그아웃</a></li>
					<li><span>|</span></li>
					<li><a href="http://localhost:9000/hallforyou/user/hfu_mypage_qna.do?member_id=${member_id}">마이 페이지</a></li>
					<li><span>|</span></li>
					<li><a href="http://localhost:9000/hallforyou/user/hfu_mypage_infocheck.do">정보수정</a></li>
				</ul>
			</nav>
			
			<ul class="hs_ul">
			<li><span class="hfu"><a class="hfua" href="http://localhost:9000/hallforyou/user/hfu_index.do">HALL FOR YOU</a></span></li>
				
				<li><a href="http://localhost:9000/hallforyou/user/hfu_hallsearch.do">HALL</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_myhall.do">MY HALL</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_event.do" target="_top">EVENT</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">Q&A</a></li>
			</ul>
		</div>
	</header>
</html>