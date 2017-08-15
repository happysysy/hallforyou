<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.*" %>
<%	String member_id = (String)session.getAttribute("member_id");
	ArrayList<HallVO> hallList = (ArrayList<HallVO>)request.getAttribute("hallList");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > my hall</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	
 	.contents{padding-top:20px;padding-bottom:10px;background:white;width:1200px;margin:auto;margin-top:20px;margin-bottom:20px;}
	
	/* 사용자 정보(검색 옵션) */
	.search{display:block;width:1200px; height:250px;margin:auto;}
	div.search_list{display:block;width:1100px;margin:auto;padding:20px 5px 10px 5px;border:2px dotted gray;}
	ul li{list-style-type:none;}
	.search_list li {display:inline-block;width:1000px;list-style-type:none;font-size:11pt;margin:5px;}	
	
 	.selectpicker{display:inline-block;width:70px;height:25px;}
	.checkbox{display:inline-block;}
 	.button {display:block;width:1150px;text-align:right;margin-top:20px;}
 	span.city, span.county{display:inline-block;width:80px;text-align:center;border:1px solid gray;padding:3px 5px;}
 	span.update {display:inline-block;width:80px;padding:5px 8px;color:white;font-weight:bold;background:gray;border-radius:4px;text-align:center}
 	.update:hover{color:black;text-decoration:none;}
 	
 	/* 찜한 홀 블록 */
 	h3{display:inline-block;width:100px;text-align:center;}
 	div p{display:inline-block;font-size:9pt;margin-left:0px;}
 	.hall_block{padding-top:20px;}
	.block{display:block;width:1200px;margin:auto;margin-top:20px;}
	.block_list{display:inline-block;width:100%;margin:auto;padding:10px 10px;}
	/*.block_list li{display:block;width:1200px;margin:auto;padding-top:20px;}*/
	label{display:inline-block;width:80px;font-size:13pt;text-align:center;font-weight:bold;}
	.image{display:inline-block;width:280px;float:left;padding:20px 20px;margin:7px 7px;}
	.hall_img{margin:10px 20px 5px 0px;}
	.hall_img:hover{opacity:0.4;}	
	.name_info{display:block;width:230px;text-align:center;font-size:14pt;font-weight:bold;}
	.local_info{display:block;width:230px;text-align:center;font-size:10pt;}
</style>
<script>
 	$(document).ready(function(){
 		$(".image").mouseenter(function(){
			$(this).css("background", "#ffe4e1");
		});
		$(".image").mouseleave(function(){
			$(this).css("background", "white");
		});	
 		
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
	<!-- 사용자 정보(검색 옵션) -->
	<section class ="search">
				<div class="search_list">
				<ul>
				<li class="area_list">
					<label>지 역</label>&nbsp;&nbsp;&nbsp;
					<span class="city">${vo.city}</span>&nbsp;&nbsp;&nbsp;
				    <span class="county">${vo.gu}</span>
				</li>
				<li>
					<label>식대</label>&nbsp;&nbsp;&nbsp;
					<span id="minprice" name="minprice"> ${vo.mprice_min}원~</span>
					<span id="maxprice" name="maxprice"> ${vo.mprice_max}원</span>
				</li>
				<li>
					<label>보증인원</label>&nbsp;&nbsp;&nbsp;
					<span id="wguest" name="wguest"> ${vo.guest}명</span>
				</li>
				<li>
					<label>홀타입</label>&nbsp;&nbsp;&nbsp;
					<span name="halltype">${vo.htype}
				</li>
				<li>
					<label>메 뉴</label>&nbsp;&nbsp;&nbsp;
					<span name="menu" >${vo.menu}
				</li>		
			</ul>
			
			</div>
			<div class="button">
			<a href="http://localhost:9000/hallforyou/user/hfu_mypage_infocheck.do">
						<span class="update" id="update">수  정</span>
			</a>
			</div>
		</section>	
	<!-- 찜한 홀 블록  -->
	<section class="hall_block">     
	<div class="block">
	<h3>마이 홀</h3>
	<p>회원님의 정보에 따라 <br>
	   원하시는 홀을 빠르게 찾아드립니다.</p>
		<div class="block_list">
			<%for(HallVO hvo: hallList){ %>		
			<div class="image">
				<a href="http://localhost:9000/hallforyou/user/hfu_halldetail.do?hno=<%=hvo.getHno() %>">
				<img class="hall_img" src="http://172.16.13.3:9000/hallforyou/upload/<%=hvo.getPthumbnail() %>" width="240" height="200" >
				</a>
				<span class="local_info"><%=hvo.getCity() %> > <%=hvo.getGu() %></span>
				<span class="name_info"><%=hvo.getHname() %></span>
			</div>
			<%} %>
		</div>
	</div>		
	</section>
</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>