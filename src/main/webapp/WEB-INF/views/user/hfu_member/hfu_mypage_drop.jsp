<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page session = "true" %>
<%	String member_id = (String)session.getAttribute("member_id");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>hall for you > mypage</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script>
 	$(document).ready(function(){			
			$("#hfu_mp_checkbtn").click(function(){
				
				if($("#member_pw").val() == ""){
					alert("비밀번호를 입력하세요");
					$("#member_pw").focus();
					return false;
				}
				DropForm.submit();
			});
			
		});
 	</script>
	<style>
 		.contents{padding-top:20px;padding-bottom:40px;background:white;width:1200px;margin:auto;margin-top:20px;}
 		.hfu_mypage_info{display:block;width:1200px;margin:auto;}
 		h3{display:inline-block;width:140px;text-align:center;}
 		span.hfu_mypage_dropbtn {
			display:inline-block;padding:5px 8px;color:black;margin:10px 20px; 
			text-align:center;border-radius:4px;border:2px solid black;}
		span.hfu_mypage_dropbtn:hover{text-decoration:none;}
	  	span.hfu_mypage_qnabtn,span.hfu_mypage_bookbtn, span.hfu_mypage_infobtn {
			display:inline-block;padding: 5px 8px;color:#C3C3C3;;margin:10px 20px;
			text-align:center;border-radius:4px;border:1px solid gray;}
		span.hfu_mypage_qnabtn:hover, span.hfu_mypage_bookbtn:hover, span.hfu_mypage_infobtn:hover {background-color:#FFDFDC;border:2px solid gray;color:gray;}
		img.hfu_mp_img{width:60px;height:40px;}
		
		/*탈퇴 확인 창*/
		section.hfu_mypage_main{margin-top:20px;}
		.hfu_mp_infocheck{width:90%;margin:auto;border:2px dotted gray;padding:20px;}
		span.hfu_mp_title{display:block;width:90%;font-size:15pt;margin:auto;text-align:center;font-weight:bold;border-bottom:2px double gray;}
		span.hfu_mp_caution{display:block;border:4px double #FFA7A7;width:90%;margin:auto;text-align:center;margin-top:50px;font-size:10pt;padding:20px;}
		p.hfu_mp_caution_title{display:block;font-size:13pt;font-weight:bold;}
		p.hfu_mp_caution_content{display:block;width:80%;margin:auto;padding:5px 8px;text-align:left;font-size:11pt;}
		.hfu_mp_infocheck_pw{display:block;width:90%;margin:auto;padding:30px 20px 0px 0px;}
		.hfu_mp_infocheck_pw li{list-style-type:none;margin:auto;text-align:center;padding:10px;}
		label{display:inline-block;width:120px;font-size:13pt;font-weight:bold;}
		input{padding:5px 8px;}
		span.hfu_mp_checkbtn, span.hfu_mp_cancelbtn{display:inline-block;width:80px;margin:30px 20px 0px ;text-align:center;padding:5px 8px;border-radius:4px;background:gray;
							 font-size:12pt;color:white;}
 	</style>
</head>
<body>
	<!-- ########## header ########## -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>          
	<!-- ########## content ########## -->
	<div class="contents">
		<div class="hfu_mypage_info">
		<h3>마이페이지</h3>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_qna.do?mamber_id=${member_id}">
		<span class="hfu_mypage_qnabtn"><img src="http://localhost:9000/hallforyou/img/chat.png" class="hfu_mp_img">질문내역</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_book.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">예약확인</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_wishlist.do">
		<span class="hfu_mypage_bookbtn"><img src="http://localhost:9000/hallforyou/img/checked.png" class="hfu_mp_img">찜 목록</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_info.do">
		<span class="hfu_mypage_infobtn"><img src="http://localhost:9000/hallforyou/img/user.png" class="hfu_mp_img">회원정보</span>
		</a>
		<a href="http://localhost:9000/hallforyou/user/hfu_mypage_drop.do">
		<span class="hfu_mypage_dropbtn"><img src="http://localhost:9000/hallforyou/img/settings.png" class="hfu_mp_img">회원탈퇴</span>
		</a>
		<section class="hfu_mypage_main">
		<div class="hfu_mp_infocheck">
			<span class="hfu_mp_title">회원탈퇴</span>
			<span class="hfu_mp_caution">
			<p class="hfu_mp_caution_title">회원 탈퇴 신청에앞서 아래의 사항을 반드시 확인하시기 바랍니다.</p>
			<hr>
			<p class="hfu_mp_caution_content">1. 사용하고 계신 아이디는 탈퇴할 경우본인 및 타인모두 재사용 및 복구가 불가능합니다.</p> 
            <p class="hfu_mp_caution_content">2. 홀포유에 저장되었던 고객님의 모든 정보는 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
			</span>
				<form id="DropForm" name="DropForm" action="drop" method="post">
					<ul class="hfu_mp_infocheck_pw">
						<li>
							<label>아이디</label>
							<input type="text" name="member_id" id="member_id" value="<%= member_id %>" size="30" readonly>
						</li>
						<li>
							<label>비밀번호</label>
							<input type="password" name="member_pw" id="member_pw" size="30" maxlength="50">
						</li>
						<li>
							<span class="hfu_mp_checkbtn" id="hfu_mp_checkbtn" name="hfu_mp_checkbtn">확인</span>
							<a href="http://localhost:9000/hallforyou/user/hfu_mypage_infocheck.do">
							<span class="hfu_mp_cancelbtn" id="hfu_mp_cancelbtn">취소</span>
							</a>
						</li>
					</ul>
				</form>
		</div>
		</section>
	</div>
	</div>
	<!-- ########## footer ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>