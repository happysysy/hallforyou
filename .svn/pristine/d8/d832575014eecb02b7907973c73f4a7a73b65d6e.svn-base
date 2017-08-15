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
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#hfu_qna_delete').click(function(){
				if (confirm("정말 삭제하시겠습니까??") == true){    //확인
					ContentForm.submit();
				}else{   //취소
				    return;
				}				
			});
		});
	</script>
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
 	.qna_img{float:left;margin:5px;}
 	div p{display:block;font-size:9pt;}
 	.qna_content{display:block;width:90%;height:500px;margin:auto;margin-top:70px;}
 	img{padding:5px 8px;}
 	table{width:100%;text-align:center;border-collapse:collapse;}
	table th{text-align:center;padding:7px;border-bottom:2px solid gray;border-top:2px solid gray;background:#e2e2e2;}
	table td{padding:10px;font-size:11pt;}
	.title{width:30%;}
	.hname{width:30%;}
	li{list-style-type:none;}
	li.qna_form{display:block;width:95%;margin:20px 0px 70px 0px;text-align:left;}
	li p{margin-top:10px;display:block;width:100%;font-size:11pt;}
	a:link{color:black;text-decoration:none;}
	a:visited{color:black;text-decoration:none;}
	a:hover{text-decoration:none;}
	span.btn {display:inline-block;width:70px;padding:5px 8px;margin:30px 5px;
	  					 font-size:10pt;color:white;background:gray;border-radius:4px;text-align:center;float:right;}
	.btn:hover{color:white;}
</style>
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
		<img  class="qna_img" src="http://localhost:9000/hallforyou/img/qna.gif">
		<p>답변이 완료된 질문에 대한 재질문을 원하시는 경우<br>
		질문을 새로 작성해 주시기 바랍니다</p>
		<form class="qna_content" name="ContentForm" action="hfu_qna_delete.do" method="post">
			<table>
			<tr>
				<th class="rno">${rno}</th>
				<c:choose>
						<c:when test="${vo.categories =='1'}">
						<th class="category">예약문의</td>
						</c:when>
						<c:when test="${vo.categories =='2'}">
						<th class="category">홀문의</td>
						</c:when>
						<c:when test="${vo.categories =='3'}">
						<th class="category">페이지문의</td>
						</c:when>
					</c:choose>	
				<th class="hname">${vo.hname} </th>
				<th class="title">${vo.title}</th>
				<th class="id">${vo.member_id}</th>
				<th class="qdate">${vo.qdate}</th>
			</tr>
			</table>
			<ul>
		    <li class="qna_form">
				<img class="qna_img2" src="http://localhost:9000/hallforyou/img/qna_question.png" width="110" height="100" >
				<p>${vo.content}</p>
			</li>
			<hr>
			<li class="qna_form">
				<img class="qna_img2" src="http://localhost:9000/hallforyou/img/qna_answer.png" width="110" height="100" >
				<p>${vo.answer}</p>
			</li>
			</ul>	  
			 <c:choose>
 				<c:when test="${empty vo.answer}">
		 			<a href="http://localhost:9000/hallforyou/user/hfu_qna_update.do?no=${vo.qno}&rno=${rno}">
						<span class="btn">수정</span>
					</a>
						<span class="btn" id="hfu_qna_delete">삭제</span>
				
					<a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">
						<span class="btn">목록</span>
					</a>
 		     </c:when>
 			<c:when test="${not empty vo.answer}">
					<span class="btn" id="hfu_qna_delete">삭제</span>			
					<a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">
						<span class="btn">목록</span>
					</a>
 			</c:when>
 	</c:choose>  	
		  <input type="hidden" name="qno" value="${vo.qno} "/> 
		</form>
	</div>
</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>