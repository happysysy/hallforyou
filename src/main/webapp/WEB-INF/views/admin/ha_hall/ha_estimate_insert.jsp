<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import = "java.util.Random" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	int rannum=new Random().nextInt(100000);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/hallforyou/css/admin/ha_sy_body.css">
<style>
hr{
	border: 2px dotted #D9D9D9;
	margin-bottom: 25px;
}
h3.ishall{
	text-align: center;
}
form{
}
form table{
}
form table tr th{
	background-color: #CE8A8A;
	color: white;
	padding:4px;
}
form table tr td{
	padding: 2px;
	max-width: 360px;
}
form input{
	padding: 5px;
}

form select{
	padding:5px;
	height: 30px;
}

form a{
	text-decoration: none;
}
form h3{
	padding-bottom: 3px;
	border-bottom: 1px solid #D9D9D9;
}

form span#hall1{
	background-color:#CE8A8A;
	color: white;
}
form div.formBtn{
	text-align: center;
	padding: 40px;
}
form div.hallInput{
	width: 860px;
	border-radius: 10px;
	padding-bottom: 30px;
	margin: auto;
}
form div.formInput{
	width: 860px;
	border: 1px solid #ce8a8a;
	border-radius: 10px;
	padding: 50px;
	margin: auto;
}
form span.button{
	padding: 10px;
	background-color: #888;
	color: white;
	border-radius: 3px;
	cursor:pointer;
}
form div.submitBtn{
	padding:30px;
	text-align: center;
	margin-bottom: 30px;
}
span.insertBtn{
	background-color:#888;
	color:white;
	padding:4px;
	border-radius:1px;
	cursor:pointer;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#formSubmit").click(function(){
			insertForm.submit();
		});
		$(".insertBtn").mouseenter(function(){
			$(this).css("background-color", "#aaaaaa");
		});
		$(".insertBtn").mouseleave(function(){
			$(this).css("background-color", "#888");
		});

		
		$("#insertSelection").click(function(){
			
			var params = $("#insertForm").serialize();
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/insertSelection.do',
				type : 'POST',/*�ѱ۱��� ����*/
				data : params,
				dataType : "json",   					
				success : function(data) {  
					if(data.length != 0){
						$(".selectlist").remove();
						for(var i = 0; i<data.length;i++){
							var str="<tr class='selectlist'><td>"+data[i].sname+"</td>"+
								"<td>"+data[i].sprice+"</td>"+
								"<td>"+data[i].sref+"</td>"+
								"<td>"+data[i].scontent+"</td></tr>";
							$(".useprice").append(str);
						}					
					}//end of if						
				},error: function (data){
					alert(data);
				}//end of success					
			});//end of ajax  	
			
		});
		$("#insertMeal").click(function(){
			var params = $("#insertForm").serialize();
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/insertMeal.do',
				type : 'POST',/*�ѱ۱��� ����*/
				data : params,
				dataType : "json",   					
				success : function(data) {  
					if(data.length != 0){
						$(".meallist").remove();
						for(var i = 0; i<data.length;i++){
							var str="<tr class='meallist'><td>"+data[i].mealtype+"</td>"+
								"<td>"+data[i].mealprice+"</td>"+
								"<td>"+data[i].mealcontent+"</td></tr>";

							$(".mealprice").append(str);
						}					
					}//end of if						
				},error: function (data){
					alert(data);
				}//end of success					
			});//end of ajax  	
		});
		$("#insertDrink").click(function(){
			var params=$("#insertForm").serialize();
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/insertDrink.do',
				type : 'POST',
				data : params,
				dataType : "json",
				success : function(data){
					if(data.length != 0){
						$(".drinklist").remove();
						for(var i = 0; i<data.length;i++){
							var str="<tr class='drinklist'><td>"+data[i].drink+"</td>"+
								"<td>"+data[i].drinkprice+"</td></tr>";

							$(".drinkprice").append(str);
						}					
					}
				},error : function(data){
					alert("����");
				}
			});
		});

	});
	
</script>
</head>

<body class="hall">
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
		<h3 class="ishall">ȦŸ�������Է�</h3>
		<hr>
		<form name="insertForm" action="htypeInsert.do" id="insertForm" method="post">
			
			
			
			<div class="hallInput">
			<h3>Ȧ����</h3>
			<table>
					<tr>
						<th>Ȧ��</th>
						<th>��������</th>
						<th>�����ο�</th>
						<th>���İ���</th>
					</tr>
					
					<tr>
						<td><input type="text" name="typename"></td>
						<td>
							<select name="wtype">
								<option>����</option>
								<option>�и�</option>
							</select>
						</td>
						<td><input type="text" name="wguest" value="0"><span>��</span></td>
						<td><input type="text" name="tinterval"></td>						
					</tr>
					
			</table>
			</div>
			<div class="formInput">
				<h3>�ΰ�����</h3>
				
								
				<h4>����</h4>
				<table class="useprice">
					<tr>
						<th>��ǰ��</th>
						<th>����</th>
						<th>���</th>
						<th>����</th>
					</tr>
					<tr>
						<td><input type="text" name="sname"></td>
						<td><input type="text" name="sprice" value="0"></td>
						<td>
							<select name="sref">
								<option value="�ʼ�">�ʼ�</option>
								<option value="����">����</option>
							</select>
						</td>
						<td><input type="text" name="scontent"></td>
						<td><span class="insertBtn" id="insertSelection">�߰�</span></td>
					</tr>
					<tr class="selectlist">
						
						<!-- �������ε�� �ҷ��� selection list -->
					</tr>
					
			</table>
			<h4>�Ļ缱��</h4>
			<table class="mealprice">
				<tr>
					<th>�ɼ�����</th>
					<th>�ܰ�</th>
					<th>����</th>
				</tr>
				<tr>
					<td><input type="text" name="mealtype"></td>
					<td><input type="text" name="mealprice" value="0"></td>
					<td><input type="text" name="mealcontent"></td>
					<td><span class="insertBtn" id="insertMeal">�߰�</span></td>
				</tr>
				<tr class="meallist">
					<!-- �������ε�� �ҷ��� meallist -->
				</tr>
			</table>
			<h4>���ַ�</h4>
			<table class="drinkprice">
				<tr>
					<th>����</th>
					<th>�ܰ�</th>
				</tr>
				<tr>
				
					<td><input type="text" name="drink"></td>
					<td><input type="text" name="drinkprice" placeholder="���ڷ� �Է��ϼ���" value="0"></td>
					<td><span class="insertBtn" id="insertDrink">�߰�</span></td>
				</tr>
				<tr class="drinklist">
					<!-- �������ε�� �ҷ��� drinklist -->
				</tr>
			</table>
			<input type="hidden" name="rannum" value="<%=rannum%>">
		</div>
		<div class="submitBtn">
			<span class="button" id="formSubmit">Ȯ��</span>
			<a href ="http://localhost:9000/hallforyou/admin/estimate_update.do"><span class="button">���</span></a>
		</div>
	
	</form>
</div>
<c:import url="http://localhost:9000/hallforyou/ha_footer.do"></c:import>

</body>
</html>