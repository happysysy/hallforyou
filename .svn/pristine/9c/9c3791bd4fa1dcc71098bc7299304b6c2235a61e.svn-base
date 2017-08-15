<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session = "true" %>
<%	String member_id = (String)session.getAttribute("member_id");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Hall for you</title>
	
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/bootstrap.css">
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
		span.idresult {
			margin-left : 30px;
		}
		div.okCancel{
			margin-top : 10px;
		}
	</style>
</head>
	<header>
	<!-- 
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
				<a href="http://localhost:9000/hallforyou/user/hfu_index.do" class="main"><img src="http://localhost:9000/hallforyou/img/main.jpg"></a>
			</section>
		</div>
		 -->
		<div class="hs_manu">
			<nav>
				<ul>
					<li><a id="login_btn" style="cursor:pointer;" data-toggle="modal" target="_top">로그인</a></li>
					<li><span>|</span></li>
					<li><a href="http://localhost:9000/hallforyou/user/hfu_join.do"	target="_top">회원가입</a></li>
					<li><span>|</span></li>
					<li><a href="http://localhost:9000/hallforyou/user/hfu_help.do">ID/PW 찾기</a></li>
				</ul>
			</nav>
			<div>
			
			<ul class="hs_ul">
				<li><span class="hfu"><a class="hfua" href="http://localhost:9000/hallforyou/user/hfu_index.do">HALL FOR YOU</a></span></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_hallsearch.do">HALL</a></li>
				<li><a id="login_btn2" style="cursor:pointer" data-toggle="modal">MY HALL</a></li>
				<li><a href="http://localhost:9000/hallforyou/user/hfu_event.do" target="_top">EVENT</a></li>
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

</html>