<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.QnaVO" %>  
<%@ page session = "true" %>
<%
	QnaVO vo = (QnaVO)request.getAttribute("vo");
	String member_id=(String)session.getAttribute("member_id");
%> 
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
	<link href="http://localhost:9000/hallforyou/css/user/bootstrap.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/js/jqeury-3.1.1.min.js" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.scroller.min.css" rel="stylesheet"/>
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>	
 	<script>
	 	$(document).ready(function(){
			$("#hfu_qp_checkbtn").click(function(){
				QnaPwForm.submit();
			})
		})
    </script>
	<style>
		.contents{padding-top:20px;padding-bottom:40px;background:white;width:1200px;margin:auto;margin-top:20px;margin-bottom:20px;}
 		.qna{display:block;width:1200px;margin:auto;margin-top:20px;}
 		img{float:left;margin:5px;}
		div p{display:block;font-size:9pt;}
		.hfu_qp_checkdiv{width:90%;margin:auto;border:2px dotted gray;padding:20px 0px 30px 0px;margin-top:30px;}
		.qna_list{display:block;width:90%;margin:auto;margin-top:10px;}
		span.hfu_qp_title{display:block;width:90%;font-size:15pt;margin:auto;text-align:center;font-weight:bold;border-bottom:2px double gray;}
		span.hfu_qp_caution{display:block;width:100%;text-align:center;margin-top:30px;font-size:10pt;padding:10px 0px 20px 0px;}
		.hfu_qp_infocheck{display:block;width:90%;margin:auto;border:1px solid gray;padding:30px 50px;}
		.hfu_qp_infocheck li{list-style-type:none;margin:auto;text-align:center;padding:10px;}
		span.hfu_qp_checkbtn{display:inline-block;width:80px;margin:10px 20px;text-align:center;padding:5px 8px;border-radius:4px;background:gray;
							 font-size:12pt;color:white;}
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
		<img src="http://localhost:9000/hallforyou/img/qna.gif">
		<p>홀포유 사이트나 홀 이용에 대해 궁금한 사항이 있으실경우<br>
		언제든지 본 게시판을 이용해 주시기 바랍니다</p>
		<div class="hfu_qp_checkdiv">
		<form class="qna_list" name="QnaPwForm" action="qna_pw_check.do" method="post">
			<span class="hfu_qp_title">비밀글보기</span>
			<span class="hfu_qp_caution">이 글은 비밀글입니다. 비밀번호 4자리를 입력하여 주세요.</span>
			<ul class="hfu_qp_infocheck">
			<li>
			<label>비밀번호</label>
			<input type="password" name="hfu_qp_pw" id="hfu_qp_pw" size="30" maxlength="4">
			</li>
			<li>
			<span class="hfu_qp_checkbtn" id="hfu_qp_checkbtn">확인</span>
			<a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">
			<span class="hfu_qp_checkbtn" id="hfu_qp_cancelbtn">취소</span>
			</a>
			</li>
			</ul>
			<input type="hidden" name="qno" value="${qno}"/>			
		</form>
		</div>
	</div>
</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>