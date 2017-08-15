<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session = "true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.vo.*" %>
<%	String member_id = (String)session.getAttribute("member_id");
	String hno = (String)session.getAttribute("hno");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HALL FOR YOU</title>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#hall_insert").click(function(){
				alert("이미 등록된 홀이 있습니다.")
			});
		});
	</script>
	<style>
		body.hall {
			background:#E1E1E1;
		}
		div.main {
			background:white;
		}
	
		div.main{
			width:1200px;
			margin:auto;
		}
		
		div.top{
			padding-left:180px;
		}
		
		div.hm_bottom{
			padding-left:180px;
		}
		
		span{
			display:inline-block;
			background:gray;
			width:300px;
			height:150px;
			font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
			text-align:center;
			margin-bottom:50px;
			margin-top:50px;
			margin-left:50px;
		}
		div.top ul li span a{
			display:block;
			text-decoration:none;
			padding:61px;
			color:white;
		}
		div.bottom ul li span a{
			display:block;
			text-decoration:none;
			padding:61px;
			color:white;
		}
		
		div.hm_bottom ul li span a{
			display:block;
			text-decoration:none;
			padding:61px;
			color:white;
		}
		
		ul{
			list-style-type:none;
		}
		li{
			display:inline;
		}
	
	</style>
</head>
<body class="hall">
	<!-- header -->
	<c:choose>
		<c:when test="${sessionScope.member_id eq 'mainadmin'}">
			<c:import url="http://localhost:9000/hallforyou/ha_header.do"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="http://localhost:9000/hallforyou/ha_hmheader.do?admin_id=${sessionScope.member_id}"></c:import>
		</c:otherwise>
	</c:choose>
 	<!-- content -->
 	<input type="hidden" id="mid" value="<%=member_id%>"/>
 	<div style="padding: 15px;"></div>
 	<c:choose>
		<c:when test="${sessionScope.member_id eq 'mainadmin'}">			
			<div class="main">
				<div class="top">
					<ul>
						<li>
							<span class="member"><a href="http://localhost:9000/hallforyou/admin/member_datatable.do">회원리스트</a></span>
							<span class="event"><a href="http://localhost:9000/hallforyou/admin/event.do">EVENT 관리</a></span>
						</li>
					</ul>
				</div>
				<div class="bottom">
					<ul>
						<li>
							<span class="hall"><a href="http://localhost:9000/hallforyou/admin/hall.do">HALL 게시물 관리</a></span>
							<span class="book"><a href="http://localhost:9000/hallforyou/admin/book_datatable.do">예약 상담 관리</a></span>
							<span class="qna"><a href="http://localhost:9000/hallforyou/admin/qna_datatable.do">Q&A</a></span>
						</li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:when test="${sessionScope.member_id ne 'mainadmin'}">
			<!-- content -->
			<div class="main">
				<div class="top">
					<ul>
						<li>
							<% if(hno.equals("0")){ %>
								<span class="event"><a href="http://localhost:9000/hallforyou/admin/hall_insert.do">홀삽입</a></span>
							<% }else{ %>
								<span class="event" id="hall_insert"><a>홀삽입</a></span>
							<%} %>
							<span class="hall"><a href="http://localhost:9000/hallforyou/admin/hall_content.do">MY HALL</a></span>
						</li>
					</ul>
				</div>
				<div class="hm_bottom">
					<ul>
						<li>
							<span class="book"><a href="http://localhost:9000/hallforyou/admin/book_datatable.do">예약 상담 관리</a></span>
							<span class="qna"><a href="http://localhost:9000/hallforyou/admin/qna_datatable.do">Q&A</a></span>
						</li>
					</ul>
				</div>
			</div>
		</c:when>
	</c:choose>
	
	<!-- footer -->
	
</body>
</html>