<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.spring.vo.EventVO, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<%
	ArrayList<EventVO> list=(ArrayList<EventVO>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_sy_body.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_hall.css">
<style>
	h3{
		text-align: center;
		border-top: 20px;
		border-bottom:3px dotted #e2e2e2;
		
	}
	table.eventList{
		width: 100%;
		table-layout: fixed;
	}
	.eventList th{
		border-bottom:1px solid #e2e2e2;
		border-top: 1px solid #e2e2e2;
		padding: 15px;
		font-size: 14px;
	}
	.eventList td{
		border-bottom:1px solid #e2e2e2;
		height: 130px;
		padding: 10px;
	}
	.first{
		width: 5%;
	}	
	.second{
		width:20%; 
		text-align: center;
	}
	.third{
		width: 20%;
		padding-right: 20px;
	}
	.fourth{
		width: 40%;
		text-align: center;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	.fourth a{
		color: black;
		text-decoration: none;
	}
	.mngbtn{
		width: 15%;
		border-radius: 5px;
	}
	td.mngbtn span{
		background-color: gray;
		color: white;
		padding: 10px;
		border-radius: 5px;
	}
	td.mngbtn a{
		text-decoration: none;
	}
	div.button{
		padding-top: 20px;
		/*border-top:3px dotted #e2e2e2;*/
		margin-right: 30px;
		margin-bottom: 30px;
	}
	div.button a{
		text-decoration: none;
		float: right;
		margin-left: 10px;
	}
	div.button span{
		float: right;
		background-color: #888;
		padding: 10px 15px 10px 15px;
		margin-bottom: 20px;
		border-radius: 10px;
		color: white;
		font-size: 12px;
		cursor: pointer;
	}

	div.pagenation{
		padding: 20px;
		margin-top: 100px;
		text-align: center;
	}
	img.eventimg{
		width: 220px;
		height: 80px;
	}
	
	.modal2 input{
		display: none;
	}
	.modal2 {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding: 30px; /* Location of the box */
		left:30%;
		right: 30%;
		top: 200px;
		/* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgba(0,0,0,0.8);/* Fallback color */
		min-width:600px;
		padding-bottom: 50px;
	}
	.modal input{
		display: none;
	}
	input.modalUrl{
		width: 100%;
	}
	table.eventUpdate{
		width: 100%;
		background-color: white;
		height: 200px;
	}
	table.eventUpdate td.lab{
		width: 20%;
		text-align: center;
	}
	table.eventUpdate td.con{
		width: 60%;
	}
	.eventTitle{
		font-size: 20px;
	}
	.close b{
		font-size: 20px;
		color: #bbb;
	}
	.close b:hover,
	.close b:focus {
		color: white;
		text-decoration: none;
		cursor: pointer;
	}
	div.modal2 input.imgName{
		display: inline;
	}
	div.modal2 span.selectBtn{
		display: inline;
	}
	div.modal2 input.fileSelect{
		display: inline;
	}
	.modal2 input#hno{
		width: 70px;
	}

</style>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://localhost:9000/hallforyou/js/jquery.pagenavigator.js"></script>
<script>
	$("document").ready(function(){
		//alert($("#tcount").text());
	  $('#document_navi3').jaPageNavigator({
	      page_row : "5" // 보여질 게시물 목록 수
	    , page_link : "5" // 보여질 페이지 링크 수
	    , total_count : $("#tcount").text() // 게시물 총 수     
	    
	  });  
	});
</script>
<script>
	//모달 나타내주는 함수정의
	function modal(){
		$(".modal2 table td").css("padding-bottom", "20px");

		$("#myModal2").css("display","block");
		$(".modal2 input[type=text]").css("display","inline");
		$(".modal2 input[type=text]").css("padding","3px");
		
		$(".modal2 input[type=file]").css("opacity","0");
		$(".modal2 input[type=file]").css("position","relative");
		$(".modal2 input[type=file]").css("width","70px");
		$(".modal2 input[type=file]").css("padding-bottom","5px");
		$(".modal2 input#imgName").css("padding", "3px 40px");
		
		
		$(".modal2 span.selectBtn").css("background-color","gray");
		$(".modal2 span.selectBtn").css("color","white");
		$(".modal2 span.selectBtn").css("padding","5px");
		$(".modal2 span.selectBtn").css("position","absolute");
		
		$(".modal2 table td").css("display", "inline-block");
	}
	$(document).ready(function(){
		var fileTarget=$('#fselect');
  		
  		fileTarget.on('change',function(){
  			if(window.FileReader){
  				//modern browser
  				var filename = $(this)[0].files[0].name;
   				$("#imgName").val(filename);
  			}else{
  				//old IE
  				var filename = $(this).val().split('/').pop().split('\\').pop();
  				$("#imgName").val(filename);
   			}
	 });  
		
  		$(".updateEvent").click(function(){
  			//ajax로 데이터가져오기
  			
			$(".eventTitle").html("<b>이벤트수정</b>");
			$("#nkey").val("update");
			
			var eno =($(this).attr("id"));
			modal();
			$.ajax({
					url : 'http://localhost:9000/hallforyou/admin/callEvent.do?eno='+eno,
					type : 'POST',
					data : eno,
					dataType : "json",   					
					success : function(data) { 	 
						if(data.length !=0){
							$(".modal2 input[name=hno]").val(data.hno);
							$(".modal2 input[name=image]").val(data.image);
							$(".modal2 input[name=url]").val(data.url);			
						}
					}//end of success
					
				});//end of ajax
			$(".sendHidden").append('<input type="hidden" name="eno" id="eno" value='+eno+'>');
			
		});
  		$(".deleteEvent").click(function(){
			$("#nkey").val("delete");
			var eno =($(this).attr("id"));
			$(".sendHidden").append('<input type="hidden" name="eno" id="eno" value='+eno+'>');
			$("#hno").val("0");
			insertForm.submit();
  		});

		
		$("#insertEvent").click(function(){
			$(".eventTitle").html("<b>이벤트추가</b>");
			$("#eno").remove();
			$("#nkey").val("insert");
			modal();
		});
		$("span.insertBtn").click(function(){
			if($("#nkey").val()=='update'){
				if($("#imgName").val()=="" || $("#hno").val()=="" || $("#url").val()==""){
					if($("#hno").val()==""){
						alert("홀번호를 등록해주세요");
					}
					else if($("#imgName").val()==""){
						alert("이미지를 등록해주세요");
					}else if($("#url").val()==""){
						alert("url을 입력해주세요");
					}
				}else{
					insertForm.submit();
				}
			}else{
				if($("#imgName").val()=="" || $("#fselect").val()=="" || $("#url").val()==""){
					if($("#hno").val()==""){
						alert("홀번호를 등록해주세요");
					}
					else if($("#imgName").val()==""){
						alert("이미지를 등록해주세요");
					}
					else if($("#fselect").val()==""){
						alert("파일을 다시 선택해주세요");
					}
					else if($("#url").val()==""){
						alert("url을 입력해주세요");
					}
				}else{
					insertForm.submit();
				}
			}
		});
		$("input#hno").focusout(function(){
			var hno = $("input#hno").val();
			var isNumber=isNaN(hno);
			if(isNumber){
				alert("숫자로 입력하세요.");
				$("input#hno").val("");
			}
		});

		$("#close2").click(function(){
			$("#myModal2").css("display", "none");
			$(".modal2 input[type=text]").val("");
		});
		
		$(".trcontent").hover(function(){
			
		});
		
	});
</script>
</head>

<body class="hall">
	<!-- header -->
<!-- 	<c:if test="${!empty sessionScope.member_id}">
		<div style="margin:auto;text-align:right;width: 100%;font-size: 12px;padding-right:400px;">
			${ sessionScope.member_id }님의 계정입니다.
		</div>
	</c:if>
 -->
 	<c:choose>
		<c:when test="${sessionScope.member_id eq 'mainadmin'}">
			<c:import url="http://localhost:9000/hallforyou/ha_header.do"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="http://localhost:9000/hallforyou/ha_hmheader.do?admin_id=${sessionScope.member_id}"></c:import>
		</c:otherwise>
	</c:choose>
	<!-- header end-->
	<div class="content">
		<h3>이벤트 관리</h3>
		<form name="insertForm" action="event_insert.do" method="post" enctype="multipart/form-data">

			<div class="eventInsert">

				<div class="button">
					<span id="insertEvent">이벤트추가</span>
				</div>
			</div>

			<table class="eventList">
			
				<tr>
					<th class="first">no</th>
					<th class="second">hname</th>
					
					<th class="third">picture</th>
					<th class="fourth">url</th>
					<th></th>
				</tr>
			<% for(EventVO vo : list){ %>
				<tr class="trcontent">
					
					<td class="first"><%=vo.getRno() %></td>
					<td class="second"><%=vo.getHname() %></td>
					<td class="third"><img class="eventimg"
						src="http://172.16.13.3:9000/hallforyou/upload/<%=vo.getPimage() %>" /></td>
					<td class="fourth"><a href=<%=vo.getUrl() %>><%=vo.getUrl() %></a>
					</td>
					<td class="mngbtn"><span class="updateEvent" id="<%=vo.getEno()%>">수정</span> <span class="deleteEvent" id="<%=vo.getEno()%>">삭제</span></td>
					
				</tr>
			<%} %>
			</table>

			<!-- 수정modal 시작 -->
			
			<!-- 삽입modal시작 -->
			<div class="modal2" id="myModal2">
				<span class="close" id="close2" style="float: right;"><b>x</b></span>
				<table class="eventUpdate">
					<tr style="height: 0;">
						<td style="width: 100%"><div class="eventTitle">
							</div>
							<hr>
							<hr></td>
					</tr>
					<tr>
						<td class="lab">홀번호 :</td>
						<td class="con">
						<input type="text" name="hno" id="hno" class="modalUrl" placeholder="숫자입력">번</td>

					</tr>
					<tr>
						<td class="lab"><span>이미지 : </span></td>
						<td class="con">
						
							<input type="text" name="image" class="imgName" id="imgName" readonly>
							<span class="selectBtn">파일선택</span>
							<input type="file" name="file" class="fileSelect" id="fselect">
						</td>
					</tr>
					<tr>
						<td class="lab">url :</td>
						<td class="con">
						<input type="text" name="url" id="url" class="modalUrl" placeholder="url을 입력하세요"></td>

					</tr>
					<tr style="float: right">
						<td>
							<div class="button">
								<span class="insertBtn">삽입</span>
							</div>
						</td>
					</tr>
				</table>

			</div>
			
			<div class="sendHidden">
				<input type="hidden" name="nkey" id="nkey">
			</div>
		</form>
		<div class="pagenation">
			<%-- 페이지 네비게이션 화면 --%>
			<%-- 페이지 네비게이션 시작 --%>						
			<span id="tcount" style="display:none">${tcount}</span>		
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
	<div class="footer"></div>
</body>
</html>