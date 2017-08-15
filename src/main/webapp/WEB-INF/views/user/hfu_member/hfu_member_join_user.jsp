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
	 	$.ajax({
  			url : 'http://localhost:9000/hallforyou/joinarea',			
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
  		$(document).ready(function(){
  			/* ȸ������ �� ��ȿ�� üũ(validation check) */
  			$("#member_join").click(function(){
  				
  				if($("#member_id").val() == ""){
  					alert("���̵� �Է��Ͻʽÿ�");
  					$("#member_id").focus();
  					return false;
  				}else if($("#idresult").text() == "�̹� ��� ���Դϴ�."){
  					alert("�̹� �����ϴ� ���̵��Դϴ�.");
  					$("#member_id").focus();
  					return false;  
  				}else if($("#member_pw").val() == ""){
  					alert("��й�ȣ�� �Է��Ͻʽÿ�");
  					$("#member_pw").focus();
  					return false;
  				}else if($("#member_pwc").val() == ""){
  					alert("��й�ȣ Ȯ���� �Է��Ͻʽÿ�");
  					$("#member_pwc").focus();
  					return false;
  				}else if($("#member_name").val() == ""){
  					alert("�̸��� �Է��Ͻʽÿ�");
  					$("#member_name").focus();
  					return false;
  				}else if($("#email").val() == ""){
  					alert("�̸����� �Է��Ͻʽÿ�");
  					$("#email").focus();
  					return false;
  				}else if($("#emailc").val() == ""){
  					alert("������ȣ�� �Է��Ͻʽÿ�");
  					$("#emailc").focus();
  					return false;
  				}else if($("#member_phone").val() == ""){
  					alert("��ȭ��ȣ�� �Է��Ͻʽÿ�");
  					$("#member_phone").focus();
  					return false;
  				}else if($("#gender").is(":checked") == false){
  					alert("������ �����Ͻʽÿ�");
  					$("#gender").focus();
  					return false;
  				}

  				memberForm.submit();
  			});
  			
  			/* ���̵� �ߺ� Ȯ�� */
  			$("#member_id").focusout(function() {
				if($("#member_id").val() == ""){
					$("#idresult").text("���̵� �Է��Ͻʽÿ�.");
  					return false;
				}else{
					var member_id = $("#member_id").val();
					$.ajax({
						url : 'http://localhost:9000/hallforyou/idCheck',
	  					type : 'POST',
						data : 'member_id=' + member_id,
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
			
  			/* ��й�ȣ Ȯ�� üũ */
  			$("#member_pwc").blur(function(){
  				
  				if($("#member_pwc").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#member_pw").val() == $("#member_pwc").val()){
  						$("#notice1").text("��й�ȣ�� �����մϴ�.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("��й�ȣ�� �������� �ʽ��ϴ�.").css("color","red")
						.css("font-size","9pt");
  					}
  				}
  				
  			});
  			
			$("#member_pw").blur(function(){
  				
  				if($("#member_pw").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#member_pw").val() == $("#member_pwc").val()){
  						$("#notice1").text("��й�ȣ�� �����մϴ�.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("��й�ȣ�� �������� �ʽ��ϴ�.").css("color","red")
						.css("font-size","9pt");
  					}
  				}
  				
  			});
			//����
			$("#city").change(function(){
				var id = $(this).attr("id");
					option = "";
					if(id=="city"){
						option = $("#city option:selected").val();
					}if(id=="gu"){
						option = $("#gu option:selected").val();
					}
					
	  				$.ajax({
	  					url : 'http://localhost:9000/hallforyou/joinarea',
	  					type : 'POST',/*�ѱ۱��� ����*/
	  					data : 'id='+id+'&option='+option, /*'name = '+value*/
	  					dataType : "json",   					
	  					success : function(data) {  	
	  						$("#gu option").remove();
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

	<!-- ########## joinUser start ########## -->
	<div class="content">
		<h3 class="bottom_bar">ȸ������</h3>
		<form name="memberForm" id="joinForm" action="member_join" method="post">
			<table class="userjoin">
				<tr>
				  <td class="ftd">���̵�</td>
				  <td><input type="text" size="20" maxlength="50" name="member_id" id="member_id">
				  <br><span class="idresult" id="idresult" name="idresult" value=""></span></td>
				</tr>
				<tr>
				  <td class="ftd">��й�ȣ</td>
				  <td><input type="password" size="20" maxlength="50" name="member_pw" id="member_pw"></td>
				</tr>
				<tr>
				  <td class="ftd">��й�ȣ Ȯ��</td>
				  <td><input type="password" size="20" maxlength="50" name="member_pwc" id="member_pwc">
				  <br><span class="notice1" id="notice1"></span></td>
				</tr>
				<tr>
				  <td class="ftd">�̸�</td>
				  <td><input type="text" size="20" maxlength="30" name="member_name" id="member_name"></td>
				</tr>
	 			<tr>
				  <td class="ftd">E-Mail ����</td>
				  <td><input type="text" size="20" maxlength="60" name="email" id="email">��<button type="button" name="email_check" id="email_check">����</button></td>
				</tr>
				<tr>
				  <td class="ftd">������ȣ</td>
				  <td><input type="text" size="10" maxlength="6" name="emailc" id="emailc"></td>
				</tr>
				<tr>
				  <td class="ftd">�ڵ��� ��ȣ</td>
				  <td><input type="text" size="20" maxlength="11" name="member_phone" id="member_phone"  placeholder="'-'�� �� ��ȣ�� �Է�"></td>
				</tr>
				<tr>
				  <td class="ftd">����</td>
				  <td><input type="radio" name="gender" id="gender1" value="��"> ���� ��������<input type="radio" name="gender" id="gender" value="��"> ���� </td>
				</tr>
			</table>
			<br><br><br>
			
			<h4 style="text-align:center">�߰� ����</h4><hr/>
			<table class="userselect">
				<tr>
					<td class="ftd">�������</td>
					<td>
						<select name="city" id="city">
						<option name="city" id="city" value="null">��/��</option>
						</select>
					    <select name="gu" id="gu">
						<option name="gu" id="gu" value="null">��/��</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">����Ĵ�</td>
					<td>
						<select name="mprice_min" id="mprice_min" style="width:100px"> 
							<option selected name="mprice_min" id="mprice_min" value="0">����</option> 
							<option name="mprice_min" id="mprice_min" value="10000">1����</option> 
							<option name="mprice_min" id="mprice_min" value="30000">3����</option> 
							<option name="mprice_min" id="mprice_min" value="50000">5����</option> 
							<option name="mprice_min" id="mprice_min" value="70000">7����</option>
						</select>
						~
						<select name="mprice_max" id="mprice_max" style="width:100px"> 
							<option selected name="mprice_max" id="mprice_max" value="0">����</option> 
							<option name="mprice_max" id="mprice_max" value="30000">3����</option> 
							<option name="mprice_max" id="mprice_max" value="50000">5����</option> 
							<option name="mprice_max" id="mprice_max" value="70000">7����</option> 
							<option name="mprice_max" id="mprice_max" value="100000">10����</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">�Ļ�޴�</td>
					<td>
						<select name="menu" id="menu"> 
							<option selected name="menu" id="menu" value="0">����</option> 
							<option name="menu" id="menu" value="����">����</option> 
							<option name="menu" id="menu" value="�礷��">���</option> 
							<option name="menu" id="menu" value="�ѽ�">�ѽ�</option> 
							<option name="menu" id="menu" value="�߽�">�߽�</option> 
							<option name="menu" id="menu" value="�Ͻ�">�Ͻ�</option> 
							<option name="menu" id="menu" value="��Ÿ">��Ÿ</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">Ȧ Ÿ��</td>
					<td>
						<select name="htype" id="htype"> 
							<option selected name="htype" id="htype" value="0">����</option>
							<option name="htype" id="htype" value="�Ϲ�Ȧ">�Ϲ�Ȧ</option> 
							<option name="htype" id="htype" value="������">������</option> 
							<option name="htype" id="htype" value="ȣ��">ȣ��</option> 
							<option name="htype" id="htype" value="�Ͽ콺">�Ͽ콺</option> 
							<option name="htype" id="htype" value="����">����</option>
							<option name="htype" id="htype" value="�߿�">�߿�</option> 
							<option name="htype" id="htype" value="����">����</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">�ϰ� ��</td>
					<td>
						<select name="guest" id="guest"> 
							<option selected name="guest" id="guest" value="0">����</option> 
							<option name="guest" id="guest" value="100">100��</option> 
							<option name="guest" id="guest" value="200">200��</option> 
							<option name="guest" id="guest" value="300">300��</option> 
							<option name="guest" id="guest" value="400">400��</option> 
							<option name="guest" id="guest" value="500">500��</option>
							<option name="guest" id="guest" value="600">600��</option> 
						</select>
					</td>
				</tr>	
			</table>
			<br><br><br>
			<div class="okCancel">
				<span class="joinAdmin_join" name="member_join" id="member_join" style="cursor: pointer">ȸ������</span>
				<a href="http://localhost:9000/hallforyou/user/hfu_index.do"><span class="joinAdmin_cancel" name="" id="">���</span></a>
			</div>
		</form>
	</div>
	<!-- ########## joinUser end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>