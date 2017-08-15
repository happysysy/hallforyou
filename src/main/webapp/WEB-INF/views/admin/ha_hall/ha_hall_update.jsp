<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@page import ="com.spring.vo.HallVO, java.util.ArrayList, com.spring.vo.AreaVO, com.spring.vo.ImageVO" %>
<%
	HallVO vo = (HallVO)request.getAttribute("hallvo");
	ArrayList<String> cityList=(ArrayList<String>)request.getAttribute("cityList");
	ArrayList<String> guList=(ArrayList<String>)request.getAttribute("guList");
	AreaVO areavo = (AreaVO)request.getAttribute("areavo");
	String minguest=(String)request.getAttribute("minguest");
	String maxguest=(String)request.getAttribute("maxguest");
	ArrayList<ImageVO> imgList = (ArrayList<ImageVO>)request.getAttribute("imgList");
	String num= (String)request.getAttribute("num");

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
	img.himage{
		height:400px;
		width: 600px;
		display: inline-block;
		float:left;
		padding-top: 50px;
	}
	div.image_list{
		display: block;
		clear:both;
		border: 1px solid gray;
		padding: 10px;
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
	td.con input{
		padding: 3px;
		width: 250px;
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
	span.fselectimposible{
		margin-left: 10px;
	}
	td.con input#fname{
		width: 150px;
	}
	td.con span#fselectbtn{
		min-width: 65px;
		position: absolute;
		background-color: #BDBDBD;
		color: white;
		padding: 0 20px 5px 20px;
	}
	td.con input.fselect{
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
	input#guest{
		width: 40px;
	}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_q_WRp93KAjolnqwsUqK"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		var fileTarget=$('input[name=file]');
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
		$("input[type=checkbox]").mouseenter(function(){
			var chkboxid =$(this).val();
			$("img#"+chkboxid).css("opacity", 1);
		});
		$("input[type=checkbox]").mouseleave(function(){
			var chkboxid =$(this).val();
			$("img#"+chkboxid).css("opacity", 0.7);
		});
		$("#formSubmit").click(function(){
			hallUpdate.submit();
		});
		$("select.area").change(function(){
			var id = $(this).attr("id");
			option = "";
			
			if(id=="city"){
				option = $("#city option:selected").val();
			}else if(id=="gu"){
				option = $("#gu option:selected").val();
			}
	
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/addressCall.do',
				type : 'POST',
				data : 'id='+id+'&option='+option,
				dataType : "json",   					
				success : function(data) { 
					$("#gu option").remove();
					str = "<option>시/군/구 선택</option>";		  								
					$("#gu").append(str); 
							if(data.length !=0){
								var guval=$("#guval").val();
								for(var i=0; i<data.length;i++){ 
									if(id=="city"){
										str = "<option value=" + data[i].gu +">"
											+ data[i].gu
											+ "</option>";
										selectedstr="<option value="+data[i].gu+" selected>"+data[i].gu+"</option>";
										if(data[i].gu==guval){
											$("#gu").append(selectedstr);
										}
										else{
											$("#gu").append(str);
										}
									}
								}  						
							}
				}//end of success
			});//end of ajax
		});
		$(".fselectimposible").click(function(){
			alert("사진을 삭제 후 추가해주세요");
		});
		var num="${num}";
		$("#deleteBtn").click(function(){
			var checkList=[];
			$("input[name=list]:checked").each(function() {
			    var test = $(this).val();
			    checkList.push(test);
			});
			
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/imgDelete.do',
				type : 'POST',/*한글깨짐 방지*/
				data : 'checkList='+checkList,
				dataType : "json",   					
				success : function(data) { 
					for(var i=0;i<checkList.length;i++){
						
//						alert($(".addfile").attr("id"));
						$("div#"+checkList[i]).remove();
						var str2="<div class='pack_file'><input type='text' id='fname' class='"+num+"' readonly>"+
						"<span id='fselectbtn' class='newfselectbtn'>파일추가</span><input class='fselect' type='file' name='imageArray' id='"+num+"'></div>";
						
						$("#addfile").append(str2);
						$("span.newfselectbtn").css("margin-left", "10px");

						num=eval(num)+1;
					}
					if(data.length != 0){
						$("#imgList").empty();
						for(var i =0;i<data.length;i++){
							var str="<li class='hallimg'><input type='checkbox' name='list' value="+data[i].fno+
							"><img src='http://172.16.13.3:9000/hallforyou/upload/"+data[i].pfname+"' class='hallimg'></li>";
							$("#imgList").append(str);
							$("#imgList").load("/admin/hall_update.do"); 
						}		
					}//end of if
					else{
						$("#imgList").empty();
					}
					var fileTarget2=$('input.fselect');
			  		fileTarget2.on('change',function(){
			  			if(window.FileReader){
			  				//modern browser
			  				var filename = $(this)[0].files[0].name;
			  				var fileclass=$(this).attr("id");
			  				$("input[type=text]."+fileclass).val(filename);
			  			}else{
			  				//old IE
			  				var filename = $(this).val().split('/').pop().split('\\').pop();
			  				var fileclass=$(this).attr("id");	
			  				$("input[type=text]."+fileclass).val(filename);
			  			}
			  	 	});
				},error: function (data){
					alert("실패");
				}//end of success					
			});//end of ajax  
		});
		/*----------------------------------사진올리기시작----------------------------------*/
  		var fileTarget2=$('input.fselect');
  		fileTarget2.on('change',function(){
  			if(window.FileReader){
  				//modern browser
  				var filename = $(this)[0].files[0].name;
  				var fileclass=$(this).attr("id");
  				$("input[type=text]."+fileclass).val(filename);
  			}else{
  				//old IE
  				var filename = $(this).val().split('/').pop().split('\\').pop();
  				var fileclass=$(this).attr("id");	
  				$("input[type=text]."+fileclass).val(filename);
  			}
  	 	});
  		/*----------------------------------사진리스트 수정끝----------------------------------*/

	});
	
	$.ajax({
		url : 'http://localhost:9000/hallforyou/admin/addressCall.do',			
		dataType : "json",
		success : function(data) {				
			if(data.length !=0){
				
				var cityval=$("#cityval").val();
				for(var i=0; i<data.length;i++){
					selectedstr="<option value="+data[i].city+" selected>"+data[i].city+"</option>";
					str = "<option value=" + data[i].city +">"
						+ data[i].city
						+ "</option>";							
					if(data[i].city==cityval){
						$("#city").append(selectedstr);
					}else{
						$("#city").append(str);
					}
				}
				$.ajax({
  					url : 'http://localhost:9000/hallforyou/admin/addressCall.do',
  					type : 'POST',
  					data : 'id='+"city"+'&option='+cityval,
  					dataType : "json",   					
  					success : function(data) { 
  						$("#gu option").remove();
  						str = "<option>시/군/구 선택</option>";		  								
						$("#gu").append(str); 
  						if(data.length !=0){
  							var guval=$("#guval").val();
  							for(var i=0; i<data.length;i++){ 
  								
  								str = "<option value=" + data[i].gu +">"
  									+ data[i].gu
  									+ "</option>";
  								selectedstr="<option value="+data[i].gu+" selected>"+data[i].gu+"</option>";
  								if(data[i].gu==guval){
  									$("#gu").append(selectedstr);
  								}
  								else{
  									$("#gu").append(str);
  								}
  								
  							}  						
  						}
  					}//end of success
  					
  				});//end of ajax 
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
		<h3 class="ishall">홀 정보수정</h3>
		<hr>
		<form name="hallUpdate" action="hall_update_save.do" method="post" enctype="multipart/form-data">
		<div class="button">
			<a href="http://localhost:9000/hallforyou/admin/hall_content.do"><span>취소</span></a>
			<a><span id="formSubmit">입력완료</span></a>
		</div>
		<div class="pack_hallTitle">
		</div>
		<div class="about_hall">
			<img class="himage" src="http://172.16.13.3:9000/hallforyou/upload/<%=vo.getPthumbnail()%>">

			<div class="hexplain">
				<div class="hallname">상세정보</div>

				<hr>

				<table class="hall">
					<tr>
						<td class="lab"><strong>홀이름</strong></td>
						<td class="con"><input type="text" name="hname" value="<%=vo.getHname()%>"></td>
					</tr>
					<tr>
						<td class="lab"><strong>대표이미지</strong></td>
						<td class="con">
							<input type="text" id="fname" name="thumbnail" value="<%=vo.getThumbnail()%>" readonly>&nbsp;<span id="fselectbtn">파일추가</span><input class="fselect" type="file" name="file">
						</td>
					</tr>
					<tr>
						<td class="lab"><strong>주소</strong></td>
						<td class="con">
							<input type="hidden" id="cityval" value="<%=vo.getCity() %>">
							<select name="city" class="area" id="city">
								<!-- option selected해놔야함 -->
								<option>시/도 선택</option>
							</select>
							<input type="hidden" id="guval" value="<%=vo.getGu()%>">
							<select name="gu" class="area" id="gu">
								<option>시/군/구 선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="lab"><strong>추가주소</strong></td>
						<td class="con"><input type="text" name="address" id="area" value="<%=vo.getAddress() %>" placeholder="검색할 주소를 입력하세요"></td>
					</tr>
					<tr>
						<td class="lab"><strong>홀타입</strong></td>
						<td class="con"><input type="text" id="hlist" name="hlist" value="<%=vo.getHlist()%>"></td>
					</tr>
					<tr>
						<td class="lab"><strong>메뉴종류</strong></td>
						<td class="con"><input type="text" name="mlist" value="<%=vo.getMlist()%>"></td>
					</tr>
					<tr>
						<td class="lab"><strong>식사비용</strong></td>
						<td class="con"><input type="text" name="mprice" value="<%=vo.getMprice()%>"></td>
						
						
					</tr>
					<tr>
						<td class="lab"><strong>전화</strong></td>
						<td class="con"><input type="text" name="tel"value="<%=vo.getTel()%>"></td>
					</tr>
					<tr>
						<td class="lab"><strong>보증인원</strong></td>
						<td class="con">
						<div class="guest">
								<span>최소보증인원</span><input type="text" name="minguest" id="guest" value="<%=minguest%>"><span>명/</span>
								최대수용인원<input type="text" name="maxguest" id="guest" value="<%=maxguest%>">			
							</div>
					</tr>
					<tr>
						<td class="lab"><strong>사이트</strong>
						<c:choose>
							<c:when test="${ vo.hurl eq '' || vo.hurl eq 'null'}">
								<td class="con"><input type="text" name="hurl" placeholder="http부터 입력해주세요"></td>
							</c:when>
							<c:otherwise>
								<td class="con"><input type="text" name="hurl" value="<%=vo.getHurl()%>" placeholder="http부터 입력해주세요"></td>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td class="lab"><strong>이미지</strong></td>
						<td class="con" id="addfile">
						<%if(imgList.size()!=0){ %>
							<%for(int i=0;i<imgList.size();i++){ %>
								<div class="pack_file"  id="<%=imgList.get(i).getFno()%>">
									<input type="text" id="fname" value="<%=imgList.get(i).getFname()%>" class="<%=imgList.get(i).getFno()%>" readonly>
									<span id="fselectbtn" class="fselectimposible">파일추가</span>
								</div>
							<%} %>
							<%for(int i=imgList.get(0).getFno()+1; i<Integer.parseInt(num); i ++){ %>
							<div class="pack_file">
								<input type="text" id="fname" class="<%=i %>" readonly>
								<span id="fselectbtn">파일추가</span>
								<input class="fselect" type="file" name="imageArray" id="<%=i%>">
							</div>
							<%} %>
						<%} else{%>
							<%for(int i=0; i<5; i ++){ %>
							<div class="pack_file">
								<input type="text" id="fname" class="<%=i %>" readonly>
								<span id="fselectbtn">파일추가</span>
								<input class="fselect" type="file" name="imageArray" id="<%=i%>">
							</div>
							<%} %>
						<%} %>
						</td>
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
			<div>
				<b>image list</b> <i style="font-size: 12px;">(10장까지 업로드 할 수 있습니다)</i>
				
				<div class="button" id="deleteBtn">
					<a><span id="deleteBtn" style="margin-right: 50px;">선택삭제</span></a>
				</div>
				
			</div>

			<div class="space"></div>
			<hr>
			<ul id ="imgList">
			
				<%if(imgList.size()!=0){
					for(ImageVO img : imgList){ %>
					<li class="hallimg"><input type="checkbox" name="list" value="<%=img.getFno()%>"><img
					src="http://172.16.13.3:9000/hallforyou/upload/<%=img.getPfname() %>" class="hallimg" id="<%=img.getFno()%>"></li>
				<%} }%>
				
			</ul>
		</div>



		<div class="space"></div>
		<div class="detail">
			<div><b>설명</b></div><hr>
			<div class="intro">
			<c:choose>
			<c:when test="${ vo.hcomment eq null || vo.hcomment eq '' }">
				<textarea cols="100%" rows="10" class="introInsert" name="hcomment"></textarea>
			</c:when>
			<c:otherwise>
				<textarea cols="100%" rows="10" class="introInsert" name="hcomment"><%=vo.getHcomment() %></textarea>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
		<input type="hidden" name="hno" value="<%=vo.getHno()%>">
		<input type="hidden" name="pthumbnail" value="<%=vo.getPthumbnail()%>">
		</form>
	</div>
	<c:import url="http://localhost:9000/hallforyou/ha_footer.do"></c:import>


</body>
</html>