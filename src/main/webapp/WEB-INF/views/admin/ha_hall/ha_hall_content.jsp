<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@page import = "com.spring.vo.HallVO, com.spring.vo.AreaVO, com.spring.vo.ImageVO, java.util.*" %>
<%
	HallVO vo = (HallVO)request.getAttribute("vo");
	AreaVO areavo = (AreaVO)request.getAttribute("areavo");
	ArrayList<ImageVO> imgList = (ArrayList<ImageVO>)request.getAttribute("imgList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_hall.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_sy_body.css">
<style>

	div.button{
		padding-top: 20px;
		border-top:3px dotted #e2e2e2;
		margin-right: 30px;
		margin-bottom: 30px;
		
	}
	div.button a{
		float: right;
		margin-left: 10px;
		text-decoration: none;
	}
	div.pack_hallTitle{
		height: 50px;
	}
	img.himage{
		background-color: #BDBDBD;
		height:400px;
		width: 600px;
		display: inline-block;
		float:left;
	}
	
	div.image_list{
		padding: 10px;
		border: 1px solid #888;
		display: block;
		clear:both;
		height: 180px;
	}
	div.image_list ul{
		padding-left: 0px;
		list-style-type: none;
		text-align: center;
	}
	div.image_list ul li{
		display: inline;
		width: 200px;
	}
	div.image_list img.hallimg{
		width: 180px;
		height: 120px;
		opacity: 0.7;
	}
	table.hall{
		width: 100%;
	}
	.lab, .con{
		padding: 12px 0 12px 0;
	}
	td.lab{
		width: 30%;
		text-align: right;
		padding-right: 30px;
	}
	td.con{
		width: 70%;
		text-align: left;
	}
	div.detail{
		border: 1px solid #E1E1E1;
		margin: 20px 0 20px 0 ;
		padding: 20px;
	}
	#map{
		width: 100%;
		height: 400px;
		display: inline-block;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#map img{
		width: 100%;
		height: 400px;
		
	}

	div.sel_book{
		width:700px;
		height: 400px;
		display:inline-block;
	}
	div.sel_book img{
		height: 400px;
		max-width: 700px;
	}
	#calendar {
		width: 900px;
		margin: 10px auto;
	}
	div.space2{
		height: 60px;
	}
	div.space2 div.button a{
		float:left;
	}
	

</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_q_WRp93KAjolnqwsUqK"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		$(".hallimg").click(function(){
			$("img.himage").attr("src", $(this).attr("src"));
		});
		var pthumbnail= "${vo.pthumbnail}";
		$("#thumbBtn").click(function(){
			if(($("img.himage").attr("src"))=='http://localhost:9000/hallforyou/upload/'+pthumbnail){
				alert("현재 대표이미지입니다.");
			}
			else{
				$("img.himage").attr("src", "http://localhost:9000/hallforyou/upload/"+pthumbnail);
			}
		});
		$("img.hallimg").mouseenter(function(){
			$(this).css("opacity", "1");
		});
		$("img.hallimg").mouseleave(function(){
			$(this).css("opacity", "0.7");
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
		<h3 class="ishall">홀 정보</h3>
		<div class="button">
			<a href="http://localhost:9000/hallforyou/admin/estimate_update.do"><span>견적서</span></a>
			<a href="http://localhost:9000/hallforyou/admin/hall_delete.do"><span>삭제</span></a>
			<a href="http://localhost:9000/hallforyou/admin/hall_update.do?hno=<%= vo.getHno()%>"><span>수정</span></a>
		</div>
		<div class="pack_hallTitle"></div>

		<div class="about_hall">
			<img class="himage" src="http://172.16.13.3:9000/hallforyou/upload/<%=vo.getPthumbnail()%>">

			<div class="hexplain">
				<div class="hallname">상세정보</div>
				<hr>
				<table class="hall">
					<tr>
						<td class="lab"><strong>홀이름</strong></td>
						<td class="con"><%=vo.getHname() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>주소(시/군/구)</strong></td>
						<td class="con"><%=areavo.getCity() %>&nbsp;<%=areavo.getGu() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>추가주소</strong></td>
						<td class="con"><%= vo.getAddress() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>홀타입</strong></td>
						<td class="con"><%= vo.getHlist() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>메뉴종류</strong></td>
						<td class="con"><%=vo.getMlist() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>식사비용</strong></td>
						<td class="con"><%=vo.getMprice() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>전화</strong></td>
						<td class="con"><%=vo.getTel() %></td>
					</tr>
					<tr>
						<td class="lab"><strong>보증인원</strong></td>
						<td class="con"><%=vo.getGuest() %></td>
					</tr>
					<tr>
					
						<td class="lab"><strong>사이트</strong></td>
						<c:if test="${vo.hurl ne null && vo.hurl ne 'null'}">
						<td class="con"><%=vo.getHurl() %></td>
							
						</c:if>
						<c:if test="${ vo.hurl eq 'null' || vo.hurl eq null }">
							<td class="con"></td>
						</c:if>
						
					</tr>
				</table>



			</div>
		</div>
		<div class="space2">
			<div class="button">
					<a><span id="thumbBtn">대표이미지보기</span></a>
			</div>
		</div>
		<div class="image_list">
				<div><b>image list</b></div>
				<hr>
				<ul>
					<%for(ImageVO img: imgList){ %>
						<li><img src="http://172.16.13.3:9000/hallforyou/upload/<%=img.getPfname()%>" class="hallimg"></li>
					<%} %>
			
				</ul>			
			</div>
		
		
		<div class="detail">
			<div><b>설명</b></div><hr>
			<div class="intro"><%=vo.getHcomment() %></div>
		</div>
		<div id="map"></div>
	</div>
	<div class="footer">
		
	</div>
	
<script>

var HOME_PATH = window.HOME_PATH || '.';
if("${vo.hmap}"==''){
	$("#map").append("※아직 지도가 등록되지 않았습니다.");
	$("#map").css("border","1px solid red");
	$("#map").css("text-align","center");
}else{
	var hmap= "${vo.hmap}".split(",");
	var cityhall = new naver.maps.LatLng(hmap[0],hmap[1]),
	    map = new naver.maps.Map('map', {
	      	center: cityhall,
	        zoom: 10
	    }),
	    marker = new naver.maps.Marker({
	        map: map,
	        position: cityhall
	    });

var contentString = [
        '<div class="iw_inner" style="text-align:center;">',
        '   <p>${areavo.city} ${areavo.gu} ${vo.address}<br />',
        '       <img src="http://localhost:9000/hallforyou/upload/${vo.pthumbnail}" style="height:100px;width:150px;" alt="서울더팔래스" /><br />',
        '       <a href="${vo.hurl}" target="_blank">${vo.hurl}</a>',
        '   </p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString,
    maxWidth: 200,
    maxHeight:200,
    backgroundColor: "#eee",
    borderColor: "#2db400",
    borderWidth: 3,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});
}
</script>
</body>
</html>