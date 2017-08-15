<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ page session = "true" %>
<%@ page import="com.spring.vo.*" %>
<%@ page import="java.util.*" %>
<%	String member_id = (String)session.getAttribute("member_id");
	ArrayList<HallVO> besthall = (ArrayList<HallVO>)request.getAttribute("besthall");
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Hall for you</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>



<body>
	<!-- ########## header start ########## -->
	
	<% if(member_id == null){ %>			
		<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
	<% }else{ %>	 	
		<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do?member_id=${sessionScope.member_id}" />
	<% } %>
	<!-- ########## header end ########## -->
                                                              
	<!-- ########## content start ########## -->
	<div class="content" style="width:100%">
		<div class="content_newhall">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  		<ol class="carousel-indicators">
		    		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox" style="text-align:center">

					<div class="item active">
						<img src="../img/maincarousel1.jpg" width="100%">
					    <div class="carousel-caption">
						</div>
					</div>
					
					<div class="item">
						<img src="../img/maincarousel2.jpg" width="100%">
						<div class="carousel-caption">
				      	</div>
					</div>
					
					<div class="item">
						<img src="../img/maincarousel3.jpg"  width="100%">
						<div class="carousel-caption">
				      	</div>
					</div>
				</div>

			</div>
		</div>
		</div>
		
		<div class="content_besthall">
			<h3 style="text-align:center">Best Hall</h3><hr/>
			<div class='row'>
			<div class='col-md-12'>
			<div class="carousel slide media-carousel" id="media">
			<div class="carousel-inner">
			<% int i = 0; %>
			<% for(HallVO mvo : besthall) { %>
			<% i++;%>
			<% if(i == 1) { %>	
			<div class="item active" style="text-align:center">
			<div class="row">
			<% }else if (i==4){ %>
			<div class="item">
			<div class="row">
			<% } %>
			<div class="col-md-4">
				<a class="thumbnail" href="http://localhost:9000/hallforyou/user/hfu_halldetail.do?hno=<%=mvo.getHno() %>">
					<img style="width:600px; height:300px;" alt="" src="http://172.16.13.3:9000/hallforyou/upload/<%=mvo.getPthumbnail() %>"><div class="carousel-caption"><h5><%=mvo.getHname() %></h5></div></a>
			</div>
			<% if(i == 3 || i == 6) { %>
			</div>
			</div>
			<% } %>
			<% if(i == 6) break; %>
			<% } %>
			</div>
			<a class="left carousel-control" href="#media" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#media" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			</div>                          
			</div>
			</div>
		</div>
	</div>
	</div>
	<!-- ########## content end ########## -->
	
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>