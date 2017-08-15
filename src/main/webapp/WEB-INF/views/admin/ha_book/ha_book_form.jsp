<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HALL FOR YOU > 신규 등록</title>
<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body {
		background:#E1E1E1;
	}
	div.content{
		width:1200px;
		margin:auto;
		background:white;  
	}
  	div.content div.book{
  		padding:20px;
  		padding-bottom:40px;
  	}
	div.book_check {
		width:1000px;
		margin:auto;
	}
	h1.booktitle {			
		border-bottom:1px solid gray;
	}
	h4 {
		display:block;
		width:150px;
		text-align:center;
		background:gray;
		color:black;	  
		font-weight:bold;		
	  	border-radius:4px;
	  	border:2px double white;			
		padding:5px;
	}
	ul { list-style-type:none;}
	span { display:inline-block; }
	span.btn {
	  	display:inline-block;
	  	width:15%; 		
	  	background:#1C1C1C;
	  	padding:5px 8px;
	  	color:white;
	  	font-weight:bold;	  		
	  	border-radius:4px;
	  	border:2px double white;
	  	text-align:center;
	  	float:right; 
	  	margin-bottom:10px;	
	}
	span.tmenu {
		border:1px solid black;
		width:150px;
		text-align:center;
		font-weight:bold;
	}
	span.tcon {
		width:600px;
		margin-left:20px;
		font-size:18px;
	}
	span.month {
		display:inline-block;
		margin-right:10px;
	}
	span.date {
		display:inline-block;
		margin-right:10px;
	}
	span.scon {
		margin-left:20px;
	}
	input.scon {
		margin-left:20px;
	}
</style>
</head>
<body>
	
	<!-- header -->
	<c:choose>
		<c:when test="${sessionScope.member_id eq 'mainadmin'}">
			<c:import url="http://localhost:9000/hallforyou/ha_header.do"></c:import>
		</c:when>
		<c:otherwise>
			<c:import url="http://localhost:9000/hallforyou/ha_hmheader.do?admin_id=${sessionScope.member_id}"></c:import>
		</c:otherwise>
	</c:choose>
	
	<div class="content">
		<div class="book">
		<h1 class="booktitle">BOOK</h1>
		
		<hr>
		<div class="book_check">
		<h4 class="checkform">예약서</h4><hr>
			<ul>
				<li>
					<span class="tmenu">예식장</span>
					<input class="scon" type="text"></input>	
				</li>
				<br>
				<li>
					<span class="tmenu">이름</span>
					<input class="scon" type="text"></input>	
				</li>
				<br>
				<li>
					<span class="tmenu">날짜</span>
					
					<span class="scon">
						<span class="month">MONTH
						<select name="month">
							<option value="jan">1</option>
							<option value="feb">2</option>
							<option value="mar">3</option>
							<option value="apr">4</option>
							<option value="may">5</option>
							<option value="jun">6</option>
							<option value="jul">7</option>
							<option value="aug">8</option>
							<option value="sep">9</option>
							<option value="oct">10</option>
							<option value="nov">11</option>
							<option value="dec">12</option>
						</select>
						</span>
						
						<span class="date">DATE
						<select name="date">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="10">11</option>
							<option value="10">12</option>
							<option value="10">13</option>
							<option value="10">14</option>
							<option value="10">15</option>
							<option value="10">16</option>
							<option value="10">17</option>
							<option value="10">18</option>
							<option value="10">19</option>
							<option value="10">20</option>
							<option value="10">21</option>
							<option value="10">22</option>
							<option value="10">23</option>
							<option value="10">24</option>
							<option value="10">25</option>
							<option value="10">26</option>
							<option value="10">27</option>
							<option value="10">28</option>
							<option value="10">29</option>
							<option value="10">30</option>
						</select>
						</span>
						
						<span class="date">DAY
						<select name="date">
							<option value="mon">월</option>
							<option value="tue">화</option>
							<option value="wed">수</option>
							<option value="thu">목</option>
							<option value="fri">금</option>
							<option value="sat">토</option>
							<option value="sun">일</option>
						</select>
						</span>
					</span>
				</li>
				<br>
				<li>
					<span class="tmenu">시간</span>
					<span class="scon">
						<span class="time">TIME
						<select name="time">
							<option value="11">11:00</option>
							<option value="12">12:00</option>
							<option value="13">13:00</option>
							<option value="14">14:00</option>
						</select>
						</span>
					</span>
				</li>
				<br>
				<li>
					<span class="tmenu">HALL TYPE</span>
					<span class="scon">
						<select name="htype">
							<option value="outdoor">야외</option>
							<option value="A">A</option>
							<option value="B">B</option>
						</select>
					</span>
				</li>
			</ul>
		</div>
		<a href="http://localhost:9000/hallforyou/admin/book_datatable.do">
			<span class="btn">목록으로</span>
		</a>
		<a href="http://localhost:9000/hallforyou/admin/book_datatable.do">
			<span class="btn">등록</span>
		</a>
		</div>
	</div>
</body>
</html>