<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@page import = "com.spring.vo.EstimateVO, java.util.ArrayList" %>
<%
	ArrayList<EstimateVO> elist = (ArrayList<EstimateVO>)request.getAttribute("elist");
	String typeno = (String)request.getAttribute("typeno");

		EstimateVO halltype=(EstimateVO)request.getAttribute("halltype");
		ArrayList<EstimateVO> slist= (ArrayList<EstimateVO>)request.getAttribute("slist");
		ArrayList<EstimateVO> mlist= (ArrayList<EstimateVO>)request.getAttribute("mlist");
		ArrayList<EstimateVO> dlist= (ArrayList<EstimateVO>)request.getAttribute("dlist");

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
form table td{
	border-bottom: 1px solid #BDBDBD;
	padding:5px;
	max-width: 360px;
}
form table tr th{
	background-color: #CE8A8A;
	color: white;
	padding:4px;
}
form input{
	padding: 4px;
	width:156px;
}
form input[name=mealcontent]{
	width: 98%;
}
form select{
	padding:5px;
	height: 30px;
}
form span.button{
	background-color: gray;
	min-width: 45px;
}
form a{
	text-decoration: none;
}
form span.hallbtn{
	color: #CE8A8A;
	border: 2px solid #CE8A8A;
	font-weight: bold;
	padding:10px;
	border-radius: 3px;
}

form div.formBtn{
	text-align: center;
	padding: 40px;
}
form div.formInput{
	width: 860px;
	border: 1px solid #ce8a8a;
	border-radius: 10px;
	padding: 50px;
	margin: auto;
}
span.button{
	padding: 10px;
	background-color: #bdbfc1;
	color: white;
	border-radius: 3px;
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
span.deleteBtnSelection{
	background-color:#888;
	color:white;
	padding:4px;
	border-radius:1px;
	cursor:pointer;
}
span.deleteBtnMeal{
	background-color:#888;
	color:white;
	padding:4px;
	border-radius:1px;
	cursor:pointer;
}
span.deleteBtnDrink{
	background-color:#888;
	color:white;
	padding:4px;
	border-radius:1px;
	cursor:pointer;
}
td.btntd{
	width: 10%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$(".trcontent").mouseenter(function(){
			$(this).css("background-color", "#FAE0D4");
		});
		$(".trcontent").mouseleave(function(){
			$(this).css("background-color", "white");
		});
		$("#formSubmit").click(function(){
			updateForm.submit();
		});
		var typeno=$("#gettypeno").val();
		$("#"+typeno).css("background-color","#CE8A8A");
		$("#"+typeno).css("color","white");
		
		$(".insertBtn").click(function(){
			var insertwhat=$(this).attr("id");
			if(insertwhat=="insertBtnSelection"){
				$("#insertwhat").val("insertBtnSelection");
			}
			if(insertwhat=="insertBtnMeal"){
				$("#insertwhat").val("insertBtnMeal");
			}
			if(insertwhat=="insertBtnDrink"){
				$("#insertwhat").val("insertBtnDrink");
			}
			
			
			var params = $("#updateForm").serialize();
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/updateTypeinfoInsert.do',
				type : 'POST',/*�ѱ۱��� ����*/
				data : params,
				dataType : "json",   					
				success : function(data) {  
					if(data.length != 0){
						if(insertwhat==("insertBtnSelection")){
							var str="<tr><td>"+data.sname+"</td>"+
							"<td>"+data.sprice+"</td>"+
							"<td>"+data.sref+"</td>"+
							"<td>"+data.scontent+"</td></tr>";
							$(".useprice").append(str);
						}
						if(insertwhat==("insertBtnMeal")){
							var str="<tr><td>"+data.mealtype+"</td>"+
							"<td>"+data.mealprice+"</td>"+
							"<td>"+data.mealcontent+"</td></tr>";
							$(".mealprice").append(str);
						}
						if(insertwhat==("insertBtnDrink")){
							var str="<tr><td>"+data.drink+"</td>"+
							"<td>"+data.drinkprice+"</td></tr>";
							$(".drinkprice").append(str);
						}
						
						
					}//end of if						
				}
			});//end of ajax  
		});


		
		
		$(".deleteBtnSelection").click(function(){
			var sno=$(this).attr("id");
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/deleteSelection.do?sno='+sno
			});//end of ajax 
			$("."+sno).remove();
		});
		$(".deleteBtnMeal").click(function(){
			var mno=$(this).attr("id");
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/deleteMeal.do?mno='+mno
			});//end of ajax 
			$("."+mno).remove();
		});
		$(".deleteBtnDrink").click(function(){
			var params = $("#updateForm").serialize();
			var dno=$(this).attr("id");
			$.ajax({
				url : 'http://localhost:9000/hallforyou/admin/deleteDrink.do?dno='+dno,
				type : 'POST',/*�ѱ۱��� ����*/
				data : params,
				success : function() {  
					//alert("����");
				},error: function (){
				}//end of success					
			});//end of ajax 
			$("."+dno).remove();
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
	
		<h3 class="ishall">ȦŸ����������</h3>
		<hr>
		
		
		<form name="updateForm" id ="updateForm" action="htypeUpdate.do" method="post">
			<input type="hidden" id="gettypeno" name="typeno" value="<%=typeno%>">
		
			<div class="formBtn">
			<%for(EstimateVO e: elist){ %>
				<a href="http://localhost:9000/hallforyou/admin/estimate_update.do?typeno=<%=e.getTypeno()%>" class="hallbtna" ><span class="hallbtn" id="<%=e.getTypeno()%>"><%=e.getTypename() %></span></a>
			<%} %>
				
			&nbsp;&nbsp;&nbsp;
			<c:if test="${ not empty elist }">
			<a href ="http://localhost:9000/hallforyou/admin/htypeDelete.do?typeno=<%=typeno%>"><span class="button">����Ÿ�Ի���</span></a>
			</c:if>
			<a href ="http://localhost:9000/hallforyou/admin/estimate_insert.do"><span class="button">+Ÿ���߰�</span></a>
			</div>
			<c:if test="${ not empty typeno }">
			<div class="formInput">
				<h4>Ȧ����</h4>
				<table>
					<tr>
						<th>Ȧ��</th>
						<th>��������</th>
						<th>�����ο�</th>
						<th>���İ���</th>
					</tr>
					
					<tr>
						<td><input type="text" name="typename" value="<%=halltype.getTypename()%>"></td>
						<td><input type="text" name="wtype" value="<%=halltype.getWtype()%>"></td>
						<td><input type="text" name="wguest" value="<%=halltype.getWguest()%>"></td>
						<td><input type="text" name="tinterval" value="<%=halltype.getTinterval()%>"></td>						
					</tr>
				</table>
			
				<hr>	
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
								<option>�ʼ�</option>
								<option>����</option>
							</select>
						</td>
						
						<td><input type="text" name="scontent" style="width: 350px;"></td>
						<td class="btntd"><span class="insertBtn" id ="insertBtnSelection">�߰�</span></td>
					</tr>
					<%for(EstimateVO s:slist){ %>
					<tr class="<%=s.getSno()%>">
						<td><%=s.getSname() %></td>
						<td><%=s.getSprice() %></td>
						<td><%=s.getSref() %></td>
						<td><%=s.getScontent() %></td>
						<td class="btntd"><span class="deleteBtnSelection" id="<%=s.getSno()%>">����</span></td>
					</tr>
					<%} %>
					
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
					<td class="btntd"><span class="insertBtn" id="insertBtnMeal">�߰�</span></td>
				</tr>
				<%for(EstimateVO m:mlist){ %>
					<tr class="<%=m.getMno()%>">
						<td><%=m.getMealtype() %></td>
						<td><%=m.getMealprice() %></td>
						<td><%=m.getMealcontent() %></td>
						<td class="btntd"><span class="deleteBtnMeal" id="<%=m.getMno()%>">����</span></td>
					</tr>
				<%} %>
			</table>
			<h4>���ַ�</h4>
			<table class="drinkprice">
				<tr>
					<th>����</th>
					<th>�ܰ�</th>
				</tr>
				<tr>
					<td><input type="text" name="drink"></td>
					<td><input type="text" name="drinkprice" value="0"></td>
					<td class="btntd"><span class="insertBtn" id="insertBtnDrink">�߰�</span></td>
				</tr>
				<tr>
				</tr>
				<%for(EstimateVO d:dlist){ %>
				<tr class="<%=d.getDno()%>">
					<td><%=d.getDrink() %></td>
					<td><%=d.getDrinkprice() %></td>
					<td class="btntd"><span class="deleteBtnDrink" id="<%=d.getDno() %>">����</span></td>
				</tr>
				<%} %>
				
			</table>
		</div>
		
		<div class="submitBtn">
			<span class="button" id="formSubmit" style="padding: 15px 100px 15px 100px;">�� �� �� ��</span>
		</div>
		<input type="hidden" name="insertwhat" id ="insertwhat">
		</c:if>
		
	</form>
	
</div>
<c:import url="http://localhost:9000/hallforyou/ha_footer.do"></c:import>

</body>
</html>