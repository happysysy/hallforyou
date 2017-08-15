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
  			/* ȸ������ �� ��ȿ�� üũ(validation check) */
  			$("#admin_join").click(function(){
  				
  				if($("#admin_id").val() == ""){
  					alert("���̵� �Է��Ͻʽÿ�");
  					$("#admin_id").focus();
  					return false;
  				}else if($("#idresult").text() == "�̹� ��� ���Դϴ�."){
  					alert("�̹� �����ϴ� ���̵��Դϴ�.");
  					$("#admin_id").focus();
  					return false;  
  				}else if($("#admin_pw").val() == ""){
  					alert("��й�ȣ�� �Է��Ͻʽÿ�");
  					$("#admin_pw").focus();
  					return false;
  				}else if($("#admin_pwc").val() == ""){
  					alert("��й�ȣ Ȯ���� �Է��Ͻʽÿ�");
  					$("#admin_pwc").focus();
  					return false;
  				}else if($("#admin_name").val() == ""){
  					alert("�̸��� �Է��Ͻʽÿ�");
  					$("#admin_name").focus();
  					return false;
  				}else if($("#l1").val() == ""){
  					alert("����� ��ȣ�� �Է��Ͻʽÿ�");
  					$("#l1").focus();
  					return false;
  				}else if($("#l2").val() == ""){
  					alert("����� ��ȣ�� �Է��Ͻʽÿ�");
  					$("#l2").focus();
  					return false;
  				}else if($("#l3").val() == ""){
  					alert("����� ��ȣ�� �Է��Ͻʽÿ�");
  					$("#l3").focus();
  					return false;
  				}else if($("#admin_phone").val() == ""){
  					alert("��ȭ��ȣ�� �Է��Ͻʽÿ�");
  					$("#admin_phone").focus();
  					return false;
  				}else if($("#cname").val() == ""){
  					alert("ȸ����� �Է��Ͻʽÿ�.");
  					$("#cname").focus();
  					return false;
  				}
  				adminForm.submit();
  			});
  			
  			/* ���̵� �ߺ� Ȯ�� */
  			$("#admin_id").focusout(function() {
				if($("#admin_id").val() == ""){
					$("#idresult").text("���̵� �Է��Ͻʽÿ�.");
  					return false;
				}else{
					var admin_id = $("#admin_id").val();
					$.ajax({
						url : 'http://localhost:9000/hallforyou/idCheck',
	  					type : 'POST',
						data : 'member_id=' + admin_id,
						success : function(data) {
							if(data == "N") {
								$("#idresult").text("�̹� ��� ���Դϴ�.").css("color","red")
								.css("font-size","9pt");
							} else {
								$("#idresult").text("����� �����մϴ�.").css("color","blue")
								.css("font-size","9pt");
							}
						}
					});
				}
			});
			
  			/* ��й�ȣ Ȯ�� üũ */
  			$("#admin_pwc").blur(function(){
  				
  				if($("#admin_pwc").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#admin_pw").val() == $("#admin_pwc").val()){
  						$("#notice1").text("��й�ȣ�� �����մϴ�.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("��й�ȣ�� �������� �ʽ��ϴ�.").css("color","red")
						.css("font-size","9pt");
  					}
  				}
  				
  			});
  			
			$("#admin_pw").blur(function(){
  				
  				if($("#admin_pw").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#admin_pw").val() == $("#admin_pwc").val()){
  						$("#notice1").text("��й�ȣ�� �����մϴ�.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("��й�ȣ�� �������� �ʽ��ϴ�.").css("color","red")
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
		<h3 class="bottom_bar">ȸ������</h3>
		<form name="adminForm" id="joinForm" action="admin_join" method="post">
		<table class="adminjoin">
			<tr>
				<td class="ftd">���̵�</td>
				<td><input type="text" size="30" maxlength="50" name="admin_id" id="admin_id">
				<br><span class="idresult" id="idresult" name="idresult" value=""></span></td>
			</tr>
			<tr>
				<td class="ftd">��й�ȣ</td>
				<td><input type="password" size="30" maxlength="50" name="admin_pw" id="admin_pw"></td>
			</tr>
			<tr>
				<td class="ftd">��й�ȣ Ȯ��</td>
				<td><input type="password" size="30" maxlength="50" name="admin_pwc" id="admin_pwc">
				<br><span class="notice1" id="notice1"></span></td>
			</tr>
			<tr>
				<td class="ftd">�̸�</td>
				<td><input type="text" size="30" maxlength="30" name="admin_name" id="admin_name"></td>
			</tr>
			<tr>
				<td class="ftd">����� ��ȣ</td>
				<td><input type="text" size="3" maxlength="3" name="l1" id="l1"> - <input type="text" size="2" maxlength="2" name="l2" id="l2"> - <input type="text" size="5" maxlength="5" name="l3" id="l3"></td>
			</tr>
			<tr>
				<td class="ftd">�ڵ��� ��ȣ</td>
				<td><input type="text" size="20" maxlength="11" name="admin_phone" id="admin_phone"  placeholder="'-'�� �� ��ȣ�� �Է�"></td>
			</tr>
			<tr>
				<td class="ftd">ȸ���</td>
				<td><input type="text" size="30" maxlength="" name="cname" id="cname"></td>
			</tr>
		</table>
		<br><br><br>
		<div class="okCancel">
			<span class="joinAdmin_join" name="admin_join" id="admin_join" style="cursor: pointer">ȸ������</span>
			<a href="http://localhost:9000/hallforyou/user/hfu_index.do"><span class="joinAdmin_cancel" id="">���</span></a>
		</div>
		</form>
	</div>
	<!-- ########## joinAdmin end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>