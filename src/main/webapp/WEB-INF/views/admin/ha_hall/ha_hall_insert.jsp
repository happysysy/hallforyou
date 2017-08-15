<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@page import= "java.util.ArrayList, com.spring.vo.AreaVO" %>
<%
ArrayList<String> cityList =(ArrayList<String>)request.getAttribute("cityList");
ArrayList<String> guList =(ArrayList<String>)request.getAttribute("guList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_sy_body.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_hall.css">
<style>

	div.button{
		padding-top: 10px;
		margin-right: 30px;
		margin-bottom: 10px;
	}
	div.button a{
		text-decoration: none;
		float: right;
		margin-left: 10px;
	}

	div.button#deleteBtn{
		margin-right: 0px;
		float: right;
	}
	div.space{
		height: 20px;
	}
	div.space2{
		height: 60px;
	}
	div.space2 div.button a{
		float:left;
	}
	
	img.himage{
		background-color: #BDBDBD;
		height:400px;
		max-width: 600px;
		display: inline-block;
		float:left;
		margin-top: 100px;
	}
	div.image_list{
		display: block;
		clear:both;
		border: 1px solid gray;
		padding: 10px;
	}
	div.image_list ul{
		padding-left: 0px;
		list-style-type: none;
	}
	div.image_list ul li{
		display: inline;
		width: 200px;
	}
	div.image_list img.hallimg{
		width: 13%;
		height: 110px;
		opacity: 0.7;
	}
	input#submit{
		width: 80px;
	}
	table.hall{
		width: 100%;
	}
	.lab, .con{
		padding: 5px;
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
	td.con select{
		padding: 0 20px 0 20px;
		height: 30px;
	}

	td.con select#gu{
		min-width: 150px;
	}
	td.con div.pack_file{
		padding-bottom: 10px;
	}
	td.con input#fname{
		width: 150px;
	}
	td.con span#fselectbtn{
		min-width: 70px;
		position: absolute;
		background-color: #BDBDBD;
		color: white;
		padding: 0 20px 5px 20px;
	}
	td.con input#fselect{
		width: 100px;
		position: relative;
		opacity: 0;
		padding: 0;
	}
	div.detail{
		margin:20px 0 20px 0;
		padding: 20px;
	}
	div.detail textarea.introInsert{
		width: 100%;
	}
	td.con input{
		padding: 3px;
		width: 250px;
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
	.guide{
		color: gray;
		text-align: right;
		margin-right:100px;
	}
	input#guest{
		width: 40px;
	}

</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_q_WRp93KAjolnqwsUqK"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var fileTarget=$('#fselect');
  		
	fileTarget.on('change',function(){
		if(window.FileReader){
			//modern browser
			var filename = $(this)[0].files[0].name;
				$("#fname").val(filename);
		}else{
			//old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
			$("#fname").val(filename);
		}
	 });
	
	/*----------------------------------사진올리기시작----------------------------------*/
	var file1Target=$('.file1');
	file1Target.on('change',function(){
		if(window.FileReader){
			//modern browser
			var filename = $(this)[0].files[0].name;
				$("input[type=text].file1").val(filename);
		}else{
			//old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
			$("input[type=text].file1").val(filename);
		}
 	});
	var file2Target=$('.file2');
	file2Target.on('change',function(){
		if(window.FileReader){
			//modern browser
			var filename = $(this)[0].files[0].name;
				$("input[type=text].file2").val(filename);
		}else{
			//old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
			$("input[type=text].file2").val(filename);
		}
 	});
	var file3Target=$('.file3');
	file3Target.on('change',function(){
		if(window.FileReader){
			//modern browser
			var filename = $(this)[0].files[0].name;
				$("input[type=text].file3").val(filename);
		}else{
			//old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
			$("input[type=text].file3").val(filename);
		}
 	});
	var file4Target=$('.file4');
	file4Target.on('change',function(){
		if(window.FileReader){
			//modern browser
			var filename = $(this)[0].files[0].name;
				$("input[type=text].file4").val(filename);
		}else{
			//old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
			$("input[type=text].file4").val(filename);
		}
 	});
	var file5Target=$('.file5');
	file5Target.on('change',function(){
		if(window.FileReader){
			//modern browser
			var filename = $(this)[0].files[0].name;
				$("input[type=text].file5").val(filename);
		}else{
			//old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();
			$("input[type=text].file5").val(filename);
		}
 	});
	/*-----------------------------------사진올리기끝-----------------------------------*/

		
		$(".hallimg").click(function(){
			$("img.himage").attr("src", $(this).attr("src"));
		});
		$("#thumbBtn").click(function(){
			$("img.himage").attr("src", "../image/img1.PNG");
		});
		$("img.hallimg").mouseenter(function(){
			$(this).css("opacity", "1");
		});
		$("img.hallimg").mouseleave(function(){
			$(this).css("opacity", "0.7");
		});
		$("#formsubmit").click(function(){
			hallSave.submit();
		});
		$("select#city").change(function(){
  				var id = $(this).attr("id");
  				option = "";
  				
  				if(id=="city"){
  					option = $("#city option:selected").val();
  				}if(id=="gu"){
  					option = $("#gu option:selected").val();
  				}
				
  				$.ajax({
  					url : 'http://localhost:9000/hallforyou/admin/addressCall.do',
  					type : 'POST',
  					data : 'id='+id+'&option='+option,
  					dataType : "json",   					
  					success : function(data) { 
  						$("#gu option").remove();//쌓여있는  option을 먼저 삭제
  						str = "<option>시/군/구 선택</option>";		  								
						$("#gu").append(str); 
  						if(data.length !=0){  						
  							for(var i=0; i<data.length;i++){ 
  								if(id=="city"){
	  								str = "<option value=" + data[i].gu +">"
	  									+ data[i].gu
	  									+ "</option>";		  								
	  								$("#gu").append(str);  								 									
  								}
  								
  							}  						
  						}
  					}//end of success
  					
  				});//end of ajax  				
				
			});
	});
	$.ajax({
		url : 'http://localhost:9000/hallforyou/admin/addressCall.do',			
		dataType : "json",
		success : function(data) {				
			if(data.length !=0){
				for(var i=0; i<data.length;i++){						
					str = "<option value=" + data[i].city +">"
						+ data[i].city
						+ "</option>";							
					$("#city").append(str);
				}
			
			}
		}
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
		<h3 class="ishall">홀 정보입력</h3>
		<hr>
		<form name="hallSave" action="hall_save.do" method="post" enctype="multipart/form-data">

			<div class="button">
				<a href="http://localhost:9000/hallforyou/admin/hall.do"><span>목록으로</span></a>
				<a><span id="formsubmit">입력완료</span></a>
			</div>
			<div class="pack_hallTitle"></div>

			<div class="about_hall">
				<img class="himage"
					src="http://localhost:9000/hallforyou/img/notImage.PNG">

				<div class="hexplain">
					<div class="hallname">상세정보</div>

					<hr>
					<table class="hall">
						<tr>
							<td class="lab"><strong>*홀이름</strong></td>
							<td class="con"><input type="text" name="hname"></td>
						</tr>
						<tr>
							<td class="lab"><strong>*대표이미지</strong></td>
							<td class="con"><input type="text" id="fname"
								name="thumbnail">&nbsp;<span id="fselectbtn">파일추가</span><input
								id="fselect" type="file" name= "file"></td>
						</tr>
						<tr>
							<td class="lab"><strong>*주소</strong></td>
							<td class="con">
								<select name="city" class="area" id="city">
										<option>시/구 선택</option>
								</select> 
								<select name="gu" class="area" id="gu">
										<option>시/군/구 선택</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="lab"><strong>*추가주소</strong></td>
							<td class="con"><input type="text" name="address" id="area"
								placeholder="검색할 주소를 입력하세요"></td>
						</tr>
						<tr>
							<td class="lab"><strong>*홀타입</strong></td>
							<td class="con"><input type="text" name="hlist"></td>
						</tr>
						<tr>
							<td class="lab"><strong>*메뉴종류</strong></td>
							<td class="con"><input type="text" name="mlist"></td>
						</tr>
						<tr>
							<td class="lab"><strong>*식사비용</strong></td>
							<td class="con"><input type="text" name="mprice"></td>

						</tr>
						<tr>
							<td class="lab"><strong>*전화</strong></td>
							<td class="con"><input type="text" name="tel"></td>
						</tr>
						<tr>
							<td class="lab"><strong>*보증인원</strong></td>
							<td class="con">
							<div class="guest">
								<span>최소보증인원</span><input type="text" name="minguest" id="guest"><span>명/</span>
								최대수용인원<input type="text" name="maxguest" id="guest">명						
							</div>
							</td>
						</tr>
						<tr>
							<td class="lab"><strong>사이트</strong></td>
							<td class="con"><input type="text" name="hurl" placeholder="http부터 입력해주세요"></td>
						</tr>
						<tr>
							<td class="lab"><strong>이미지</strong></td>
							<td class="con">
								<div class="pack_file">
									<input type="text" id="fname" name="fname1" class="file1"> <span
										id="fselectbtn">파일추가</span> <input id="fselect" type="file" name="imageArray"  class="file1">
								</div>
								<div class="pack_file">
									<input type="text" id="fname" name="fname2" class="file2"> <span
										id="fselectbtn">파일추가</span> <input id="fselect" type="file" name="imageArray" class="file2">
								</div>
								<div class="pack_file">
									<input type="text" id="fname" name="fname3" class="file3"> <span
										id="fselectbtn">파일추가</span> <input id="fselect" type="file" name="imageArray" class="file3">
								</div>
								<div class="pack_file">
									<input type="text" id="fname" name="fname4" class="file4"> <span
										id="fselectbtn">파일추가</span> <input id="fselect" type="file" name="imageArray" class="file4">
								</div>
								<div class="pack_file">
									<input type="text" id="fname" name="fname5" class="file5"> <span
										id="fselectbtn">파일추가</span> <input id="fselect" type="file" name="imageArray" class="file5">
								</div>

							</td>
						</tr>
					</table>
					<div class="guide">※ *가 붙어있는 항복은 필수입력사항입니다.</div>

				</div>
			</div>

			
			<div class="space"></div>
			<div class="detail">
				<div>
					<b>설명</b>
				</div>
				<hr>
				<div class="intro">
					<textarea name="hcomment" cols="100%" rows="10" class="introInsert"></textarea>
				</div>
			</div>
		</form>
	</div>
	<div class="footer">
		
	</div>
	

</body>
</html>