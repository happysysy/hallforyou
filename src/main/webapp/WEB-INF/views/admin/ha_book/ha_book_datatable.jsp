<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.*" %>
<%@ page session="true" %>
<% 
	String hno = (String)request.getAttribute("hno");
	String hname = (String)request.getAttribute("hname");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>HALL FOR YOU > BOOK LIST</title>
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
  	
	  	$.ajax({
			url : 'http://localhost:9000/hallforyou/admin/halltype.do?hno=${hno}',			
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
	        
	        $(".newinsert").click(function(){
	        	
	        	var hno = ($(this).attr("id"));
	        	
	        	$("#newinsertModal").css("display", "block");
	        	
	        	$(".sendHidden").append('<input type="hidden" name="hno" id="hno" value='+hno+'>');
	        });
	        
	        $("#newinsert_modal_btn").click(function(){
	        	
				if($("#mname").val() == ""){
					alert("이름을 입력하세요");
					$("#mname").focus();
					return false;
				}else if($("#wdate").val() == ""){
					alert("날짜를 입력하세요");
					$("#wdate").focus();
					return false;
				}else if($("#typename").val() == ""){
					alert("홀 타입을 선택하세요");
					return false;
				}else if($("#wtime").val() == ""){
					alert("홀 타입을 선택하세요");
					$("#wtime").focus();
					return false;
				}
	        	
				newinsertForm.submit();
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
		div.content div.book div.book_list {
			width:85%;
			margin:auto;	
		}
		h1.booktitle {			
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
		.tno {	width:10%;	}
		td.tid { width:18%; }
		.thall { width:18%; }
		.bdate { width:18% }
		.wdate { width:18%; }
		.tcheck { width:18%; }		
		img { 			
			margin-left:60px;
		}
		
		span.btn, span.newinsert {
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
	  	/*신규등록(newinsert) 모달*/
	  	.newinsert_Modal {
		display: none;
		position: fixed;
		z-index:1;
		padding-top: 60px;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4);
	}
	.newinsert_detail_modal {
		background-color: #fefefe;
		margin: 5% auto 15% auto;
		border: 1px solid #888;
		width: 450px;
	}
	.newinsert_eClose{
		position: absolute;
		padding-top: 0px;
		right: 25px;
		color: black;
		font-size: 25px;
		font-weight: bold;
		float: right;
	}
	.newinsert_eClose:hover,
	.newinsert_eClose:focus {
		color: #e2e2e2;
		cursor: pointer;
	}
	.newinsert_detail_topContainer {
		text-align: center;
		margin: 24px 0 12px 0;
		position: relative;
		font-size:20px;
		font-weight:bold;
	}
	.newinsertContainer{
		width:95%;
		margin:auto;
		margin-top:30px;
	}	
	.newinsert_section{
		width:90%;
		margin:auto;
		padding:5px 8px;
	}		
	span.newinsert_title{
		display:inline-block;
		width:100px;
		text-align:left;
		font-size:13pt;
		margin-left:20px;
		margin-bottom:20px;
	}
	span.newinsert_modal_btn{
		display:inline-block;
		width:80px;
		padding:8px 10px;
		color:white;
		margin:20px;
		font-weight:bold;
		text-align:center;
		background-color:gray;
		border-radius:4px;
	}
	.selectpicker{display:inline-block;width:130px;height:25px;}
	.newinsert_btn_section{margin:auto;padding:5px 8px;text-align:center;}	  	
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
		<h1 class="booktitle">Book List</h1>
		<hr>
		<div class="book_list">
			<table id="example">
				<thead>
					<th>번호</th>
					<th>아이디</th>
					<th>HALL</th>
					<th>등록 날짜</th>
					<th>예식 날짜</th>
					<th>등록 여부</th>
				</thead>
				<c:forEach items="${list}" var="vo">
				<tr>
					<td class="tno">${vo.rno}</td>
					<c:choose>
						<c:when test="${vo.book_check=='1'}">
							<td class="tid"><a href="http://localhost:9000/hallforyou/admin/book_content.do?bno=${vo.bno }&rno=${vo.rno }&hno=${vo.hno}">${vo.member_id }</a></td>
						</c:when>
						<c:when test="${vo.book_check=='2'}">
							<td class="tid"><a href="http://localhost:9000/hallforyou/admin/book_complete.do?bno=${vo.bno }&rno=${vo.rno }&hno=${vo.hno}">${vo.member_id }</a></td>
						</c:when>
					</c:choose>
					<td class="thall">${vo.hname }</td>
					<td class="bdate">${vo.bdate}</td>
					<td class="wdate">${vo.wdate}</td>
					<c:choose>
						<c:when test="${vo.book_check =='1'}">
						<td class="tcheck">미등록</td>
						</c:when>
						<c:when test="${vo.book_check =='2'}">
						<td class="tcheck">등록</td>
						</c:when>
					</c:choose>
				</tr>
				</c:forEach>
				
			</table>
		</div>
		<br>
		<a href="http://localhost:9000/hallforyou/ha_index.do">
			<span class="btn">HOME</span>
		</a>
		<span class="newinsert" id="${hno}">신규등록</span>
		</div>
	</div>
	
	<!-- 신규등록(newinsert) modal -->
	<div id="newinsertModal" class="newinsert_Modal">
		<div class="newinsert_detail_modal">
			<div class="newinsert_detail_topContainer">
				<span onclick="document.getElementById('newinsertModal').style.display='none';" 
				 class="newinsert_eClose" title="Close Modal">&times;</span>
				<p class="newinsert_detail_modaltitle">신규 등록</p>
			</div>
			<form class="newinsertContainer" name="newinsertForm" action="newinsertController.do" method="post">
				<div class="newinsert_section">
					<span class="newinsert_title">예식장</span>
					<input type="text" class="newinsert_content" id="hname" name="hname" value="${hname}" readonly></input>
					<span class="newinsert_title">이름</span>
					<input type="text" class="newinsert_content" id="mname" name="mname"></input>
					<span class="newinsert_title">날짜</span>
					<input type="text" class="newinsert_content" id="wdate" name="wdate"></input>
					<span class="newinsert_title">HALL TYPE</span>
					<select class="selectpicker" id="typename" name="typename">
						<option value="선택">홀선택</option>
					</select><br>
					<span class="newinsert_title">시간</span>
					<input type="text" class="newinsert_content" id="wtime" name="wtime"></input>
				</div>
				<div class="newinsert_btn_section">
					<span class="newinsert_modal_btn" id="newinsert_modal_btn">등록</span>
				</div>
				<div class="sendHidden">
				</div>
				
			</form>
		</div>
	</div>
	
</body>
</html>