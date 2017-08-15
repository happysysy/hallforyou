<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.QnaVO" %>
<%@ page session = "true" %>     
<%	String member_id = (String)session.getAttribute("member_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > mypage</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script>
 		var table;
 		$.noConflict();
 		jQuery(document).ready(function($){
 			table = $('#hfu_qna_table').DataTable({});
 		});
 	</script>
 	<style>
 		.contents{padding-top:20px;padding-bottom:40px;background:white;width:1200px;margin:auto;margin-top:20px;}
 		.hfu_mypage_qna{display:block;width:1200px;margin:auto;}
 		h3{display:inline-block;width:140px;text-align:center;}
 		span.hfu_mypage_qnabtn {
			display:inline-block;padding:5px 8px;color:black;margin:10px 20px;
			text-align:center;border-radius:4px;border:2px solid black;}
		span.hfu_mypage_qnabtn:hover{text-decoration:none;}
	  	span.hfu_mypage_infobtn,span.hfu_mypage_bookbtn {
			display:inline-block;padding: 5px 8px;margin:10px 20px;color:#C3C3C3;
			text-align:center;border-radius:4px;border:1px solid gray;}
		span.hfu_mypage_infobtn:hover, span.hfu_mypage_bookbtn:hover {border:2px solid gray;background-color:#FFDFDC;color:gray;}
		img.hfu_mp_img{width:60px;height:40px;}
		
		/*q&a ���̺�*/
		.qna_list{display:block;width:90%;margin:auto;}
		table{width:100%;text-align:center;}
		table th{text-align:center;padding:7px;border-top:2px solid gray;border-bottom:2px solid gray;background:#e2e2e2;}
		table td{padding:10px;font-size:11pt;}
		.ttitle{text-align:left;}
		span.write{display:inline-block;padding:5px 8px;border-radius:4px;float:right;}
 		color:white;font-wright:bold;text-align:center;float:right; margin-bottom:20px;}
	  	a:link{color:black;text-decoration:none;}
	  	a:hover{text-decoration: underline;}
	  	a:visited{color:black;}
 	</style>
</head>
<body>
	<!-- ########## header start ########## -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>
	          
	<!-- ########## content start ########## -->
	<div class="contents">
		<div class="hfu_mypageqna">
		<h3>����������</h3>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_qna.do?mamber_id=${member_id}">
		<span class="hfu_mypage_qnabtn"><img src="http://localhost:9000/hallforyou/img/chat.png" class="hfu_mp_img">��������</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_book.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">����Ȯ��</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_wishlist.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">�� ���</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_infocheck.do">
		<span class="hfu_mypage_infobtn"><img src="http://localhost:9000/hallforyou/img/chat.png" class="hfu_mp_img">ȸ������</span>
		</a>
		
		<form class="qna_list" name="QnaForm" action="" method="post">	
		<a href="http://localhost:9000/hallforyou/user/hfu_qna_form.do">
			<span class="write">�����Ϸ�����></span>
		</a>
			<table id="hfu_qna_table">
			<thead>
				<th class="hno">��ȣ</th>
				<th class="category">ī�װ�</th>
				<th class="title">����</th>
				<th class="id">�ۼ���</th>
				<th class="qdate">�ۼ���</th>
			</thead>
			<c:forEach items="${list}" var="vo">	
				<tr>
					<td class="rno">${vo.rno}</td>	
					<c:choose>
						<c:when test="${vo.categories =='1'}">
						<td class="category">���๮��</td>
						</c:when>
						<c:when test="${vo.categories =='2'}">
						<td class="category">Ȧ����</td>
						</c:when>
						
						<c:when test="${vo.categories =='3'}">
						<td class="category">����������</td>
						</c:when>
					</c:choose>				
					<td class="ttitle">
					<a href="http://localhost:9000/hallforyou/user/hfu_qna_pw.do?qno=${vo.qno}"><img src="http://localhost:9000/hallforyou/img/ico_lock.gif">${vo.title}</a>
					</td>
					<td class="id">${vo.member_id}</td>
					<td class="qdate">${vo.qdate}</td>
				</tr>
				</c:forEach>
		    </table>
		    </form>
	</div>
	</div>
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>