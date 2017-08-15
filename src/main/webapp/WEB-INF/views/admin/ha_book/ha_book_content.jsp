<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "com.spring.vo.*" %>
<%
	BookVO vo = (BookVO)request.getAttribute("vo");
    String rno = (String)request.getAttribute("rno");
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HALL FOR YOU > BOOK</title>
<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url : 'http://localhost:9000/hallforyou/admin/halltype.do?hno=${vo.hno}',			
			dataType : "json",
			success : function(data) {				
				if(data.length !=0){
					for(var i=0; i<data.length;i++){						
						str = "<option value=" + data[i].typename +">"
							+ data[i].typename
							+ "</option>";							
						$("#typename").append(str);
					}
				
				}
			}
		});
		
		$("#save").click(function(){
			if($("#mname").val() == ""){
				alert("이름을 입력하세요");
				$("#mname").focus();
				return false;
				
			}else if($("#wdate").val() == ""){
				alert("날짜를 입력하세요");
				$("#wdate").focus();
				return false;
			}else if($("#wtime").val() == ""){
				alert("시간을 입력하세요");
				$("#wtime").focus();
				return false;
			}
			
			bookForm.submit();
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
  	div.content div.book{
  		padding:20px;
  		padding-bottom:40px;
  	}
	div.content div.book div.book_form {
		width:1000px;
		margin:auto;
	}
	div.book_check {
		width:1000px;
		margin:auto;
	}
	h1.booktitle {			
		border-bottom:1px solid gray;
	}
	h4 {
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
	ul { list-style-type:none;}
	span { display:inline-block; }
	span.btn {
	  	display:inline-block;
	  	width:15%; 		
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
	span.month {
		display:inline-block;
		margin-right:10px;
	}
	span.date {
		display:inline-block;
		margin-right:10px;
	}
	span.scon {
		margin-left:20px;
	}
	input.scon {
		margin-left:20px;
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
		<div class="book">
		<h1 class="booktitle">BOOK</h1>
		
		<hr>
		<div class="book_form">
			<h4 class="applyform">신청서</h4><hr>
			<ul>
				<li>
					<span class="tmenu">ID</span>
					<span class="tcon"><%=vo.getMember_id() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">이름</span>
					<span class="tcon"><%=vo.getMname() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">연락처</span>
					<span class="tcon"><%=vo.getMphone() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">Hall</span>
					<span class="tcon"><%=vo.getHname() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">날짜</span>
					<span class="tcon"><%=vo.getWdate() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">HALL TYPE</span>
					<span class="tcon"><%=vo.getHtype() %></span>
				</li>
			</ul>
		</div>
		<hr>
		<div class="book_check">
		<form name="bookForm" action="book_save.do" method="post">
		<h4 class="checkform">예약서</h4><hr>
			<ul>
				<li>
					<span class="tmenu">HNO</span>
					<span class="tcon"><%=vo.getHno() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">HNAME</span>
					<span class="tcon"><%=vo.getHname() %></span>
				</li>
				<br>
				<li>
					<span class="tmenu">이름</span>
					<input class="scon" type="text" name="mname" id="mname"></input>	
				</li>
				<br>
				<li>
					<span class="tmenu">날짜</span>
					<input class="scon" type="text" placeholder="ex)2017/01/01" name="wdate" id="wdate"></input>
				</li>
				<br>
				<li>
					<span class="tmenu">시간</span>
					<input class="scon" type="text" placeholder="ex)11:00" name="wtime" id="wtime"></input>
				</li>
				<br>
				<li>
					<span class="tmenu">HALL TYPE</span>
					<span class="scon">
						<select class="selectpicker" id="typename" name="typename">
						<option value="선택">홀선택</option>
						</select>
					</span>
				</li>
			</ul>
			<a href="http://localhost:9000/hallforyou/admin/book_datatable.do">
			<span class="btn">목록으로</span>
			</a>
			<a href="http://localhost:9000/hallforyou/admin/list_delete.do?bno=<%=vo.getBno()%>">
				<span class="btn">삭제</span>
			</a>
			<span class="btn" id="save">등록</span>
			
			<input type="hidden" name="bno" value="<%=vo.getBno() %>"/>
			<input type="hidden" name="hno" value="<%=vo.getHno() %>"/>
			<input type="hidden" name="hname" value="<%=vo.getHname() %>"/>
			</form>
		</div>
		
		</div>
	</div>
</body>
</html>