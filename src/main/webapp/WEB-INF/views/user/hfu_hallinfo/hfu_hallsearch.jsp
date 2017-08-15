<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*" %>
<%@ page import="com.spring.vo.SearchVO" %>
<%@ page session = "true" %>      
<%	String member_id = (String)session.getAttribute("member_id");%>
<%
	ArrayList<SearchVO> SearchList = (ArrayList<SearchVO>)request.getAttribute("SearchList");
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hall for you > hall search</title>
	<link href="http://localhost:9000/hallforyou/css/common.css" rel="stylesheet"/> <!-- font -->
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/headerfooter.css">
	<link rel="stylesheet" href="http://localhost:9000/hallforyou/css/user/hallforyou.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	 	.contents{padding-top:20px;padding-bottom:10px;background:white;width:1200px;margin:auto;margin-top:20px;margin-bottom:20px;}
 		h3{display:inline-block;width:100px;text-align:center;}
 		label{display:inline-block;width:80px;font-size:13pt;text-align:center;}
 		
 		/* �˻� �ɼ� */ 
 		section.search{display:block;width:1100px; height:250px;margin:auto;border:2px dotted gray;}		
		.search_list li {display:block;width:1000px;list-style-type:none;font-size:11pt;margin:10px;}
		form.search_list{display:block;width:1100px;margin:auto;padding:20px 5px 15px 5px;}
		.selectpicker{display:inline-block;width:100px;height:25px;}
		#minprice, #maxprice, #wguest{width:80px;padding:3px 5px;}
		.checkbox{display:inline-block;}
		span.search, span.cancel {
		display:inline-block;width:80px;
		background:gray;padding:5px 8px;color:white;
		font-weight:bold;border-radius:4px;
		text-align:center;}
		span:hover{color:black;text-decoration:none;}
		.button {display:block;width:1150px;text-align:right;margin-top:20px;}  
		
		/* Ȧ ����Ʈ */ 
		.list{display:block;width:1200px;margin:auto;padding-top:40px;}
		.info_searchlist{display:block;width:97%;height:250px;border-bottom:2px dotted gray;padding-top:10px;padding-bottom:30px;
		}
		.info_searchlist:hover{background-color:#ffe4e1;}
		.hall_img{float:left;margin:15px 20px 15px 10px;}
		.hall_img:hover{opacity:0.4;border:2px solid #E8CEC2;}
		.name_info{font-size:14pt;font-weight:bold;}
		li p{margin-top:5px;display:block;}
 	</style>
 	<script>
 	$.ajax({
		url : 'http://localhost:9000/hallforyou/area.do',			
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
 		$("#halltype_all").click(function(){
				if($("#halltype_all").is(":checked")){
					$("input[name='checkhlist']").prop("checked", true);				
				}else{
					$("input[name='checkhlist']").prop("checked", false);
				}
			});
 		$("#menu_all").click(function(){
			if($("#menu_all").is(":checked")){
				$("input[name='checkmlist']").prop("checked", true);				
			}else{
				$("input[name='checkmlist']").prop("checked", false);
			}
		});
 
 		$("#search").click(function(){
 			if($("#city").val()=='�õ�'){
 				alert("������ �������ּ���");
 				return false;
 			}else if($("#minprice").val()==""){
				alert("�ּҰ����� �Է����ּ���");
				return false;
			}else if($("#maxprice").val()==""){
				alert("�ִ밡���� �Է����ּ���");
				return false;
			}else if($("#wguest").val()==""){
				alert("�����ο��� �Է����ּ���");
				return false;
			}else if($("input[name='checkhlist']").is(":checked")==false){
				alert("ȦŸ���� �������ּ���");
				return false;
			}else if($("input[name='checkmlist']").is(":checked")==false){
				alert("�޴��� �������ּ���");
				return false;
			}
			
 			var params = $("#SearchForm").serialize();

			$.ajax({
				url : 'http://localhost:9000/hallforyou/user/hfu_search_check.do',
				type : 'POST',/*�ѱ۱��� ����*/
				data : params,
				dataType : "json",   					
				success : function(data) {  
					if(data.length != 0){
						$("#hinfo").empty();
						for(var i=0; i<data.length;i++){
							str = "<li class='info_searchlist'>" 
								+ "<a href='http://localhost:9000/hallforyou/user/hfu_halldetail.do?hno="+data[i].hno+"'>"
								+ "<img class='hall_img' src='http://172.16.13.3:9000/hallforyou/upload/"+data[i].pthumbnail+"' width='240' height='200' >"
								+ "</a>"
								+ "<p class='local_info'>"+data[i].city+" > "+data[i].gu+" </p>"
								+ "<p class='name_info'> " + data[i].hname + "</p>"
								+ "<p class='type_info'>ȦŸ�� |"+data[i].hlist+"</p>"
								+ "<p class='menu_info'>�޴� |"+data[i].mlist+"</p>"
								+ "<p>"+data[i].hcomment+"</p>"
							    + "</li>"						
							
							$("#hinfo").append(str);	
						}//end of for
						
					}else
						alert("�˻� ����� �����ϴ�. �ٽ� �˻����ּ���");//end of if						
				},error: function (data){
					alert("�˻� ����. �˻� ���¿� �°� �ٽ� �˻����ּ���");
				}//end of success					
			});//end of ajax  	
 	
 		});
 		
 		$("#cancel").click(function(){
 				$("#city").val(1);
 				$("#gu").val(1);
 				$("#minprice").val("");
 				$("#maxprice").val("");
 				$("#wguest").val("");
				$("input[name='checkhlist']").prop("checked",false);
				$("input[name='checkmlist']").prop("checked",false);
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
  					url : 'http://localhost:9000/hallforyou/area.do',
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
 		
 	})
 	</script>
</head>
<body>
	<!-- header -->
	 <c:choose>
 		<c:when test="${empty sessionScope.member_id}">
 			<c:import url="http://localhost:9000/hallforyou/user/hfu_header.do" />
 		</c:when>
 		<c:when test="${not empty sessionScope.member_id}">
 			<c:import url="http://localhost:9000/hallforyou/user/hfu_sheader.do" />
 		</c:when>
 	</c:choose>                                                        
	<!-- <content> -->
	<div class="contents">
		<!-- �˻� �ɼ� -->
		<section class ="search">
				<form class="search_list" id ="SearchForm" name="SearchForm" action="hfu_search_check.do" method="post">
				<ul>
				<li>
					<label>�� ��</label>&nbsp;&nbsp;&nbsp;
					<select class="selectpicker" name="city" id="city">
					<option value="�õ�">�� / ��</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <select class="selectpicker" name="gu" id="gu">
					<option >�� / ��</option>
					</select>			
				</li>
				<li>
					<label>�� ��</label>&nbsp;&nbsp;&nbsp;
					<input type="text" id="minprice" name="minprice"> ����~
					<input type="text" id="maxprice" name="maxprice"> ����
				</li>
				<li>
					<label>�����ο�</label>&nbsp;&nbsp;&nbsp;
					<input type="text" id="wguest" name="wguest"> ��
				</li>
				<li>
					<label>ȦŸ��</label>&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype_all">��ü&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="�Ϲ�Ȧ">�Ϲ�Ȧ&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="������">������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="ȣ��">ȣ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="�߿�">�߿�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="����">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="����">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="halltype" name="checkhlist" value="�Ͽ콺">�Ͽ콺
				</li>
				<li>
					<label>�� ��</label>&nbsp;&nbsp;&nbsp;
					
					<input type="checkbox" id="menu_all" >��ü&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="menu" name="checkmlist" value="�ѽ�">�ѽ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="menu" name="checkmlist" value="�߽�">�߽�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="menu" name="checkmlist" value="�Ͻ�">�Ͻ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="menu" name="checkmlist" value="���">���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="menu"name="checkmlist" value="����">����
				</li>
			</ul>
			</form>
		</section>
		<div class="button">
						<span class="search" id="search">��  ��</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="cancel" id="cancel">�ʱ�ȭ</span>
		</div>
		<!-- Ȧ ����Ʈ -->	     
		<section class="list">
			<div class="in_list">
			<h3>Ȧ ����</h3>				
				<ul id="hinfo">	
				<%for(SearchVO vo: SearchList){ %>								
					<li class="info_searchlist">
						<a href="http://localhost:9000/hallforyou/user/hfu_halldetail.do?hno=<%=vo.getHno() %>">
						<img class="hall_img" src="http://172.16.13.3:9000/hallforyou/upload/<%=vo.getPthumbnail() %>" width="240" height="200" >
						</a>
						<p class="local_info"><%=vo.getCity() %> > <%=vo.getGu() %></p>
						<p class="name_info"><%=vo.getHname() %></p>
						<p class="type_info">ȦŸ�� | <%=vo.getHlist() %></p>
						<p class="menu_info">�޴� | <%=vo.getMlist() %></p>
						<p><%=vo.getHcomment() %></p>
					</li>				
				<%} %>
				</ul>
			</div>
		</section>
	</div>
	<!-- footer -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
</body>
</html>