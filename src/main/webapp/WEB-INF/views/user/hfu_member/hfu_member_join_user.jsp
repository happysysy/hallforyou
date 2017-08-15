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
  			/* 회원가입 폼 유효성 체크(validation check) */
  			$("#member_join").click(function(){
  				
  				if($("#member_id").val() == ""){
  					alert("아이디를 입력하십시오");
  					$("#member_id").focus();
  					return false;
  				}else if($("#idresult").text() == "이미 사용 중입니다."){
  					alert("이미 존재하는 아이디입니다.");
  					$("#member_id").focus();
  					return false;  
  				}else if($("#member_pw").val() == ""){
  					alert("비밀번호를 입력하십시오");
  					$("#member_pw").focus();
  					return false;
  				}else if($("#member_pwc").val() == ""){
  					alert("비밀번호 확인을 입력하십시오");
  					$("#member_pwc").focus();
  					return false;
  				}else if($("#member_name").val() == ""){
  					alert("이름을 입력하십시오");
  					$("#member_name").focus();
  					return false;
  				}else if($("#email").val() == ""){
  					alert("이메일을 입력하십시오");
  					$("#email").focus();
  					return false;
  				}else if($("#emailc").val() == ""){
  					alert("인증번호를 입력하십시오");
  					$("#emailc").focus();
  					return false;
  				}else if($("#member_phone").val() == ""){
  					alert("전화번호를 입력하십시오");
  					$("#member_phone").focus();
  					return false;
  				}else if($("#gender").is(":checked") == false){
  					alert("성별을 선택하십시오");
  					$("#gender").focus();
  					return false;
  				}

  				memberForm.submit();
  			});
  			
  			/* 아이디 중복 확인 */
  			$("#member_id").focusout(function() {
				if($("#member_id").val() == ""){
					$("#idresult").text("아이디를 입력하십시오.");
  					return false;
				}else{
					var member_id = $("#member_id").val();
					$.ajax({
						url : 'http://localhost:9000/hallforyou/idCheck',
	  					type : 'POST',
						data : 'member_id=' + member_id,
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
			
  			/* 비밀번호 확인 체크 */
  			$("#member_pwc").blur(function(){
  				
  				if($("#member_pwc").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#member_pw").val() == $("#member_pwc").val()){
  						$("#notice1").text("비밀번호가 동일합니다.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("비밀번호가 동일하지 않습니다.").css("color","red")
						.css("font-size","9pt");
  					}
  				}
  				
  			});
  			
			$("#member_pw").blur(function(){
  				
  				if($("#member_pw").val() == ""){
  					$("#notice1").text("");
  					
  				}else{
  					
  					if($("#member_pw").val() == $("#member_pwc").val()){
  						$("#notice1").text("비밀번호가 동일합니다.").css("color","blue")
						.css("font-size","9pt");  						
  					}else{
  						$("#notice1").text("비밀번호가 동일하지 않습니다.").css("color","red")
						.css("font-size","9pt");
  					}
  				}
  				
  			});
			//지역
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
	  					type : 'POST',/*한글깨짐 방지*/
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
		<h3 class="bottom_bar">회원가입</h3>
		<form name="memberForm" id="joinForm" action="member_join" method="post">
			<table class="userjoin">
				<tr>
				  <td class="ftd">아이디</td>
				  <td><input type="text" size="20" maxlength="50" name="member_id" id="member_id">
				  <br><span class="idresult" id="idresult" name="idresult" value=""></span></td>
				</tr>
				<tr>
				  <td class="ftd">비밀번호</td>
				  <td><input type="password" size="20" maxlength="50" name="member_pw" id="member_pw"></td>
				</tr>
				<tr>
				  <td class="ftd">비밀번호 확인</td>
				  <td><input type="password" size="20" maxlength="50" name="member_pwc" id="member_pwc">
				  <br><span class="notice1" id="notice1"></span></td>
				</tr>
				<tr>
				  <td class="ftd">이름</td>
				  <td><input type="text" size="20" maxlength="30" name="member_name" id="member_name"></td>
				</tr>
	 			<tr>
				  <td class="ftd">E-Mail 인증</td>
				  <td><input type="text" size="20" maxlength="60" name="email" id="email">　<button type="button" name="email_check" id="email_check">전송</button></td>
				</tr>
				<tr>
				  <td class="ftd">인증번호</td>
				  <td><input type="text" size="10" maxlength="6" name="emailc" id="emailc"></td>
				</tr>
				<tr>
				  <td class="ftd">핸드폰 번호</td>
				  <td><input type="text" size="20" maxlength="11" name="member_phone" id="member_phone"  placeholder="'-'를 뺀 번호만 입력"></td>
				</tr>
				<tr>
				  <td class="ftd">성별</td>
				  <td><input type="radio" name="gender" id="gender1" value="남"> 남성 　　　　<input type="radio" name="gender" id="gender" value="여"> 여성 </td>
				</tr>
			</table>
			<br><br><br>
			
			<h4 style="text-align:center">추가 정보</h4><hr/>
			<table class="userselect">
				<tr>
					<td class="ftd">행사지역</td>
					<td>
						<select name="city" id="city">
						<option name="city" id="city" value="null">시/도</option>
						</select>
					    <select name="gu" id="gu">
						<option name="gu" id="gu" value="null">군/구</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">희망식대</td>
					<td>
						<select name="mprice_min" id="mprice_min" style="width:100px"> 
							<option selected name="mprice_min" id="mprice_min" value="0">선택</option> 
							<option name="mprice_min" id="mprice_min" value="10000">1만원</option> 
							<option name="mprice_min" id="mprice_min" value="30000">3만원</option> 
							<option name="mprice_min" id="mprice_min" value="50000">5만원</option> 
							<option name="mprice_min" id="mprice_min" value="70000">7만원</option>
						</select>
						~
						<select name="mprice_max" id="mprice_max" style="width:100px"> 
							<option selected name="mprice_max" id="mprice_max" value="0">선택</option> 
							<option name="mprice_max" id="mprice_max" value="30000">3만원</option> 
							<option name="mprice_max" id="mprice_max" value="50000">5만원</option> 
							<option name="mprice_max" id="mprice_max" value="70000">7만원</option> 
							<option name="mprice_max" id="mprice_max" value="100000">10만원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">식사메뉴</td>
					<td>
						<select name="menu" id="menu"> 
							<option selected name="menu" id="menu" value="0">선택</option> 
							<option name="menu" id="menu" value="뷔페">뷔페</option> 
							<option name="menu" id="menu" value="양ㅇ식">양식</option> 
							<option name="menu" id="menu" value="한식">한식</option> 
							<option name="menu" id="menu" value="중식">중식</option> 
							<option name="menu" id="menu" value="일식">일식</option> 
							<option name="menu" id="menu" value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">홀 타입</td>
					<td>
						<select name="htype" id="htype"> 
							<option selected name="htype" id="htype" value="0">선택</option>
							<option name="htype" id="htype" value="일반홀">일반홀</option> 
							<option name="htype" id="htype" value="컨벤션">컨벤션</option> 
							<option name="htype" id="htype" value="호텔">호텔</option> 
							<option name="htype" id="htype" value="하우스">하우스</option> 
							<option name="htype" id="htype" value="전통">전통</option>
							<option name="htype" id="htype" value="야외">야외</option> 
							<option name="htype" id="htype" value="종교">종교</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="ftd">하객 수</td>
					<td>
						<select name="guest" id="guest"> 
							<option selected name="guest" id="guest" value="0">선택</option> 
							<option name="guest" id="guest" value="100">100명</option> 
							<option name="guest" id="guest" value="200">200명</option> 
							<option name="guest" id="guest" value="300">300명</option> 
							<option name="guest" id="guest" value="400">400명</option> 
							<option name="guest" id="guest" value="500">500명</option>
							<option name="guest" id="guest" value="600">600명</option> 
						</select>
					</td>
				</tr>	
			</table>
			<br><br><br>
			<div class="okCancel">
				<span class="joinAdmin_join" name="member_join" id="member_join" style="cursor: pointer">회원가입</span>
				<a href="http://localhost:9000/hallforyou/user/hfu_index.do"><span class="joinAdmin_cancel" name="" id="">취소</span></a>
			</div>
		</form>
	</div>
	<!-- ########## joinUser end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>