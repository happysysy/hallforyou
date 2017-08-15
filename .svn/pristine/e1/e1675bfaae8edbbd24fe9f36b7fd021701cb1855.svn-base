<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HALL FOR YOU > MEMBER LIST</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><!-- 테이블헤드에 화살표표시 -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script><!-- 변화없음 -->
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><!-- 변화없음 -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script><!-- 변화없음 -->
	<link href="http://localhost:9000/hallforyou/js/jqeury-3.1.1.min.js" rel="stylesheet"/><!-- 변화없음 -->
	<link href="http://localhost:9000/hallforyou/css/admin/bootstrap.min.css" rel="stylesheet"/><!-- 제목크기변화(없으면 제목 커짐) -->
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.min.css" rel="stylesheet"/><!-- 상단 show 위치 변화 -->
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.bootstrap.min.css" rel="stylesheet"/><!-- 테이블헤드 화살표표시 -->
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.scroller.min.css" rel="stylesheet"/><!-- 변화없지만 스크롤이 뭔지 모르겠다 -->
	<script src="http://localhost:9000/hallforyou/js/admin.js" type="text/javascript"></script><!-- 변화없음 -->
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script><!-- 없으면 안됨, 제일중요, 기능전부 -->
	<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script><!-- show, search, page -->
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/>
  	<script>
	/* Data Table(합계, 득표수 정렬, 검색) */
	    var table;
	    $(document).ready(function() {
	        table= $('#example').DataTable({
	             "columns": [
	                             { "orderable": true },
	                             { "orderable": true },
	                             { "orderable": true },
	                             { "orderable": true },
	                             { "orderable": true },
	                             { "orderable": true }
	                         ],
	             "deferRender" : true,
	             "aaSorting": []    // datatable 첫 로우에 대한 자동 sorting 금지
	             
	         });
	    });
    </script>
  	
  	<style>
	  	body {
			background:#E1E1E1;
		}
		div.content{
			width:1200px;
			margin:auto;
			background:white;  
		}
	  	div.content div.member{
	  		padding:20px;
	  		padding-bottom:40px;
	  	}
		div.content div.member div.member_list {
			width:85%;
			margin:auto;	
		}
		h1.membertitle {			
			border-bottom:1px solid gray;
		}
		table{
			width:100%;
			border:1px solid gray;
			margin-bottom:20px;
			
		}
		th, td {
			border:1px solid gray;
			padding:7px 0px;
			text-align:center;			
		}
		a { text-decoration:none; }
		th { 
			background:#A6A6A6;			
		}
		.tno {	width:8%;	}
		td.tid { 
			width:21%; }
		.tname { width:21%; }
		.trole { width:19%; }
		.tdt { width:21%; }	
		.tsubmit{
			width:10%; 
		}	
		img { 			
			margin-left:60px;
		}
		
		span.home {
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
		<div class="member">
		<h1 class="membertitle">Member List</h1>
		<hr>
		<div class="member_list">
			<table id="example">
				<thead>
					<th>번호</th>
					<th>role</th>
					<th>아이디</th>
					<th>이름</th>
					<th>등록날짜</th>
					<th>승인</th>
				</thead>
				<c:forEach items="${list }" var="vo">
				<tr>
					<td class="tno">${vo.rno}</td>
					<c:choose>
						<c:when test="${vo.role == '1'}">
							<td class="trole" id="trole">USER</td>
						</c:when>
						<c:when test="${vo.role == '2'}">
							<td class="trole" id="trole">ADMIN</td>
						</c:when>
						<c:when test="${vo.role == '3'}">
							<td class="trole" id="trole">ADMIN</td>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${vo.role =='1' }">
							<td class="tid"><a href="http://localhost:9000/hallforyou/admin/member_content.do?id=${vo.id }&rno=${vo.rno}">${vo.id }</a></td>
						</c:when>
						<c:otherwise>
							<td class="tid"><a href="http://localhost:9000/hallforyou/admin/admin_content.do?id=${vo.id }&rno=${vo.rno}">${vo.id }</a></td>
						</c:otherwise>
					</c:choose>
					<td class="tname">${vo.name }</td>
					<td class="tdt">${vo.dt }</td>
					<c:choose>
						<c:when test="${vo.submit == '2' }">
							<td class="tsubmit">미승인</td>
						</c:when>
						<c:when test="${vo.submit == '3' }">
							<td class="tsubmit">승인 완료</td>
						</c:when>
						<c:otherwise>
							<td class="tsubmit"></td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<a href="http://localhost:9000/hallforyou/ha_index.do">
			<span class="home">HOME</span>
		</a>
		</div>
	</div>
</body>
</html>