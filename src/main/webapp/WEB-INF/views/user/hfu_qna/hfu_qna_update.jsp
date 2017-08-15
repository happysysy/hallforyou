<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page session = "true" %>    
<%	String member_id = (String)session.getAttribute("member_id");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > q&a</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/bootstrap.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="jquery-3.1.1.min.js"></script>
	<style>
		html {overflow: scroll;}
	
		footer, header {
			display:block;
			width:100%;
		}
		
		 body {
		 	display:block;
		 	width:100%;
			background-color:#FFDFDC;
		 }
		.contents{padding-top:20px;padding-bottom:80px;background:white;width:1200px;margin:auto;margin-top:20px;margin-bottom:20px;}
	 	.qna{display:block;width:1200px;margin:auto;margin-top:20px;}
	 	.qna_update{display:block;width:90%;margin:auto;border:2px dotted gray;margin-top:30px;}
	 	img{padding:5px 8px;}
	 	.qna_update_ul {display:block;width:100%;margin-top:30px;}
		li {  
		display:block;width:90%;list-style-type:none;margin-bottom:20px;}
		label {
		display:block;
		width:80px;	
		padding:5px 8px;	
		text-align:center;
		color:black;
		font-weight:bold;	
		float:left;
		margin-right:40px;}
		.categories{display:inline;width:620px;padding:5px 8px;}
		input {
		display:block;
		width:620px;
		padding:5px 8px;}
		li.button {display:block;width:95%;text-align:right;}  	
		span.save, span.cancel {
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
		$(document).ready(function(){
			$("#save").click(function(){
				if($("#title").val()==""){
					alert("제목을 입력해주세요");
					$("#title").focus();
					return false;
				}else if($("#content").val()==""){
					alert("내용을 입력해주세요");
					$("#content").focus();
					return false;
				}
				UpdateForm.submit();
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
		<form class="qna_update" name="UpdateForm" action="qna_update_save.do" method="post">
			<ul class="qna_update_ul">
				<li>
					<label>카테고리</label>
					<c:choose>
					<c:when test="${vo.categories =='1'}">
					<span class="categories" readonly>예약 문의</span>
					</c:when>
					<c:when test="${vo.categories =='2'}">
					<span class="categories" readonly>홀 문의</span>
					</c:when>
					<c:when test="${vo.categories =='3'}">
					<span class="categories" readonly>페이지 문의</span> 
					</c:when>
					</c:choose>
					</select>					
				</li>
				<li>
					<label>제목</label>
					<input type="text" name="title" id="title" value="${vo.title}"><br><br>
					<label>내용</label>
					<textarea rows=20 cols=85 name="content" id="content">${vo.content}</textarea>
				</li>
				<li class="button">
						<span class="save" id="save">수정완료</span>&nbsp;&nbsp;&nbsp;
						<a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">
							<span class="cancel">취소</span>
						</a>
				</li>
			</ul>
			<input type="hidden" name="qno" value="${vo.qno} "/>
			</form>
	</div>
</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>