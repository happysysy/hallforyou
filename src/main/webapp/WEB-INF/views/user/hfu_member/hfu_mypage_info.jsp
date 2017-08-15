<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page session = "true" %>
<%	String member_id = (String)session.getAttribute("member_id");
	String member_name = (String)session.getAttribute("member_name");
	String email = (String)session.getAttribute("email");
	String member_phone = (String)session.getAttribute("member_phone");
	String gender = (String)session.getAttribute("gender");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > mypage</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/member.css">
	<script src="http://localhost:9000/hallforyou/js/jquery-3.1.1.min.js"></script>
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
			
			$("#update").click(function(){
  				if($("#member_pw").val() == ""){
  					alert("��й�ȣ�� �Է��Ͻʽÿ�");
  					$("#member_pw").focus();
  					return false;
  				}else if($("#member_pwc").val() == ""){
  					alert("��й�ȣ Ȯ���� �Է��Ͻʽÿ�");
  					$("#member_pwc").focus();
  					return false;
  				}else if($("#member_pw").val() != $("#member_pwc").val()){
  					alert("��й�ȣ�� �������� �ʽ��ϴ�.");
  					$("#member_pwc").focus();
  				}
  				updateForm.submit();
  			});
  			
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
	<style>
		.contents{padding-top:20px;padding-bottom:40px;background:white;width:1200px;margin:auto;margin-top:20px;}
		.hfu_mypage_info{display:block;width:1200px;margin:auto;}
		h3{display:inline-block;width:140px;text-align:center;}
 		span.hfu_mypage_qnabtn{
			display:inline-block;padding:5px 8px;color:#C3C3C3;margin:10px 20px;
			text-align:center;border-radius:4px;border:1px solid gray;}
		span.hfu_mypage_dropbtn{
			display:inline-block;padding:5px 8px;color:#C3C3C3;margin:10px 20px;
			text-align:center;border-radius:4px;border:1px solid gray;}
		span.hfu_mypage_bookbtn {
			display:inline-block;padding:5px 8px;color:#C3C3C3;margin:10px 20px;
			text-align:center;border-radius:4px;border:1px solid gray;}
		span.hfu_mypage_qnabtn:hover, span.hfu_mypage_dropbtn:hover,span.hfu_mypage_bookbtn:hover{border:2px solid gray;background-color:#FFDFDC;color:gray;}
	  	span.hfu_mypage_infobtn {
			display:inline-block;padding: 5px 8px;color:black;margin:0px;margin:10px 20px;
			text-align:center;border-radius:4px;border:2px solid black;}
		span.hfu_mypage_infobtn:hover {text-decoration:none;}
		img.hfu_mp_img{width:60px;height:40px;}
		
		/* �������� â*/
		form.hfu_mp_updateForm{width:90%;margin:auto;border:2px dotted gray;padding:20px;margin-top:20px;}
		span.hfu_mp_title{
		display:block;width:90%;font-size:15pt;margin:auto;text-align:center;
		font-weight:bold;border-bottom:2px double gray;}
		ul.hfu_mp_update{display:block;width:90%;border:1px solid gray;margin:auto;margin-top:20px;padding:30px 50px;margin-bottom:50px;}		
		ul.hfu_mp_update li{display:block;width:70%;list-style-type:none;margin:auto;padding:10px;}
		span.updateinfo{display:inline-block;width:120px;font-size:12pt;font-weight:bold;margin:10px 20px;padding:5px 8px;}
		input.updateinput{margin:auto;padding:5px 8px;}
		button.hfu_mp_submitbtn{display:inline-block;margin:8px;}
		select{padding:8px 12px;display:inline-block;width:120px;}
		div.updatebtn{display:block; margin:auto;text-align:center;}
		.hfu_mp_updatebtn, .hfu_mp_cancelbtn {
		display:inline-block;width:80px;background:gray;padding:5px 8px;color:white;font-weight:bold;
		border-radius:4px;text-align:center;
		margin:0px 20px;}
	</style>
</head>
<body>
	<!-- <header> -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>
	<!-- <content> -->
	<div class="contents">
	<div class="hfu_mypage_info">
		<h3>����������</h3>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_qna.do?mamber_id=${member_id}">
		<span class="hfu_mypage_qnabtn"><img src="http://localhost:9000/hallforyou/img/chat.png" class="hfu_mp_img">��������</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_book.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">����Ȯ��</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_wishlist.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">�� ���</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_info.do">
		<span class="hfu_mypage_infobtn"><img src="http://localhost:9000/hallforyou/img/user.png" class="hfu_mp_img">ȸ������</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_drop.do">
		<span class="hfu_mypage_dropbtn"><img src="http://localhost:9000/hallforyou/img/settings.png" class="hfu_mp_img">ȸ��Ż��</span>
		</a>
			<span class="hfu_mp_title">���� ����</span>
			<form name="updateForm" id="updateForm" action="update" method="post" class="hfu_mp_updateForm">
			<ul class="hfu_mp_update">
				<li>
				  <span class="updateinfo">���̵�</span>
				  <input type="text" size="20" id="member_id" name="member_id" value="<%= member_id %>" class="updateinput" readonly>
				</li>
				<li>
				  <span class="updateinfo">�̸�</span>
				  <input type="text" size="20" id="member_name" name="member_name" value="<%= member_name %>" class="updateinput" readonly>
				</li>
				<li>
				  <span class="updateinfo">��й�ȣ</span>
				  <input type="password" size="20" maxlength="50" class="updateinput" id="member_pw" name="member_pw" >
				</li>
				<li>
				  <span class="updateinfo">��й�ȣ Ȯ��</span>
				  <input type="password" size="20" maxlength="50" class="updateinput" id="member_pwc" name="member_pwc" >
				  <span class="notice1" id="notice1"></span>
				</li>	
				<li>
				  <span class="updateinfo">E-Mail</span>
				  <input type="text" size="20" maxlength="60" class="updateinput" value="<%= email %>" id="email" name="email" readonly>
				</li>
				<li>
				  <span class="updateinfo">�ڵ��� ��ȣ</span>
				  <input type="text" size="20" maxlength="11" class="updateinput" value="<%= member_phone %>" id="member_phone" name="member_phone" readonly>
				</li>
				<li>
				  <span class="updateinfo">����</span>
				  <% if(gender == "��") { %>
				  <input type="radio" name="gender" value="male" class="updateinput" checked> ���� ��������
				  <input type="radio" name="gender" value="female" class="updateinput" disabled> ����
				  <% }else{ %>
				  <input type="radio" name="gender" value="male" class="updateinput" disabled> ���� ��������
				  <input type="radio" name="gender" value="female" class="updateinput" checked> ����
				  <% } %>
				</li>
			</ul>
			<br>
		
			<span class="hfu_mp_title">�߰� ���� ����</span>
			<ul class="hfu_mp_update">
				<li>
					<span class="updateinfo">�������</span>
					<select name="city" id="city">
						<option name="city" id="city" value="null">��/��</option>
					</select>
				    <select name="gu" id="gu">
						<option name="gu" id="gu" value="null">��/��</option>
					</select>
				</li>
				<li>
					<span class="updateinfo">����Ĵ�</span>
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
				</li>
				<li>
					<span class="updateinfo">�Ļ�޴�</span>
					<select name="menu" id="menu"> 
						<option selected name="menu" id="menu" value="0">����</option> 
						<option name="menu" id="menu" value="����">����</option> 
						<option name="menu" id="menu" value="�礷��">���</option> 
						<option name="menu" id="menu" value="�ѽ�">�ѽ�</option> 
						<option name="menu" id="menu" value="�߽�">�߽�</option> 
						<option name="menu" id="menu" value="�Ͻ�">�Ͻ�</option> 
						<option name="menu" id="menu" value="��Ÿ">��Ÿ</option>
					</select>
				</li>
				<li>
					<span class="updateinfo">Ȧ Ÿ��</span>
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
				</li>
				<li>
					<span class="updateinfo">�ϰ�</span>
					<select name="guest" id="guest"> 
						<option selected name="guest" id="guest" value="0">����</option> 
						<option name="guest" id="guest" value="100">100��</option> 
						<option name="guest" id="guest" value="200">200��</option> 
						<option name="guest" id="guest" value="300">300��</option> 
						<option name="guest" id="guest" value="400">400��</option> 
						<option name="guest" id="guest" value="500">500��</option>
						<option name="guest" id="guest" value="600">600��</option> 
					</select>
				</li>	
			</ul>
			<div class="updatebtn">
			<span class="hfu_mp_updatebtn" name="update" id="update">����</span></a>
			<a href="http://localhost:9000/hallforyou/user/hfu_mypage_qna.do"><span class="hfu_mp_cancelbtn" id="hfu_mp_cancelbtn">���</span></a>
		</div>
		</form>
		
	</div>
		
	</div>
	<!-- <footer> -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>