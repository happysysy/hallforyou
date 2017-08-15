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
  			/* �̸��� ���� */
			$("#email_check").click(function(){
  				
  				if($("#email").val() == ""){
  					alert("�̸����� �Է��Ͻʽÿ�");
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
	  							alert(data + "�� ������ȣ�� ���۵Ǿ����ϴ�.");
	  							$("#email").attr("readonly","true");
	  						}else
	  							alert("���� ����.");
	  					}
	  				});
				}
  			});
  			
			$("#pwinquiry1").click(function(){
				if($("#member_name").val() == ""){
  					alert("�̸��� �Է��Ͻʽÿ�");
  					$("#member_name").focus();
  					return false;
				}else if($("#member_id").val() == ""){
  					alert("���̵� �Է��Ͻʽÿ�");
  					$("#email").focus();
  					return false;
  				}else if($("#email").val() == ""){
  					alert("�̸����� �Է��Ͻʽÿ�");
  					$("#email").focus();
  					return false;
  				}else if($("#emailc").val() == ""){
  					alert("������ȣ�� �Է��Ͻʽÿ�");
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
		<h3 class="bottom_bar">��й�ȣ ã��</h3>
		<h4 class="help">
			<p>������ ���̵�/�н����带 ã�����ؼ��� �̸��� ������ ��ġ�ž� �մϴ�.</p>
			<p>�Ʒ��� ���� ����� ������ �ּ���.</p>
			<p>���� �Ϸ��, E-mail�� ���� �н����带 �˷��帳�ϴ�.</p>
		</h4>
		<form name="pwinquiry" id="pwinquiry" action="pwinquiry1" method="post">
			<table class="help">
				<tr>
					<td class="ftd">�̸�</td>
					<td><input type="text" size="30" maxlength="30" name="member_name" id="member_name"></td>
				</tr>
				<tr>
					<td class="ftd">���̵�</td>
					<td><input type="text" size="30" maxlength="50" name="member_id" id="member_id"></td>
				</tr>
	 			<tr>
				  	<td class="ftd">E-Mail ����</td>
				  	<td><input type="text" size="20" maxlength="60" name="email" id="email">��<button type="button" name="email_check" id="email_check">����</button></td>
				</tr>
				<tr>
			   		<td class="ftd">������ȣ</td>
			  		<td><input type="text" size="10" maxlength="6" name="emailc" id="emailc"></td>
				</tr>
			</table>
			<br><br><br><br>
			<div class="okCancel">
				<span style="cursor:pointer" class="joinAdmin_cancel" id="pwinquiry1" name="pwinquiry1">Ȯ��</span></a>
				<a href="http://localhost:9000/hallforyou/user/hfu_help.do"><span class="joinAdmin_cancel" id="">���</span></a>
			</div>
		</form>
	</div>
	<!-- ########## member_help_pwinquiry end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>