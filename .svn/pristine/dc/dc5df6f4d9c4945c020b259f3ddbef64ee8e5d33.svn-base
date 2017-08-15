<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.*" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HALL FOR YOU > Q&A LIST</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href="http://localhost:9000/hallforyou/js/jqeury-3.1.1.min.js" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/bootstrap.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.bootstrap.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.scroller.min.css" rel="stylesheet"/>
	<script src="http://localhost:9000/hallforyou/js/admin.js" type="text/javascript"></script>
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
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
	  	div.content div.qna{
	  		padding:20px;
	  		padding-bottom:40px;
	  	}
		div.content div.qna div.qna_list {
			width:85%;
			margin:auto;	
		}
		h1.qnatitle {			
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
		td.tno {	width:10%;	}
		td.tct{ width:15%; }
		td.ttitle { 
			width:30%; }
		.tid { width:15%; }
		.tdate { width:15%; }
		.thits { width:15%; }		
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
		<div class="qna">
		<h1 class="qnatitle">Q&A List</h1>
		
		<hr>
		<div class="qna_list">
			<table id="example">
				<thead>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>아이디</th>
					<th>등록날짜</th>
					<th>답변완료</th>
				</thead>
				<c:forEach items="${list}" var="vo">	
				<tr>
					<td class="tno">${vo.rno }</td>
					<c:choose>
						<c:when test="${vo.categories =='1'}">
						<td class="tct">예약문의</td>
						</c:when>
						<c:when test="${vo.categories =='2'}">
						<td class="tct">홀문의</td>
						</c:when>
						<c:when test="${vo.categories =='3'}">
						<td class="tct">페이지문의</td>
						</c:when>
					</c:choose>
					<td class="ttitle"><a href="http://localhost:9000/hallforyou/admin/qna_content.do?qno=${vo.qno }&rno=${vo.rno}">${vo.title }</a></td>
					<td class="tid">${vo.member_id }</td>
					<td class="tdate">${vo.qdate }</td>
					<c:choose>
						<c:when test="${vo.answer eq null}">
							<td class="thits">미완료</td>
						</c:when>
						<c:when test="${vo.answer ne null}">
							<td class="thits">완료</td>
						</c:when>
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