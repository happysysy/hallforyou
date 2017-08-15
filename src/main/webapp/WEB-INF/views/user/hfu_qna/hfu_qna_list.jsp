<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.QnaVO" %>   
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
	<link href="http://localhost:9000/hallforyou/css/user/bootstrap.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/js/jqeury-3.1.1.min.js" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.min.css" rel="stylesheet"/>
	<link href="http://localhost:9000/hallforyou/css/admin/dataTables.scroller.min.css" rel="stylesheet"/>
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>	
 	<script>
	/* Data Table(�հ�, ��ǥ�� ����, �˻�) */
	   var table;
	   $.noConflict();
	   jQuery(document).ready(function($) {
	       table= $('#hfu_qna_table').DataTable({});
	       
	       $('#write').click(function(){
				if('${member_id}'=="")
					alert("�α��� �� �̿��� �ּ���.");					
				else
					$(location).attr('href', "http://localhost:9000/hallforyou/user/hfu_qna_form.do");
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
		.contents{padding-top:20px;padding-bottom:40px;background:white;width:1200px;margin:auto;margin-top:20px;margin-bottom:20px;}
 		.qna{display:block;width:1200px;margin:auto;margin-top:20px;}
 		img{float:left;margin:5px;}
		div p{display:block;font-size:9pt;}
		.qna_list{display:block;width:90%;margin:auto;margin-top:10px;}
		table{width:100%;text-align:center;}
		table th{text-align:center;padding:7px;border-top:2px solid gray;border-bottom:2px solid gray;background:#e2e2e2;}
		table td{padding:10px;font-size:11pt;}
		.ttitle{text-align:left;}
		span.write{display:inline-block;width:80px;padding:5px 8px;border-radius:4px;background:gray;
 		color:white;font-wright:bold;text-align:center;float:right; margin-bottom:20px;}
 		.write:hover{color:black;text-decoration:none;}
	  	a:link{color:black;text-decoration:none;}
		a:visited{color:black;text-decoration:none;}
		a:hover{text-decoration:none;}
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
		<p>Ȧ���� ����Ʈ�� Ȧ �̿뿡 ���� �ñ��� ������ �����ǰ��<br>
		�������� �� �Խ����� �̿��� �ֽñ� �ٶ��ϴ�</p>
		<form class="qna_list" name="QnaForm" action="" method="post">	
			<span class="write" id="write">�۾���</span>	
			<table id="hfu_qna_table">
			<thead>
				<th class="rno">��ȣ</th>
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
		    <input type="hidden" name="qna_pw" value="${vo.qna_pw}"/>
		</form>
	</div>
</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>