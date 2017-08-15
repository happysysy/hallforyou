<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page session = "true" %>   
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.EventVO" %>
<%	
	String member_id = (String)session.getAttribute("member_id");
	ArrayList<EventVO> list = (ArrayList<EventVO>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Hall for you</title>
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body>
	<!-- ########## header start ########## -->
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
	<% } %>
	<!-- ########## header end ########## -->
	
	<!-- ########## event start ########## -->
	<div class="content">
		<h3 class="bottom_bar">이벤트</h3>
		<table>
			<%for(EventVO vo : list){ %>
			<tr id="event" name="event"> 
				<td><a href="<%=vo.getUrl()%>">
				<img src="http://172.16.13.3:9000/hallforyou/upload/<%=vo.getPimage() %>"></a>
  				</td>
			
			</tr>
			<% } %>
		</table>
	</div>
	<!-- ########## event end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>