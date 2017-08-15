<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "com.spring.vo.*" %>
<%
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	String id = (String)request.getAttribute("id");
	String rno = (String)request.getAttribute("rno");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HALL FOR YOU > MEMBER PAGE</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style>
  		body {
			background:#E1E1E1;
		}
		div.content{
			width:1200px;
			margin:auto;
			background:white;  
		}
	  	div.content div.memberpage{
	  		padding:20px;
	  		padding-bottom:40px;
	  	}
		h1.membertitle {			
			border-bottom:1px solid gray;
		}
		h4.profile, h4.woption {
			display:block;
			width:150px;
			text-align:center;
			background:gray;
			color:black;	  
			font-weight:bold;		
	  		border-radius:4px;
	  		border:2px double white;			
			padding:5px;
		}
		div.member_context, div.woption {
			width:1000px;
			margin:auto;
		}
		ul { list-style-type:none;}
		
		span.member_list_back {
	  		display:inline-block;
	  		width:20%; 		
	  		background:#1C1C1C;
	  		padding:5px 8px;
	  		color:white;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;
	  		float:right; 
	  		margin-bottom:10px;	
	  	}
	  	
	  	span {
	  		display:inline-block;
	  	}
	  	span.tmenu {
	  		border:1px solid black;
	  		width:150px;
	  		text-align:center;
	  		font-weight:bold;
	  		
	  	}
	  	span.tcon {
	  		width:600px;
	  		margin-left:20px;
	  		font-size:18px;
	  	}	  	
  	</style>
</head>
<body>
	<!-- header -->
	<c:choose>
		<c:when test="${sessionScope.member_id eq 'mainadmin'}">
			<c:import url="http://localhost:9000/hallforyou/ha_header.do"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="http://localhost:9000/hallforyou/ha_hmheader.do?admin_id=${sessionScope.member_id}"></c:import>
		</c:otherwise>
	</c:choose>
	
	
	<div class="content">
		<div class="memberpage">
		<h1 class="membertitle">Member Page</h1>
		<a href="http://localhost:9000/hallforyou/admin/member_datatable.do">
			<span class="member_list_back">목록으로</span>
		</a>
		<hr>
		<div class="member_context">
		<h4 class="profile">기본 정보</h4><hr>
			<ul>
				<li>
					<span class="tmenu">번호</span>
					<span class="tcon"><%=rno %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">ID</span>
					<span class="tcon"><%=vo.getId() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">PASSWORD</span>
					<span class="tcon"><%=vo.getPw()%></span>
				</li>
				<br>
				<li>
					<span class="tmenu">이름</span>
					<span class="tcon"><%=vo.getName() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">EMAIL</span>
					<span class="tcon"><%=vo.getEmail() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">PHONE</span>
					<span class="tcon"><%=vo.getPhone() %></span>
				</li>
			</ul>
		</div>
		<hr>
		<div class="woption">
		<h4 class="woption">추가 정보</h4><hr>
			<ul>
				<li>
					<span class="tmenu">지역</span>
					<span class="tcon"><%=vo.getCity()%> <%=vo.getGu() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">HALL TYPE</span>
					<span class="tcon"><%=vo.getHtype() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">MENU TYPE</span>
					<span class="tcon"><%=vo.getMenu() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">MENU PRICE</span>
					<span class="tcon"><%=vo.getMprice_min() %> ~ <%=vo.getMprice_max() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">GUEST</span>
					<span class="tcon"><%=vo.getGuest() %>명</span>
				</li>
			</ul>
		</div>
		</div>
	</div>
</body>
</html>