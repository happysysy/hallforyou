<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="java.util.ArrayList, com.spring.vo.HallVO" %>
<%
	
	ArrayList<HallVO> hallList = (ArrayList<HallVO>)request.getAttribute("hallList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_sy_body.css">
<style>
	hr{
		border: 2px dotted #D9D9D9;
	}
	h3{
		text-align: center;
	}
	table{
		width: 100%;
	}
	
	th.tblth{
		text-align: center;
		border-bottom:1px solid #e2e2e2;
		border-top: 1px solid #e2e2e2;
		padding: 15px;
		font-size: 14px;
	}
	td{
		height: 130px;
		text-align: center;
	}
	td a{
		text-decoration: none;
		color: black;
	}
	div.button{
		padding: 20px;
	}
	div.button a{
		float: right;
		margin: 10px;
		text-decoration: none;
	}
	div.button a span{
		background-color: #888;
		padding: 10px 15px 10px 15px;
		border-radius: 10px;
		color: white;
		font-size: 15px;
		
	}
	span.addmapBtn{
		background-color: gray;
		padding: 10px;
		color: white;
		border-radius: 5px;
		font-size: 12px;
	}
	div.pagenation{
		padding: 20px;
		margin-top: 20px;
		text-align: center;
	}
	img.thubnail{
		width: 180px;
		height: 120px;
	}
	img.page{
		height: 60px;
	}
	/*좌표추가 모달*/
	.addmap_Modal {
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
	.addmap_detail_modal {
		background-color: #fefefe;
		margin: 5% auto 15% auto;
		border: 1px solid #888;
		width: 450px;
	}
	.addmap_eClose{
		position: absolute;
		padding-top: 0px;
		right: 25px;
		color: black;
		font-size: 25px;
		font-weight: bold;
		float: right;
	}
	.addmap_eClose:hover,
	.addmap_eClose:focus {
		color: #e2e2e2;
		cursor: pointer;
	}
	.addmap_detail_topContainer {
		text-align: center;
		margin: 24px 0 12px 0;
		position: relative;
		font-size:20px;
		font-weight:bold;
	}
	.hfu_addmapContainer{
		width:95%;
		margin:auto;
		margin-top:30px;
	}	
	.addmap_section{
		width:90%;
		margin:auto;
		padding:5px 8px;
	}		
	span.addmap_title{
		display:inline-block;
		width:100px;
		text-align:left;
		font-size:13pt;
		margin-left:20px;
		margin-bottom:20px;
	}
	span.addmap_modal_btn{
		display:inline-block;
		width:100px;
		padding:8px 10px;
		color:white;
		margin:20px;
		font-weight:bold;
		text-align:center;
		background-color:gray;
		border-radius:4px;
	}
	.addmap_btn_section{margin:auto;padding:5px 8px;text-align:center;}
	
	.deleteBtn{
	    background-color: gray;
	    padding: 7px;
	    color: white;
	    border-radius: 5px;
	    font-size: 12px;	
    }
    .deleteLink, .deleteLink:hover{
    	text-decoration: none;
    }
</style>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://localhost:9000/hallforyou/js/jquery.pagenavigator.js"></script>
<script>
$("document").ready(function(){
  $('#document_navi3').jaPageNavigator({
      page_row : "5" // 보여질 게시물 목록 수
    , page_link : "5" // 보여질 페이지 링크 수
    , total_count : $("#tcount").text() // 게시물 총 수     
  });  
});
</script>
<script>
	$(document).ready(function(){
		$(".trcontent").mouseenter(function(){
			$(this).css("background-color", "#FAE0D4");
		});
		$(".trcontent").mouseleave(function(){
			$(this).css("background-color", "white");
		});
		
		$(".addmapBtn").click(function(){
			
			var hno = ($(this).attr("id"));
			
			$("#addmap").css("display","block");
			
			$(".sendHidden").append('<input type="hidden" name="hno" id="hno" value='+hno+'>');
			
		});
		
		$("#addmap_modal_btn").click(function(){
			
			var hno = ($(this).attr("id"));
			alert(hno);
			if($("#hamp").val() == ""){
				alert("좌표를 입력하세요");
				$("#hmap").focus();
				return false;
			}
			
			addmapForm.submit();
			
		});
		
	});
</script>
</head>

<body class="hall">
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
	
		<h3>홀 리스트</h3>
		
		<table>
			<tr>
				<th class="tblth">no</th>
				<th class="tblth">대표이미지</th>
				<th class="tblth">hall</th>
				<th class="tblth">위치</th>
				<th class="tblth">위치좌표</th>
			</tr>
			<%for(HallVO vo: hallList){ %>
				<tr class="trcontent">
					<td><%=vo.getRno() %></td>
					<td><img class="thubnail" src="http://172.16.13.3:9000/hallforyou/upload/<%=vo.getPthumbnail()%>"/></td>
					<td><%=vo.getHname() %></td>
					<td><%=vo.getCity() %><%=vo.getGu() %><%=vo.getAddress() %></td>
					
					<%if(vo.getHmap()==null){ %>
						<td><span class="addmapBtn" id="<%=vo.getHno() %>">좌표추가</span></td>
					<%} else{%>
						<td><%=vo.getHmap() %></td>
					<%} %>
					<td>
						<a href = "http://localhost:9000/hallforyou/admin/hallDeleteByMainadmin.do?selectno=<%=vo.getHno()%>" class="deleteLink"><span class="deleteBtn">삭제</span></a>
					</td>
				</tr>
			<%} %>
			
		</table>
		
		<!-- hmap modal -->
		<div id="addmap" class="addmap_Modal">
		<div class="addmap_detail_modal">
			<div class="addmap_detail_topContainer">
				<span onclick="document.getElementById('addmap').style.display='none';" 
				 class="addmap_eClose" title="Close Modal">&times;</span>
				<p class="addmap_detail_modaltitle">좌표 추가</p>
			</div>
			<form class="addmapContainer" name="addmapForm" action="addmapController.do" method="post">
				<div class="addmap_section">
					<span class="addmap_title">좌표 입력</span>
					<input type="text" class="addmap_content" id="hmap" name="hmap"></input>
				</div>
				<div class="addmap_btn_section">
					<span class="addmap_modal_btn" id="addmap_modal_btn">좌표 등록</span>
				</div>
				<div class="sendHidden">
				</div>
				
			</form>
		</div>
		</div>
		
		<div class="pagenation">
			<%-- 페이지 네비게이션 시작 --%>
				<span id="tcount" style="display: none">${ tcount }</span>
				<ul class="pagination pagination-sm" id="document_navi3">
					<li class="prev"><a href="#">&laquo;</a></li>
					<li class="disabled prevx"><a href="#">&laquo;</a></li>
					<span class="pageaction"></span>
					<li class="num"><a href="#">{page}</a></li>
					<li class="active now"><a href="#">{page} <span class="sr-only">(current)</span></a></li>
					<li class="next"><a href="#">&raquo;</a></li>
					<li class="disabled nextx"><a href="#">&raquo;</a></li>
				</ul>
				<%-- 페이지 네비게이션 종료  --%>
		</div>
	</div>
	<c:import url="http://localhost:9000/hallforyou/ha_footer.do"></c:import>
</body>
</html>