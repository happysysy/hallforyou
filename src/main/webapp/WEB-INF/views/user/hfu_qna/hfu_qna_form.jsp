<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.*" import="com.spring.vo.*"%>
<%@ page session = "true" %>  
<%	
	String member_id = (String)session.getAttribute("member_id");
	String hallname = (String)request.getAttribute("hallname");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > q&a</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/bootstrap.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="jquery-3.1.1.min.js"></script>
	<style>
	.contents{padding-top:20px;padding-bottom:80px;background:white;width:1200px;margin:auto;margin-top:20px;margin-bottom:20px;}
 	.qna{display:block;width:1200px;margin:auto;margin-top:20px;}
 	.qna_form{display:block;width:90%;margin:auto;border:2px dotted gray;margin-top:30px;}
 	img{padding:5px 8px;}
 	.qna_form_ul {display:block;width:100%;margin-top:30px;}
	li {  
	display:block;width:90%;list-style-type:none;margin-bottom:20px;}
	label {
	display:block;
	width:80px;		
	text-align:center;
	color:black;
	font-weight:bold;	
	padding:5px 8px;
	float:left;
	margin-right:40px;}
	.selectpicker{display:inline;width:620px;height:30px;}
	input {
	display:block;
	width:620px;
	padding:5px 8px;}
	li.button {display:block;width:95%;text-align:right;}  	
	span.save, span.list {
		display:inline-block;
 		width:80px;
 		padding:5px 8px;
 		text-align:center;
 		background:gray;
 		color:white;
 		font-size:10pt;
 		border-radius:4px;
	}
	span:hover{color:black;text-decoration:none;}
	span:visited{color:black;text-decoration:none;}
</style>
<script>
$.ajax({
	url : 'http://localhost:9000/hallforyou/user/hname.do',			
	dataType : "json",
	success : function(data) {				
		if(data.length !=0){
			for(var i=0; i<data.length;i++){						
				str = "<option value=" + data[i].hname +">"
					+ data[i].hname
					+ "</option>";							
				$("#hname").append(str);
			}
		
		}
	}
});
	$(document).ready(function(){
		$("#save").click(function(){
			if($("#categories").val()=='문의유형'){
 				alert("질문 유형을 선택해주세요");
 				return false;
 			}else if($("#title").val()==""){
				alert("제목 입력해주세요");
				$("#title").focus();
				return false;
			}else if($("#content").val()==""){
				alert("내용을 입력해주세요");
				$("#content").focus();
				return false;
			}
			QnaForm.submit();
		})
	})
</script>
</head>
<body>
	<!-- header -->
	 <c:choose>
 		<c:when test="${empty sessionScope.member_id}">
 			<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
 		</c:when>
 		<c:when test="${not empty sessionScope.member_id}">
 			<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
 		</c:when>
 	</c:choose>   
  <!-- <content> -->
<div class="contents">
	<div class="qna">
		<img src="http://localhost:9000/hallforyou/img/qna.gif">
		<form class="qna_form" name="QnaForm" action="hfu_qna_save.do" method="post">
			<ul class="qna_form_ul">
				<li>
					<label>카테고리</label>
					<select class="selectpicker" name="categories" id="categories">
					<option value="문의유형">문의유형</option>
					<option value="1">예약 문의</option>
					<option value="2">홀 문의</option>
					<option value="3">사이트문의</option>
					</select>
				</li>
				<li>
					<label>홀 이름</label>
					<select class="selectpicker" name="hname" id="hname">
					<option value="홀이름">홀을 선택해주세요.</option>
					</select>
				</li>
				<li>
					<label>제목</label>
					<input type="text" name="title" id="title"><br><br>
					<label>내용</label>
					<textarea rows=20 cols=85 name="content" id="content"></textarea>
				</li>
				<li class="qna_pw">
					<label>비밀번호</label>
					<input type="password" name="qna_pw" id="qna_pw"  maxlength="4" placeholder="4자리 입력해주세요"> 
				</li>
				<li class="button">
						<span class="save" id="save">저장</span>&nbsp;&nbsp;&nbsp;
						<a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">
							<span class="list">목록으로</span>
						</a>
				</li>
			</ul>
			<input type="hidden" name="member_id" value="${member_id}"/>
			</form>
	</div>
</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>