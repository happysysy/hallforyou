<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page session = "true" %>
<%	String member_id = (String)session.getAttribute("member_id");%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Hall for you</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script>
		$(document).ready(function(){
			
			$("#login_btn").click(function(){
				
				$("#loginModal").css("display","block");
				var url = location.href;
				$("#url").val(url);
				
			});
			
			$("#login_btn2").click(function(){
				
				$("#loginModal").css("display","block");
				var url = "http://localhost:9000/hallforyou/user/hfu_myhall.do";
				$("#url").val(url);
				
			});
			
			
			$("#loginCheck").click(function(){
				if($("#id").val() == ""){
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return false;
				}else if($("#pass").val() == ""){
					alert("비밀번호를 입력하세요.");
					$("#pass").focus();
					return false;
				}
				
					/* 로그인체크 */
					var id = $("#id").val();
					var pass = $("#pass").val();
					$.ajax({
						url : 'http://localhost:9000/hallforyou/loginSuccessCheck',
			  			type : 'POST',
						data : 'id=' + id + '&pass=' + pass,
						success : function(data) {
							if(data == "IN") {
								$("#idresult").text("아이디를 확인해주세요.").css("color","red")
								.css("font-size","9pt");
							}else if(data == "PN"){
								$("#idresult").text("비밀번호를 확인해주세요.").css("color","red")
								.css("font-size","9pt");
							}else {
								loginForm.submit();
							}
						}
					});
					
				
			});
		});
	</script>
 	<style>
 	
						/****** content ******/
body {
	display:block;
	width:100%;
}


h3.bottom_bar {				/* content 상단 바  */
	display:block;
	width:100%;
	margin-left:20px;
}
				
div.content {				/* content 영역 설정 */
	display:block;
	width:1200px;
	margin-right:auto;
	margin-left:auto;
	background-color:white;
	
} 

div.okCancel {				/* 모든 페이지 확인(회원가입, 로그인 등), 취소 버튼(기본 설정) */
	display:inline-block;
	width:100%;
	text-align:center;
}

/****************************** 메인 ***********************/

div.item a img {
	 margin-left:auto;
	 margin-right:auto;
}
		span.idresult {
			margin-left : 30px;
		}
		div.okCancel{
			margin-top : 10px;
		} 
		
		header {					/* 헤더 맨 위에 */
	display:block;
	width:100%;
	background-color: #FFEFEE;
}

body {
	display:block;
	width:100%;
}

header div.header{
	width:1200px;

	height:100px;
	border:1px solid red;
}

header div.header nav ul{				/* 헤더 로그인 메뉴 */
	list-style-type:none;
	text-align:right;
	padding-top:10px;
}

header div.header nav ul li {			/* 헤더 로그인 메뉴 */
	display:inline;
}

header div.header nav ul li a {		/* 헤더 로그인 메뉴 */
	text-decoration:none;
	padding-left:5px;
	padding-right:5px;
	font-size:12px;
	color:#666666;
}

header div.header section.h_section {	/* 헤더 메뉴 세션  */
	display:block;
	width:1200px;
	margin-bottom:0px; /* 헤더 컨텐츠 사이 간격 */
	margin-left:auto;
	margin-right:auto;
	border:1px solid blue;
}
 
header div.header section.h_section a.main {/* 헤더 메인 로고 */
	display:block;
	width:300px;
	height:0px;
	padding-top:0px;
	margin-left:auto;
	margin-right:auto;
}
div.hs_manu {
	display:block;
	width:100%;
	height:50px;
	background-color:#CE8A8A;
}

ul.hs_ul {					/* 헤더 메인 메뉴 */
	display:block;
	width:1200px;
	padding-top:10px;
	text-align:center;
	list-style-type:none;
	margin-left:auto;
	margin-right:auto;
	color:black;
}

ul.hs_ul li {				/* 헤더 메인 메뉴 */
	display:inline;
	font-size:20px;
	padding-left:25px;
	padding-right:25px;
}

ul.hs_ul li a { 
	color:white; 
	text-decoration:none;
}	
 	</style>
</head>



<body>
	<!-- ########## header start ########## -->
	<header>
		<div class="header btstr">
			<nav>
				<ul>
					<li><a id="login_btn" style="cursor:pointer;" data-toggle="modal" target="_top">로그인</a></li>
					<li><span>|</span></li>
					<li><a href="http://localhost:9000/hallforyou/user/hfu_join.do"	target="_top">회원가입</a></li>
					<li><span>|</span></li>
					<li><a href="http://localhost:9000/hallforyou/user/hfu_help.do">ID/PW 찾기</a></li>
				</ul>
			</nav>
			<section class="h_section">
				<ul class="hs_ul">
				<li><a href="http://localhost:9000/hallforyou/user/hfu_hallsearch.do">홀 검색</a></li>
				<li><a id="login_btn2" style="cursor:pointer" data-toggle="modal">마이 홀</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_event.do" target="_top">이벤트</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">Q&A</a></li>
			</ul>
			</section>
		</div>
		<div class="hs_manu">
			<ul class="hs_ul">
				<li><a href="http://localhost:9000/hallforyou/user/hfu_hallsearch.do">홀 검색</a></li>
				<li><a id="login_btn2" style="cursor:pointer" data-toggle="modal">마이 홀</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_event.do" target="_top">이벤트</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_qna_list.do">Q&A</a></li>
			</ul>
		</div>
	</header>

	<!-- 로그인 모달 -->
	<div id="loginModal" class="loginModal">
		<div class="loginModal_content">
			<div class="lm_close">
				<span onclick="document.getElementById('loginModal').style.display='none'" class="lClose">&times;</span>
			</div>
			<div class="lm_title">
				<h4>Login</h4><hr/>
			</div>
			
			<div class="lm_midContainer">
				<form name="loginForm" action="loginCheck" method="post">
				<div class="login">
					<div class="login_input">
							<table style="width:280px">
								<tr>
									<td class="ftd">ID</td>
									<td><input type="text" name="id" id="id" size="20" maxlength="50" placeholder="아이디"></td>
								</tr>
								<tr>
									<td class="ftd">PW</td>
									<td><input type="password" name="pass" id="pass" size="20" maxlength="50" placeholder="비밀번호"></td>
								</tr>
							</table>
					</div>
					<span class="btnLogin" id="loginCheck" style="cursor: pointer">LOGIN</span>
				</div>
				<input type="hidden" name="url" id="url" value="">
				</form>
				<span class="idresult" id="idresult" name="idresult" value=""></span>
				<br>
				<div class="okCancel">
					<span><a class="joinIDPW" href="http://localhost:9000/hallforyou/user/hfu_join.do">회원가입</a></span>
					<span><a class="joinIDPW" href="http://localhost:9000/hallforyou/user/hfu_help.do">ID/PW 찾기</a></span>
				</div>
			</div>
		</div>
	</div>
	<!-- ########## header end ########## -->
                                                              
	<!-- ########## content start ########## -->
	<div class="content" style="width:100%">
		<div class="content_newhall">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  		<ol class="carousel-indicators">
		    		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox" style="text-align:center">

					<div class="item active">
						<img src="img/newhall1.jpg" width="100%">
					    <div class="carousel-caption">
						</div>
					</div>
					
					<div class="item">
						<img src="img/newhall2.jpg" width="100%">
						<div class="carousel-caption">
				      	</div>
					</div>
					
					<div class="item">
						<img src="img/newhall3.jpg"  width="100%">
						<div class="carousel-caption">
				      	</div>
					</div>
				</div>
		
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		
		<div class="content_besthall">
			<h3 style="text-align:center">Best Hall</h3><hr/>
			<div class='row'>
			<div class='col-md-12'>
			<div class="carousel slide media-carousel" id="media">
			<div class="carousel-inner">
							
				<div class="item  active" style="text-align:center">
				<div class="row">
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall1.jpg"><div class="carousel-caption"><h5>예)1번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>          
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall2.jpg"><div class="carousel-caption"><h5>예)2번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall3.jpg"><div class="carousel-caption"><h5>예)3번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>        
				</div>
				</div>
							
				<div class="item">
				<div class="row">
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall4.jpg"><div class="carousel-caption"><h5>예)4번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall5.jpg"><div class="carousel-caption"><h5>예)5번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall6.jpg"><div class="carousel-caption"><h5>예)6번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>        
				</div>
				</div>
				
				<div class="item">
				<div class="row">
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall7.jpg"><div class="carousel-caption"><h5>예)7번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>          
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall8.jpg"><div class="carousel-caption"><h5>예)8번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>
				<div class="col-md-4">
					<a class="thumbnail" href="#"><img alt="" src="img/besthall9.jpg"><div class="carousel-caption"><h5>예)9번 베스트 홀</h5><p>서울시 00구 00동</p></div></a>
				</div>      
				</div>
				</div>
			</div>
				<a class="left carousel-control" href="#media" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#media" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>                          
			</div>
			</div>
		</div>
	</div>
	<!-- ########## content end ########## -->
	
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>