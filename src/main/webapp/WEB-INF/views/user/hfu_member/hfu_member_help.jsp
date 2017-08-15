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
	
	<!-- ########## help start ########## -->
	<div class="content">
		<h3 class="bottom_bar">아이디/패스워드 찾기</h3>
		<div class="help">
			<table class="help" style="width:1200px">
				<tr>
					<td><br><br><h4>아이디를 잊으셨나요?</h4><br></td>
					<td style="border-left:2px solid gray"><br><br><h4>비밀번호를 잊으셨나요?</h4><br></td>
				</tr>
				<tr>
					<td><a href="http://localhost:9000/hallforyou/user/hfu_help_idinquiry.do" target="_top"><span class="help_idpw" id="">아이디<p>찾기</p></span></a><br><br><br><br><br><br></td>
					<td style="border-left:2px solid gray"><a href="http://localhost:9000/hallforyou/user/hfu_help_pwinquiry.do" target="_top"><span class="help_idpw" id="">비밀번호 찾기</span></a><br><br><br><br><br><br></td>
				</tr>
			</table>			
		</div>
	</div>
	<!-- ########## help end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>