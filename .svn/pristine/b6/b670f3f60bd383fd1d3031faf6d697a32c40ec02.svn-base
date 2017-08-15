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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
  		$(document).ready(function(){
  			/* 회원가입 폼 유효성 체크(validation check) */
  			$("#admin_join").click(function(){
  				
  				if($("#admin_id").val() == ""){
  					alert("아이디를 입력하십시오");
  					$("#admin_id").focus();
  					return false;
  				}else if($("#idresult").text() == "이미 사용 중입니다."){
  					alert("이미 존재하는 아이디입니다.");
  					$("#admin_id").focus();
  					return false;  
  				}else if($("#admin_pw").val() == ""){
  					alert("비밀번호를 입력하십시오");
  					$("#admin_pw").focus();
  					return false;
  				}else if($("#admin_pwc").val() == ""){
  					alert("비밀번호 확인을 입력하십시오");
  					$("#admin_pwc").focus();
  					return false;
  				}else if($("#admin_name").val() == ""){
  					alert("이름을 입력하십시오");
  					$("#admin_name").focus();
  					return false;
  				}else if($("#l1").val() == ""){
  					alert("사업자 번호를 입럭하십시오");
  					$("#l1").focus();
  					return false;
  				}else if($("#l2").val() == ""){
  					alert("사업자 번호를 입럭하십시오");
  					$("#l2").focus();
  					return false;
  				}else if($("#l3").val() == ""){
  					alert("사업자 번호를 입럭하십시오");
  					$("#l3").focus();
  					return false;
  				}else if($("#admin_phone").val() == ""){
  					alert("전화번호를 입력하십시오");
  					$("#admin_phone").focus();
  					return false;
  				}else if($("#cname").val() == ""){
  					alert("회사명을 입력하십시오.");
  					$("#cname").focus();
  					return false;
  				}
  				adminForm.submit();
  			});
  			
  			/* 아이디 중복 확인 */
  			$("#admin_id").focusout(function() {
				if($("#admin_id").val() == ""){
					$("#idresult").text("아이디를 입력하십시오.");
  					return false;
				}else{
					var admin_id = $("#admin_id").val();
					$.ajax({
						url : 'http://localhost:9000/hallforyou/idCheck',
	  					type : 'POST',
						data : 'member_id=' + admin_id,
						success : function(data) {
							if(data == "N") {
								$("#idresult").text("이미 사용 중입니다.").css("color","red")
								.css("font-size","9pt");
							} else {
								$("#idresult").text("사용이 가능합니다.").css("color","blue")
								.css("font-size","9pt");
							}
						}
					});
				}
			});
			
  			/* 비밀번호 확인 체크 */
  			$("#admin_pwc").blur(function(){
  				
  				if($("#admin_pwc").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#admin_pw").val() == $("#admin_pwc").val()){
  						$("#notice1").text("비밀번호가 동일합니다.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("비밀번호가 동일하지 않습니다.").css("color","red")
						.css("font-size","9pt");
  					}
  				}
  				
  			});
  			
			$("#admin_pw").blur(function(){
  				
  				if($("#admin_pw").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#admin_pw").val() == $("#admin_pwc").val()){
  						$("#notice1").text("비밀번호가 동일합니다.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("비밀번호가 동일하지 않습니다.").css("color","red")
						.css("font-size","9pt");
  					}
  				}			
  			});
		});
  
  	</script>
</head>
<body>
	<!-- ########## header start ########## -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>
	<!-- ########## header end ########## -->

	<!-- ########## joinAdmin start ########## -->
	<div class="content">
		<h3 class="bottom_bar">회원가입</h3>
		<form name="adminForm" id="joinForm" action="admin_join" method="post">
		<table class="adminjoin">
			<tr>
				<td class="ftd">아이디</td>
				<td><input type="text" size="30" maxlength="50" name="admin_id" id="admin_id">
				<br><span class="idresult" id="idresult" name="idresult" value=""></span></td>
			</tr>
			<tr>
				<td class="ftd">비밀번호</td>
				<td><input type="password" size="30" maxlength="50" name="admin_pw" id="admin_pw"></td>
			</tr>
			<tr>
				<td class="ftd">비밀번호 확인</td>
				<td><input type="password" size="30" maxlength="50" name="admin_pwc" id="admin_pwc">
				<br><span class="notice1" id="notice1"></span></td>
			</tr>
			<tr>
				<td class="ftd">이름</td>
				<td><input type="text" size="30" maxlength="30" name="admin_name" id="admin_name"></td>
			</tr>
			<tr>
				<td class="ftd">사업자 번호</td>
				<td><input type="text" size="3" maxlength="3" name="l1" id="l1"> - <input type="text" size="2" maxlength="2" name="l2" id="l2"> - <input type="text" size="5" maxlength="5" name="l3" id="l3"></td>
			</tr>
			<tr>
				<td class="ftd">핸드폰 번호</td>
				<td><input type="text" size="20" maxlength="11" name="admin_phone" id="admin_phone"  placeholder="'-'를 뺀 번호만 입력"></td>
			</tr>
			<tr>
				<td class="ftd">회사명</td>
				<td><input type="text" size="30" maxlength="" name="cname" id="cname"></td>
			</tr>
		</table>
		<br><br><br>
		<div class="okCancel">
			<span class="joinAdmin_join" name="admin_join" id="admin_join" style="cursor: pointer">회원가입</span>
			<a href="http://localhost:9000/hallforyou/user/hfu_index.do"><span class="joinAdmin_cancel" id="">취소</span></a>
		</div>
		</form>
	</div>
	<!-- ########## joinAdmin end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>