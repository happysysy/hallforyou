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
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/member.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
  			/* 이메일 인증 */
			$("#email_check").click(function(){
  				
  				if($("#email").val() == ""){
  					alert("이메일을 입력하십시오");
  					$("#email").focus();
  					return false;
  				}else{
  					var email = $("#email").val();
  					$.ajax({
	  					url : 'http://localhost:9000/hallforyou/mail/mailSending',
	  					type : 'POST',
	  					data : 'email='+email,					  					
	  					success : function(data) {
	  						if(data==email){
	  							alert(data + "로 인증번호가 전송되었습니다.");
	  							$("#email").attr("readonly","true");
	  						}else
	  							alert("전송 실패.");
	  					}
	  				});
				}
  			});
  			
			$("#pwinquiry1").click(function(){
				if($("#member_name").val() == ""){
  					alert("이름을 입력하십시오");
  					$("#member_name").focus();
  					return false;
				}else if($("#member_id").val() == ""){
  					alert("아이디를 입력하십시오");
  					$("#email").focus();
  					return false;
  				}else if($("#email").val() == ""){
  					alert("이메일을 입력하십시오");
  					$("#email").focus();
  					return false;
  				}else if($("#emailc").val() == ""){
  					alert("인증번호를 입력하십시오");
  					$("#emailc").focus();
  					return false;
  				}
				pwinquiry.submit();
			});
		});
	</script>
	<style>
	.content{background-image: url(../img/mypage_background.jpg);}
	</style>
</head>
<body>
	<!-- ########## header start ########## -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>
	<!-- ########## header end ########## -->

	<!-- ########## member_help_pwinquiry start ########## -->
	<div class="content" style="height:600px;">
		<h3 class="bottom_bar">비밀번호 찾기</h3>
		<h4 class="help">
			<p>고객님의 아이디/패스워드를 찾기위해서는 이메일 인증을 거치셔야 합니다.</p>
			<p>아래의 인증 방법을 진행해 주세요.</p>
			<p>인증 완료시, E-mail을 통해 패스워드를 알려드립니다.</p>
		</h4>
		<form name="pwinquiry" id="pwinquiry" action="pwinquiry1" method="post">
			<table class="help">
				<tr>
					<td class="ftd">이름</td>
					<td><input type="text" size="30" maxlength="30" name="member_name" id="member_name"></td>
				</tr>
				<tr>
					<td class="ftd">아이디</td>
					<td><input type="text" size="30" maxlength="50" name="member_id" id="member_id"></td>
				</tr>
	 			<tr>
				  	<td class="ftd">E-Mail 인증</td>
				  	<td><input type="text" size="20" maxlength="60" name="email" id="email">　<button type="button" name="email_check" id="email_check">전송</button></td>
				</tr>
				<tr>
			   		<td class="ftd">인증번호</td>
			  		<td><input type="text" size="10" maxlength="6" name="emailc" id="emailc"></td>
				</tr>
			</table>
			<br><br><br><br>
			<div class="okCancel">
				<span style="cursor:pointer" class="joinAdmin_cancel" id="pwinquiry1" name="pwinquiry1">확인</span></a>
				<a href="http://localhost:9000/hallforyou/user/hfu_help.do"><span class="joinAdmin_cancel" id="">취소</span></a>
			</div>
		</form>
	</div>
	<!-- ########## member_help_pwinquiry end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>