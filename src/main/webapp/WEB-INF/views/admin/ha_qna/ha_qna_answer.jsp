<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import = "com.spring.vo.*" %>
<%
	QnaVO vo = (QnaVO)request.getAttribute("vo");
	String rno = (String)request.getAttribute("rno");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HALL FOR YOU > Q & A</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	  	div.content div.qna{
	  		padding:20px;
	  		padding-bottom:40px;
	  	}
		div.content div.qna div.qna_form {
			width:70%;
			margin:auto;
		}
		
		div.qna_answer {
			width:70%;
			margin:auto;
		}
		div.btn_qna {
			width:70%;
			margin:auto;
		}
		h1.qnatitle {			
			border-bottom:1px solid gray;
		}
		table{
			width:110%;
			border:1px solid gray;
			margin-bottom:20px;
			
		}
		th, td {
			border:1px solid gray;
			padding:7px 0px;
			text-align:center;			
		}
		th { 
			background:#A6A6A6;			
		}		
		td.ttile { 
			width:30%; 
			text-align:left;
			text-indent:10px;
			padding:10px;
			line-height:1.8;
		}
		.tct { width:20%;}
		.tid { width:20%; }
		.trno {width:10%;}
		.tdate { width:20%; }	
	  	span {
	  		display:inline-block;	  		 		
	  		background:#1C1C1C;	  		
	  		color:white;
	  		font-size:13px;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;	  	
	  		margin-top:20px;
	  		margin-bottom:10px;	 
	  		float:left; 			
	  	}	
	  	span.list {
	  		width:20%;
	  		padding:8px 8px;	  		
	  	}
	  	span.update, span.delete {
	  		width:15%;
	  		padding:8px 8px;
	  	}
	  	
	  	a { text-decoration:none;}
	  	
	  	ul {
			display:block;
			width:100%;		
			
		}
		li {
			display:block;
			width:100%;
			list-style-type:none;
			margin-bottom:13px;
			margin-left:-40px;
		}
		
		label {
			display:block;
			width:17%;		
			text-align:center;
			background:gray;
			color:white;	
			padding:4px 10px;
			
			margin-right:10px;
			
		} 	
  	</style>
  	<script>
  		$(document).ready(function(){
			
			$("#update").click(function(){
				if($("#answer").val() == ""){
					alert("답변을 입력하세요");
					$("#answer").focus();
					return false;
				}
				
				qnaUpdateAnswer.submit();
				
			});
			
		});
  	</script>	
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
		<h1 class="qnatitle">Q & A</h1>
		<hr>
		<div class="qna_form">
			<table>			
				<tr>
					<th class="trno" name="rno"><%=rno %></th>
					<% if(vo.getCategories().equals("1")) {%>
					<th class="tct" name="categories">예약문의</th>
					<% }else if(vo.getCategories().equals("2")) {%>
					<th class="tct" name="categories">홀문의</th>
					<% }else if(vo.getCategories().equals("3")) { %>
					<th class="tct" name="categories">페이지문의</th>
					<% } %>					
					<th class="ttile" name="title"><%=vo.getTitle() %></th>
					<th class="tid" name="member_id"><a href=""><%=vo.getMember_id() %></a></th>
					<th class="tdate" name="qdate"><%=vo.getQdate() %></th>
				</tr>
				<tr>					
					<td class="ttile" colspan="5" name="content">					
						<p><%=vo.getContent() %></p>
					</td>					
				</tr>				
			</table>
		</div>
		
		
		<form name="qnaUpdateAnswer" action="qna_answer_update.do" method="post">
			<div class="qna_answer">
				<ul>	
					<li>
						<label>답변</label>
						<textarea rows="10" cols="120" name="answer" id="answer"></textarea>
					</li>
				</ul>
			
			</div>
		
			<div class="btn_qna">
					<span class="update" id="update">답변 저장</span>
				<a href="">
					<span class="delete">삭제</span>
				</a>
				<a href="http://localhost:9000/hallforyou/admin/qna_datatable.do">
					<span class="list">목록으로</span>
				</a>
			</div>
		 <input type="hidden" name="qno" value="<%=vo.getQno() %>"/>
		 <input type="hidden" name="rno" value="<%=vo.getRno() %>"/>
		</form>
		</div>
	</div>	
</body>
</html>