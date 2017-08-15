<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.spring.vo.*" import="java.util.*"%>
<%@ page session = "true" %>     
<%--
	String member_id = (String)session.getAttribute("member_id");
	Hfu_HalldetailVO vo = (Hfu_HalldetailVO)request.getAttribute("vo");
	ArrayList<Hfu_HalldetailVO> blist = (ArrayList<Hfu_HalldetailVO>)request.getAttribute("blist");
	ArrayList<ReviewVO> rlist = (ArrayList<ReviewVO>)request.getAttribute("rlist");
	ArrayList<EstimateVO> typename=(ArrayList<EstimateVO>)request.getAttribute("typename");
	String hno= (String)request.getAttribute("hno");
	System.out.println("memberid " + member_id);
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Hall For You > Hall Detail</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script><!--  -->
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" href="http://172.16.13.25:9000/hallforyou/fullcalendar/fullcalendar.css" />
 	<link href="http://localhost:9000/hallforyou/fullcalendar/fullcalendar.print.min.css" rel="stylesheet" media="print" />
	<script src="http://localhost:9000/hallforyou/fullcalendar/lib/jquery.min.js"></script>
	<script src="http://localhost:9000/hallforyou/fullcalendar/lib/moment.min.js"></script>
	<script src="http://172.16.13.25:9000/hallforyou/fullcalendar/fullcalendar.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_q_WRp93KAjolnqwsUqK"></script>
	<script src="http://localhost:9000/hallforyou/js/jquery.pagenavigator.js"></script>
	<script>
		$.noConflict(); 
		$.ajax({
			url : 'http://localhost:9000/hallforyou/user/halltype.do?hno=${vo.hno}',			
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
		jQuery(document).ready(function($){
					
			$('#hfu_consult_btn').click(function(){
				if($("#typename").val()=='선택'){
	 				alert("희망 홀을 선택해주세요");
	 				return false;
	 			}else if($("#wdate").val()==""){
					alert("희망 날짜를 입력해주세요");
					$("#wdate").focus();
					return false;
				}
				consultForm.submit();
			});
			$('#hfu_review_btn').click(function(){
				if($("input[name='score']").is(":checked")==false){
					alert("만족도를 확인해주세요");
					return false;
				}else if($("#review").val()==""){
					alert("한줄평을 작성해주세요");
					$("#review").focus();
					return false;
				}
				ReviewForm.submit();
			});
			$('#hfu_detail_write2').click(function(){
				if('${member_id}'=="")
					alert("로그인 후 이용해 주세요.");					
				else
					$("#detail_review").css("display","block");
			});
			$('#btn_consult').click(function(){
				if('${member_id}'=="")
					alert("로그인 후 이용해 주세요.");					
				else
					$("#consult").css("display","block");
			});
			$('#btn_wishlist').click(function(){
				if('${member_id}'=="")
					alert("로그인 후 이용해 주세요.");					
				else{
						$.ajax({
		  					url : 'http://localhost:9000/hallforyou/wishlistCheck.do?hno=${vo.hno}',			
		  					success : function(data) {
			  					var succ = data.trim();
								if(succ == "N") {
									alert("이미 추가되었습니다.");
								} else {
									$.ajax({
					  					url : 'http://localhost:9000/hallforyou/wishlist.do?hno=${vo.hno}',
					  					type : 'POST',/*한글깨짐 방지*/
					  					   					
					  					success : function(data) {  	
					  						alert("찜한 홀은 마이홀에서 확인하실 수 있습니다.");
					  					}//end of success					
					  				});//end of ajax 
								}
		  					}
	  					});
					
				}
			});
			
			$('.hfu_detail_imgs').click(function() {
				
				$('#imgModal').css('display', 'block');
				$('#modalImg').attr('src', this.src);
			});
			
			$('#close').click(function() {
				$('#imgModal').css('display', 'none');
			});
			$('#calendar').fullCalendar({
				 events: 'http://localhost:9000/hallforyou/calendar.do?hno=${vo.hno}'
			});
			
			//견적서 ajax(음료 및 메뉴 불러오기)
			$('.r_typeselect').click(function(){
				var tno=$(this).attr("value");
				$.ajax({
					url : 'http://localhost:9000/hallforyou/hfu_estimate_selection.do',
					type : 'GET',
					data : "typeno="+tno,
					dataType : "json",   					
					success : function(data) {  
						if(data.length != 0){
							$(".selection_table").empty();
							for(var i=0; i<data.length;i++){
								if(data[i].sref=='필수'){
									str = "<tr id='num"+i+"'><td>"
										  + "<input type='image' src='http://localhost:9000/hallforyou/img/checkbox_button.PNG' name='r_feeselect' class='r_feeselect' value='"+data[i].typeno+"'></td>"
										  + "<td class='hfu_fname'>"+data[i].sname+"</td>"
										  + "<td class='hfu_fprice' >"+data[i].sprice+"</td>"
										  + "<td class='hfu_fetc'>"+data[i].sref+"</td>"
										  + "<td class='hfu_fcontent'>"+data[i].scontent+"</td></tr>";
								}else{
									str = "<tr id='num"+i+"'><td>"
										  + "<input type='checkbox' name='r_feeselect' class='r_feeselect' onclick='r_feeselect()' value='"+data[i].typeno+"' ></td>"
										  + "<td class='hfu_fname'>"+data[i].sname+"</td>"
										  + "<td class='hfu_fprice'>"+data[i].sprice+"</td>"
										  + "<td class='hfu_fetc'>"+data[i].sref+"</td>"
										  + "<td class='hfu_fcontent'>"+data[i].scontent+"</td></tr>";
								}
									
									 
								 $(".selection_table").append(str);
							}//end of for							
						}else
							alert("해당하는 내용이 없습니다1.");//end of if						
					},error: function (data){
						alert("검색 에러.");
					}//end of success					
				});//end of ajax  
				
				//meal 불러오기
			$.ajax({
				url : 'http://localhost:9000/hallforyou/hfu_estimate_meal.do',
				type : 'GET',
				data : "typeno="+tno,
				dataType : "json",   					
				success : function(data) {  
	
					if(data.length != 0){
						$(".meal_table").empty();
						for(var i=0; i<data.length;i++){
							if(i==0){
								str = "<tr><td>"
								      + "<input type='radio' onclick='r_mealselect()' name='r_mealselect' class='r_mealselect' value='"+data[i].typeno+"' id='"+data[i].mealprice+"' checked></td>"
									  + "<td class='hfu_mkind'>"+data[i].mealtype+"</td>"
								      + "<td class='hfu_mprice'>"+data[i].mealprice+"</td>"
								      + "<td class='hfu_mcontent'>"+data[i].mealcontent+"</td></tr>";
									 
								 $(".meal_table").append(str);
							}
							else{
							str = "<tr><td>"
							      + "<input type='radio' onclick='r_mealselect()' name='r_mealselect' class='r_mealselect' value='"+data[i].typeno+"' id='"+data[i].mealprice+"'></td>"
								  + "<td class='hfu_mkind'>"+data[i].mealtype+"</td>"
							      + "<td class='hfu_mprice'>"+data[i].mealprice+"</td>"
							      + "<td class='hfu_mcontent'>"+data[i].mealcontent+"</td></tr>";
								 
							 $(".meal_table").append(str);
							}
						}//end of for							
					}
				},error: function (data){
					alert("홀을 선택해 주세요.");
				}//end of success					
			});//end of ajax 
			
			$.ajax({
				url : 'http://localhost:9000/hallforyou/hfu_estimate_drink.do',
				type : 'GET',
				data : "typeno="+tno,
				dataType : "json",   					
				success : function(data) {  
	
					if(data.length != 0){
						$(".drink_table").empty();
						for(var i=0; i<data.length;i++){
							
							str = "<tr><td>"
							      + "<input type='checkbox' name='r_drinkselect' id='"+data[i].drinkprice+"' class='r_drinkselect' value='"+data[i].dno+"'></td>"
								  + "<td>"+data[i].drink+"</td>"
							      + "<td class='"+data[i].dno+"' id='hfu_dprice'><span>"+data[i].drinkprice+"</span></td>"
							      + "<td class='"+data[i].dno+"' id='hfu_dcontent'><input type='text' class='dcount' value='0'> 개</td></tr>";
								 
							 $(".drink_table").append(str);
						}//end of for							
					}//end of if						
				},error: function (data){
					alert("검색 에러.");
				}//end of success					
			});//end of ajax  	
			});
			$("#estimate_ok").click(function(){				
				//수정 요망
				//사용료
				var priceselection=0;
				var spriceArray=$("td.hfu_fprice");
				for(var i=0;i<spriceArray.length;i++){
					if($("tr#num"+i+" .hfu_fetc").text()=="선택"){
						if($("tr#num"+i+" .r_feeselect").is(":checked")){
							priceselection=priceselection+parseInt($("#num"+i+" td.hfu_fprice").text());
						}
					}else{
						priceselection=priceselection+parseInt($("#num"+i+" td.hfu_fprice").text());
					}
					
				}
				var mselect=$(".r_mealselect:checked").attr("id");
				var person=$(".hfu_capa_sel").val();

				var chk =[];
				chk=$(".r_drinkselect:checkbox");
				var totaldprice=0;
				for(var i=0; i<chk.length;i++){
					var dprice=$("td."+chk[i].value+" span").text();
					var dcount=$("td."+chk[i].value+" input.dcount").val();
					totaldprice=parseInt(totaldprice)+parseInt((parseInt(dprice)*parseInt(dcount)));
				}
				
				var num=parseInt(totaldprice)+parseInt(priceselection)+(parseInt(mselect)*parseInt(person));
			
				var len, point, str; 
			       
			    num = num + ""; 
			    point = num.length % 3 ;
			    len = num.length; 
			   
			    str = num.substring(0, point); 
			    for (;point < len;) { 
			        if (str != "") str += ","; 
			        str += num.substring(point, point + 3); 
			        point += 3; 
			    } 
			     
			    
				$("#totalEstimate").text(str+"원").css("font-size","15pt").css("display", "block").css("color","red");
			
			});
		});
	</script>
	<style>
		.contents{padding-top:20px;padding-bottom:20px;background:white;width:1200px;margin:auto;margin-top:20px;}
		h3{display:block;width:170px;text-align:center;}
		span.hfu_detail_subtitle{display:block;width:150px;text-align:left;font-size:15pt;font-weight:bold;margin-bottom:20px;}
		.hfu_detail_summary, .hfu_detail_intro, .hfu_detail_image
		, .hfu_detail_place, .hfu_detail_book, .hfu_detail_review{width:95%;margin:auto;margin-top:20px;padding-top:20px;padding-bottom:20px;}
		
		/*홀 상세정보(사진 및 간단 정보)*/
		div.hfu_detail_form {
			width: 1200px;
			margin-top: 20px;
			margin-bottom: 20px;
			overflow: hidden;
		}
		div.hfu_detail_info {width:500px;height:400px;padding:20px;float:right;}
		label.hfu_detail_name{font-size:16pt;font-weight:bold;}
		table.hfu_detail_info_list {height: 250px;}
		td.hfu_detail_info_list_col {width: 120px;font-weight:bold;padding:10px;font-size:12pt; }
		td.hfu_detail_info_list_row {
			padding:10px;font-size:11pt;}
		span.hfu_detail_btn {
			display:inline-block;width:80px;padding: 5px 8px;color:white;margin:10px;
			font-weight:bold;text-align:center;background-color: gray;border-radius:4px;}
		span:link{color:black;text-decoration:none;}
		span:visited{color:black;text-decoration:none;}
		span:hover{text-decoration:none;}
		
		/*상담예약 모달*/
		.hfu_consult_Modal {
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
		.hfu_detail_modal-content {
			background-color: #fefefe;
			margin: 5% auto 15% auto;
			border: 1px solid #888;
			width: 450px;
		}
		.hfu_eClose {
			position: absolute;
			padding-top: 0px;
			right: 25px;
			color: black;
			font-size: 25px;
			font-weight: bold;
			float: right;
		}		
		.hfu_eClose:hover,
		.hfu_eClose:focus {
			color: #e2e2e2;
			cursor: pointer;
		}
		.hfu_detail_topContainer {
			text-align: center;
			margin: 24px 0 12px 0;
			position: relative;
		}		
		.hfu_consultContainer{width:95%;margin:auto;margin-top:30px;}	
		.hfu_consult_section{width:90%;margin:auto;padding:5px 8px;}		
		span.hfu_consult_subtitle{display:inline-block;width:100px;text-align:left;font-size:13pt;font-weight:bold;margin-left:20px;margin-bottom:20px;}
		.selectpicker{display:inline-block;width:100px;height:25px;}
		span.hfu_consult_btn{display:inline-block;width:80px;padding:8px 10px;color:white;margin:20px;
			font-weight:bold;text-align:center;background-color:gray;border-radius:4px;}
		.hfu_consult_section_btn{margin:auto;padding:5px 8px;text-align:center;}
		/*홀 소개*/	
		div.hfu_detail_comment {
			width: 95%;
			height: 180px;
			border:1px dotted gray;
			margin:auto;}
		p.hfu_detail_comment_p{padding:10px; font-size:12pt;}
		
		/*홀 이미지(모달 포함)*/
		div.hfu_detail_images {
			width: 95%;
			height: 180px;
			border:1px dotted gray;
			margin:auto;
			text-align: center;
			padding:10px;
		}
		img.hfu_detail_imgs {
			width: 200px;
			height: 150px;
			padding:5px;
			margin-top:5px;
		}
		img.hfu_detail_imgs:hover {
			opacity: 0.4;
		}
		.hfu_detail_imgModal {
			display: none;
			position: fixed;
			z-index:1;
			padding-top: 100px;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgb(0,0,0);
			background-color: rgba(0,0,0,0.9);
		}
		.hfu_detail_modal-content1 {
			margin: auto;
			display:block;
			width:60%;
			max-width: 1000px;
		}
		.hfu_detail_close {
			position: absolute;
			right: 25px;
			top: 0;
			color: #fefefe;
			font-size: 35px;
			font-weight: bold;
		}		
		.hfu_detail_close:hover,.hfu_detail_close:focus {color:#e2e2e2;cursor: pointer;}
		
		/*홀 위치(지도)*/
		div.hfu_detail_map {
			width:95%;
			margin:auto;
			height:300px;
			border:1px dotted gray;
		}
		div.hfu_detail_mapapi {
			width:95%;
			margin:auto;
			height:300px;
		}
		
		/*예약 리스트(캘린더)*/
		.hfu_detail_calendar{width:1100px;padding:20px 35px;margin:auto;}
		
		#calendar {
			display:block;
			width:1070px;		
		}
		.fc-sat{ color:#0000FF; }     /* 토요일 */
    	.fc-sun{ color:#FF0000; }  
		
		/*리뷰(모달)*/
		.hfu_detail_review_list{width:95%;margin:auto;}
		table{width:100%;margin:auto;text-align:center;border-collapse:collapse;}
		table.hfu_detail_review_table th {
			text-align:center;padding:7px;border-bottom:2px solid gray;
			border-top:2px solid gray;background:#e2e2e2;}		
		table.hfu_detail_review_table td 
			{padding:10px;font-size:11pt;}		
		.hfu_review_score, .hfu_review_id, .hfu_review_date {text-align: center;}	
		th.hfu_review_score {width: 10%;}
		th.hfu_review_title {width: 60%;}
		th.hfu_review_id {width: 15%;}
		th.hfu_review_date {width: 15%;}
		span.hfu_detail_write{display:inline-block;padding:5px 8px;border-radius:4px;float:right;} 		
		.nav{display:block; width:100%;text-align:center;}	
		
		.hfu_detail_reviewlistModal {
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
		.hfu_detail_modal-content4 {
			background-color: #fefefe;
			margin: 5% auto 15% auto;
			border: 1px solid #888;
			width: 700px;
			height:800px;
		}
		.hfu_detail_reviewmodaltitle{font-size:15pt;margin:auto;margin-bottom:20px;}
		.hfu_reviewListContainer{margin:auto;margin-top:20px;padding:30px;height:700px;overflow-y:scroll;overflow-x:hidden;}
		
		
		.hfu_detail_reviewModal {
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
		.hfu_detail_modal-content2 {
			background-color: #fefefe;
			margin: 5% auto 15% auto;
			border: 1px solid #888;
			width: 500px;
		}
		.hfu_detail_modaltitle{font-size:18pt;margin:auto;}
		.hfu_reviewContainer{width:95%;margin:auto;}
		.hfu_review_section{margin:auto;padding:5px 8px;}
		.hfu_review_section_btn{margin:auto;padding:5px 8px;text-align:center;}
		span.hfu_review_subtitle{display:inline-block;width:80px;text-align:center;font-size:13pt;font-weight:bold;margin-bottom:20px;}
		input.review{width:77%;margin:auto;padding:5px 8px;}
		span.hfu_review_btn{display:inline-block;width:80px;padding:8px 10px;color:white;margin:20px;
			font-weight:bold;text-align:center;background-color:gray;border-radius:4px;}
		
		/*견적서(모달)*/	
		.hfu_detail_estimate {
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
		.hfu_detail_modal-content3 {
			background-color: #fefefe;
			margin: 5% auto 15% auto;
			border: 1px solid #888;
			width: 900px;
		}
		
		.hfu_eClose2 {
			position: absolute;
			padding-top: 0px;
			right: 25px;
			color: black;
			font-size: 35px;
			font-weight: bold;
			float: right;
		}		
		.hfu_eClose2:hover,
		.hfu_eClose2:focus {
			color: #e2e2e2;
			cursor: pointer;
		}
		.hfu_detail_botContainer {
			margin-top: 30px;
			margin-bottom: 30px;
			text-align: center;
		}
		.hfu_estimateContainer{width:95%;margin:auto;}
		.hfu_estimate_section{margin:auto;padding:5px 8px;}
		.hfu_capa_div {
			width: 100%;
			margin: auto;			
		}		
		.hfu_capa_sel {
			height: 30px;
			padding:5px 8px;
		}

		table.hfu_estimate_table {
			width: 100%;
			margin: 5px auto;
			border-collapse: collapse;
		}
		
		table.hfu_estimate_table th {
			height: 25px;
			border-bottom:1px solid gray;border-top:1px solid gray;background:#e2e2e2;
			padding: 7px;
			text-align:center;
		}
		table.hfu_estimate_table td {
			text-align: center;
			border-bottom: 0.5px solid lightgray;
			padding: 10px 0;
		}
		table.selection_table td, table.meal_table td, table.drink_table td{padding:5px 0;}
		
		th.hfu_hsel {width: 20%;}
		th.hfu_hname {width: 40%;}
		th.hfu_hcapa {width: 20%;}
		th.hfu_htime {width: 20%;}
		
		.hfu_fname {width: 20%;}
		.hfu_fprice {width: 15%;}
		.hfu_fetc {width: 15%;}
		.hfu_fcontent {width: 40%;text-align: left;}
		
		.hfu_mkind {width: 25%;}
		.hfu_mprice {width: 20%;}
		.hfu_mcontent {width: 40%;text-align: left;}
		
		.hfu_dkind {width: 25%;}
		#hfu_dprice {width: 20%;}
		#hfu_dcontent {width: 40%;}
		#hfu_dcontent input{width:80px;margin:5px; padding:5px 8px;}
		
		/*.btn_feeselect{display:block;float:right;border-radius:4px;font-weight:bold;padding:5px 8px;color:white;} */
		
		span.hfu_estimate_ok {
			display: inline-block;
			width: 150px;
			border-radius: 5px;
			padding: 15px 20px;
			color: white;
			font-weight: bold;
			text-align: center;
			background-color: #888;
		}
		#totalEstimate {
			display: none;
			width: 90%;			
			margin:auto;
			margin-top:20px;
			text-align:center;
			color: black;
			font-weight: bold;
			font-size: 20px;
		}
</style>
</head>
<body>
	<!--  header  -->
	 <c:choose>
 		<c:when test="${empty sessionScope.member_id}">
 			<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
 		</c:when>
 		<c:when test="${not empty sessionScope.member_id}">
 			<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
 		</c:when>
 	</c:choose>                                  
	<!--  content  -->
	<div class="contents">
		<div class="hfu_detail_form">
		<h3>홀 상세페이지</h3>
		
		<section class="hfu_detail_summary" >
		<img class="hfu_detail_thumbnail" src="http://172.16.13.3:9000/hallforyou/upload/${vo.pthumbnail}" width="600px" height="400px">
		<div class="hfu_detail_info"> 
			<label class="hfu_detail_name">${vo.hname}</label>
			<table class="hfu_detail_info_list">
				<tr>
					<td class="hfu_detail_info_list_col">위 치</td>
					<td class="hfu_detail_info_list_row">${vo.address}</td>
				</tr>
				<tr>
					<td class="hfu_detail_info_list_col">홀타입</td>
					<td class="hfu_detail_info_list_row">${vo.hlist}</td>
				</tr>
				<tr>
					<td class="hfu_detail_info_list_col">식사비</td>
					<td class="hfu_detail_info_list_row">${vo.mprice}</td>
				</tr>
				<tr>
					<td class="hfu_detail_info_list_col">메뉴</td>
					<td class="hfu_detail_info_list_row">${vo.mlist}</td>
				</tr>
				<tr>
					<td class="hfu_detail_info_list_col">보증인원</td>
					<td class="hfu_detail_info_list_row">${vo.guest}</td>
				</tr>
			</table>
			
			<span class="hfu_detail_btn" id="btn_wishlist">찜</span>
			<span class="hfu_detail_btn" id="btn_estimate" onclick="document.getElementById('detail_estimate').style.display='block'">견적내기</span>
			<span class="hfu_detail_btn" id="btn_consult">상담예약</span>
			<a href="http://localhost:9000/hallforyou/user/hfu_qna_form.do"><span class="hfu_detail_btn" id="btn_qna">문의하기</span></a>
		</div>
		</section>
		<!-- book Modal -->
		<div id="consult" class="hfu_consult_Modal">
		<div class="hfu_detail_modal-content">
			<div class="hfu_detail_topContainer">
				<span onclick="document.getElementById('consult').style.display='none';" 
				 class="hfu_eClose" title="Close Modal">&times;</span>
				<p class="hfu_detail_modaltitle">상담예약 신청</p>				
			</div>	
			<form class="hfu_consultContainer" name="consultForm" action="hfu_detail_consult.do" method="post">
				<div class="hfu_consult_section">
					<span class="hfu_consult_subtitle">아이디</span>
					<span class="hfu_consult_content">${member_id}</span>			
					<br>
					<span class="hfu_consult_subtitle">홀이름</span>
					<span class="hfu_consult_content">${vo.hname}</span>
					<br>
					<span class="hfu_consult_subtitle">희망홀</span>
					<select class="selectpicker" id="typename" name="typename">
						<option value="선택">홀선택</option>
					</select>
					<br>
					<span class="hfu_consult_subtitle">희망날짜</span>
					<input type="text" class="hfu_consult_wdate" id="wdate" name="wdate" placeholder="ex)17/01/01">
				</div>
				<div class="hfu_consult_section_btn">
					<span class="hfu_consult_btn" id="hfu_consult_btn">신청</span>
				</div>
				<input type="hidden" name="member_id" value="${member_id}"/>
				<input type="hidden" name="hno" value="${vo.hno}"/>
			</form>
		</div>
		</div>
		
		<section class="hfu_detail_intro">
		<span class="hfu_detail_subtitle">홀 소개</span>	
		<div class="hfu_detail_comment">
			<p class="hfu_detail_comment_p">${vo.hcomment}</p>
		</div>
		</section>
		
		<section class="hfu_detail_image">
		<span class="hfu_detail_subtitle">홀 사진</span>	
		<div class="hfu_detail_images">
			<c:forEach items="${ilist}" var="ivo">
			<img class="hfu_detail_imgs" id="img1" src="http://172.16.13.3:9000/hallforyou/upload/${ivo.pfname}">
			</c:forEach>
		</div>
		</section>
		<!-- Image Modal -->
		<div id="imgModal" class="hfu_detail_imgModal">
			<span class="hfu_detail_close" id="close" onclick="closeModal()">×</span>
			<img class="hfu_detail_modal-content1" id="modalImg">
		</div>
		
		<section class="hfu_detail_place">
		<span class="hfu_detail_subtitle">홀 위치</span>	
		<div class="hfu_detail_map"	>
		<div class="hfu_detail_mapapi" id="map"></div>
		</div>
		
		</section>
		
		<section class="hfu_detail_book">
		<span class="hfu_detail_subtitle">예약 리스트</span>	
		<div class="hfu_detail_calendar">	
		<div id="calendar" class="calendar"></div>
		</div>
		</section>
		
		<section class="hfu_detail_review">
		<span class="hfu_detail_subtitle">리뷰</span>
		<div class="hfu_detail_review_list">
			<span class="hfu_detail_write" id ="hfu_detail_write" onclick="document.getElementById('detail_review_list').style.display='block'">리뷰더보기></span>
			<span class="hfu_detail_write" id ="hfu_detail_write2">리뷰남기기></span>			
			<table class="hfu_detail_review_table" id="hfu_detail_review_table">
				<tr>
					<th class="hfu_review_score">작성자</th>
					<th class="hfu_review_title">내용</th>
					<th class="hfu_review_id">만족도</th>
					<th class="hfu_review_date">날짜</th>
				</tr>
				<c:forEach items="${rlist}" var="rvo">
				<tr>
					<td class="hfu_review_id">${rvo.member_id}</td>
					<td class="hfu_review_content">${rvo.content}</td>
					<td class="hfu_review_score">${rvo.score}</td>										
					<td class="hfu_review_date">${rvo.rdate}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</section>
		</div>
		<!-- Review Read Modal -->
		<div id="detail_review_list" class="hfu_detail_reviewlistModal">
		<div class="hfu_detail_modal-content4">
			<div class="hfu_detail_topContainer">
				<span onclick="document.getElementById('detail_review_list').style.display='none';" 
				 class="hfu_eClose" title="Close Modal">&times;</span>
				<p class="hfu_detail_reviewmodaltitle">${vo.hname} 리뷰전체보기</p>				
			</div>	
			<div class="hfu_reviewContainer">
				<div class="hfu_reviewListContainer" style="">
				<table class="hfu_detail_review_table" id="hfu_detail_review_table">
				<tr>
					<th class="hfu_review_score">작성자</th>
					<th class="hfu_review_title">내용</th>
					<th class="hfu_review_id">만족도</th>
					<th class="hfu_review_date">날짜</th>
				</tr>
				<c:forEach items="${rllist}" var="rvo">
				<tr>
					<td class="hfu_review_id">${rvo.member_id}</td>
					<td class="hfu_review_content">${rvo.content}</td>
					<td class="hfu_review_score">${rvo.score}</td>										
					<td class="hfu_review_date">${rvo.rdate}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			</div>
		</div>
		</div>
		<!-- Review Write Modal -->
		<div id="detail_review" class="hfu_detail_reviewModal">
		<div class="hfu_detail_modal-content2">
			<div class="hfu_detail_topContainer">
				<span onclick="document.getElementById('detail_review').style.display='none';" 
				 class="hfu_eClose" title="Close Modal">&times;</span>
				<p class="hfu_detail_modaltitle">리뷰작성</p>				
			</div>	
			<form class="hfu_reviewContainer" name="ReviewForm" action="hfu_halldetail_review.do" method="post">
				<div class="hfu_review_section">
					<span class="hfu_review_subtitle">만족도</span>
					<input type="radio" name="score" value="1">1점&nbsp;&nbsp;
					<input type="radio" name="score" value="2">2점&nbsp;&nbsp;
					<input type="radio" name="score" value="3">3점&nbsp;&nbsp;
					<input type="radio" name="score" value="4">4점&nbsp;&nbsp;
					<input type="radio" name="score" value="5">5점&nbsp;&nbsp;
				</div>
				<div class="hfu_review_section">
					<span class="hfu_review_subtitle">한줄평</span>
					<input type="text" class="review" id="review" name="content" maxlength="40" placeholder="이 웨딩홀이 어떠셨나요? 40자 이내로 입력해주세요">
				</div>
				<div class="hfu_review_section_btn">
					<span class="hfu_review_btn" id="hfu_review_btn">등록</span>
				</div>
				<input type="hidden" name="member_id" value="${member_id}"/>
				<input type="hidden" name="hno" value="${vo.hno}"/>
			</form>
		</div>
		</div>
		<!-- Estimate Modal -->
	<div id="detail_estimate" class="hfu_detail_estimate">
		<div class="hfu_detail_modal-content3">
			<div class="hfu_detail_topContainer">
				<span onclick="document.getElementById('detail_estimate').style.display='none'; document.getElementById('totalEstimate').style.display='none';" 
				 class="hfu_eClose2" title="Close Modal">&times;</span>
				<h2>견적서</h2>				
			</div>		
			<div class="hfu_estimateContainer">
				<div class="hfu_estimate_section">
				<span class="hfu_detail_subtitle">하객수</span>
				<div class="hfu_capa_div">
					<select class="hfu_capa_sel">
						<option value="50">50명</option>
						<option value="100">100명</option>
						<option value="200">200명</option>
						<option value="300">300명</option>
						<option value="400">400명</option>
						<option value="500">500명</option>
					</select>
				</div>
				</div>
				<div class="hfu_estimate_section">
				<span class="hfu_detail_subtitle">홀 선택</span>
		
				<table class="hfu_estimate_table">
					<tr>
						<th class="hfu_hsel">선택</th>
						<th class="hfu_hname">홀명</th>
						<th class="hfu_hcapa"> 보증 인원</th>
						<th class="hfu_htime">예식 간격</th>
					</tr>
					<c:forEach items="${elist}" var="evo">
					<tr>

						<td><input type="radio" name="r_typeselect" class="r_typeselect" value="${evo.typeno}"></td>
						<td class="typename">${evo.typename}</td>
						<td class="wguest">${evo.wguest}</td>
						<td class="tinterval">${evo.tinterval}</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				<div class="hfu_estimate_section">
				<span class="hfu_detail_subtitle">사용료</span>
				<table class="hfu_estimate_table">
					<tr>
						<th class="hfu_fsel">선택</th>
						<th class="hfu_fname">상품명</th>
						<th class="hfu_fprice">가격</th>
						<th class="hfu_fetc">비고</th>
						<th class="hfu_fcontent">내용</th>
					</tr>
				</table>
				<table class="selection_table">
					<!-- json -->									
				</table>
				</div>
				<div class="hfu_estimate_section">
				<span class="hfu_detail_subtitle">연회메뉴</span>
				<table class="hfu_estimate_table">
					<tr>
						<th class="hfu_msel">선택</th>
						<th class="hfu_mkind">종류</th>
						<th class="hfu_mprice">단가</th>
						<th class="hfu_mcontent">내용</th>
					</tr>
				</table>
				<table class="meal_table">
					<!-- json -->									
				</table>
				
			</div>
			<div class="hfu_estimate_section">
				<span class="hfu_detail_subtitle">음료 및 주류</span>
				<table class="hfu_estimate_table">
					<tr>
						<th class="hfu_msel">선택</th>
						<th class="hfu_mkind">종류</th>
						<th class="hfu_mprice">단가</th>
						<th class="hfu_mcontent">수량</th>
					</tr>
				</table>
				<table class="drink_table">
					<!-- json -->									
				</table>
				
				<label id="totalEstimate"></label><!-- 내용 채워넣는 부분 -->
			</div>
			</div>
			<div class="hfu_detail_botContainer">
				<span class="hfu_estimate_ok" id="estimate_ok">견적 확인</span>
			</div>
			
		</div>
	</div>
	</div>	
	<!--  footer  -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
<script>
var HOME_PATH = window.HOME_PATH || '.';
if("${vo.hmap}"==''){
	$("#map").append("※아직 지도가 등록되지 않았습니다.");
	$("#map").css("border","1px solid red");
	$("#map").css("text-align","center");
}else{
	var hmap= "${vo.hmap}".split(",");
	var hall = new naver.maps.LatLng(hmap[0],hmap[1]),
	    map = new naver.maps.Map('map', {
	      	center: hall.destinationPoint(0, 500),
	        zoom: 10
	    }),
	    marker = new naver.maps.Marker({
	        map: map,
	        position: hall
	    });
	


var contentString = [
		'<div class="iw_inner" style="padding-left:10px;padding-right:10px;">',
 		'	<h4>${vo.hname}</h4><hr>',
		'	<p>${vo.address}<br />',
		'	   ${vo.tel}<br />',
		'		<a href="${vo.hurl}" target="_blank" >${vo.hurl}</a>',
		'	</p>',
		'</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);
}
</script>
</html>