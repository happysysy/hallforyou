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
		$(document).ready(function(){
			/* �̿��� ��ȿ�� üũ(validation check) */
			$("#member_join").click(function(){
				
				if($("#agree1").is(":checked") == false){
					alert("�̿��� ���Ǹ� ���ּ���.");
					$("#agree1").focus();
					return false;
				}else if($("#agree2").is(":checked") == false){
					alert("�̿��� ���Ǹ� ���ּ���");
					$("#agree2").focus();
					return false;
				}
				
				joinForm.submit();	
			});
			
			$("#admin_join").click(function(){
				
				if($("#agree1").is(":checked") == false){
					alert("�̿��� ���Ǹ� ���ּ���.");
					$("#agree1").focus();
					return false;
				}else if($("#agree2").is(":checked") == false){
					alert("�̿��� ���Ǹ� ���ּ���");
					$("#agree2").focus();
					return false;
				}
				
				joinForm.submit();	
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
	
	<!-- ########## join start ########## -->
	<div class="content">
	    <h3 class="bottom_bar">ȸ������</h3>
		<div class="join">
		
			<h5>�̿���</h5>
			<textarea rows=15 cols=100>
��1��(����)
 �� ����� oooo ȸ��(���ڻ�ŷ� �����)�� ��ϴ� oooo ���̹� ��(���� �������̶� �Ѵ�)���� �����ϴ� ���ͳ� ����
 ����(���� �����񽺡��� �Ѵ�)�� �̿��Կ� �־� ���̹� ���� �̿����� �Ǹ����ǹ� �� å�ӻ����� �������� �������� �մϴ�.
    
 �ء�PC���, ���� ���� �̿��ϴ� ���ڻ�ŷ��� ���ؼ��� �� ������ ������ �ʴ� �� �� ����� �ؿ��մϴ١�

��2��(����)
 �硰���� �̶� oooo ȸ�簡 ��ȭ �Ǵ� �뿪(���� ����ȭ��̶� ��)�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�͵� ������ż���
 �̿��Ͽ� ��ȭ���� �ŷ��� �� �ֵ��� ������ ������ �������� ���ϸ�, �ƿ﷯ ���̹����� ��ϴ� ������� �ǹ̷ε� 
����մϴ�.

 �衰�̿��ڡ��� �������� �����Ͽ� �� ����� ���� �������� �����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�.

 �� ��ȸ�����̶� ���� �������� ���������� �����Ͽ� ȸ������� �� �ڷμ�, �������� ������ ���������� ����������, �������� �����ϴ�
 ���񽺸� ��������� �̿��� �� �ִ� �ڸ� ���մϴ�.

 �� ����ȸ�����̶� ���� ȸ���� �������� �ʰ� �������� �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.

��3�� (������� ���ÿ� ���� �� ����) 
 �� �������� �� ����� ����� ��ȣ �� ��ǥ�� ����, ������ ������ �ּ�(�Һ����� �Ҹ��� ó���� �� �ִ� ���� �ּҸ� ����), ��ȭ��ȣ, ������۹�ȣ, ���ڿ����ּ�, ����ڵ�Ϲ�ȣ, ����Ǹž��Ű���ȣ, ������������å���ڵ��� �̿��ڰ� ���� �� �� �ֵ��� ī��Ȧ�� ���̹����� �ʱ� ����ȭ��(����)�� �Խ��մϴ�. �ٸ�, ����� ������ �̿��ڰ� ����ȭ���� ���Ͽ� �� �� �ֵ��� �� �� �ֽ��ϴ�.

 �� ������ �̿��ڰ� ����� �����ϱ⿡ �ռ� ����� ���Ͽ��� �ִ� ���� �� û��öȸ, ���å��, ȯ������ ��� ���� �߿��� ������ �̿��ڰ� ������ �� �ֵ��� ������ ����ȭ�� �Ǵ� �˾�ȭ�� ���� �����Ͽ� �̿����� Ȯ���� ���Ͽ��� �մϴ�.

 �� �������� ���ڻ�ŷ�����ǼҺ��ں�ȣ�����ѹ���, ����Ǳ��������ѹ���, ���ڰŷ��⺻��, ���ڼ�����, ������Ÿ��̿���������ѹ���, �湮�Ǹŵ���ѹ���, �Һ��ں�ȣ�� �� ���ù��� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�.

 �� �������� ����� ������ ��쿡�� �������� �� ���������� �����Ͽ� �������� �Բ� ���� �ʱ�ȭ�鿡 �� �������� 7���������� �������� ���ϱ��� �����մϴ�.
 �ٸ�, �̿��ڿ��� �Ҹ��ϰ� ��������� �����ϴ� ��쿡�� �ּ��� 30�� �̻��� ���� �����Ⱓ�� �ΰ� �����մϴ�. �� ��� ������ ������ ����� ������ ������ ��Ȯ�ϰ� ���Ͽ� �̿��ڰ� �˱� ������ ǥ���մϴ�. 

 �� �������� ����� ������ ��쿡�� �� ��������� �� �������� ���Ŀ� ü��Ǵ� ��࿡�� ����ǰ� �� ������ �̹� ü��� ��࿡ ���ؼ��� �������� ��������� �״�� ����˴ϴ�. �ٸ� �̹� ����� ü���� �̿��ڰ� ������� ������ ������ �ޱ⸦ ���ϴ� ���� ��3�׿� ���� ��������� �����Ⱓ���� �������� �۽��Ͽ� �������� ���Ǹ� ���� ��쿡�� ������� ������ ����˴ϴ�.

 �� �� ������� ������ �ƴ��� ���װ� �� ����� �ؼ��� ���Ͽ��� ���ڻ�ŷ�����ǼҺ��ں�ȣ�����ѹ���, ����Ǳ�������ѹ���, �����ŷ�����ȸ�� ���ϴ� ���ڻ�ŷ�����ǼҺ��ں�ȣ��ħ �� ������� �Ǵ� ����ʿ� �����ϴ�.

��4��(������ ���� �� ����) 
 �� �������� ������ ���� ������ �����մϴ�.
  1. ��ȭ �Ǵ� �뿪�� ���� ���� ���� �� ���Ű���� ü��
  2. ���Ű���� ü��� ��ȭ �Ǵ� �뿪�� ���
  3. ��Ÿ �������� ���ϴ� ����

 �衰������ ��ȭ �Ǵ� �뿪�� ǰ�� �Ǵ� ����� ����� ���� ���� ��쿡�� ���� ü��Ǵ� ��࿡ ���� ������ ��ȭ �Ǵ� �뿪�� ������ ������ �� �ֽ��ϴ�. �� ��쿡�� ����� ��ȭ �Ǵ� �뿪�� ���� �� �������ڸ� �����Ͽ� ������ ��ȭ �Ǵ� �뿪�� ������ �Խ��� ���� ��� �����մϴ�.

 �顰������ �����ϱ�� �̿��ڿ� ����� ü���� ������ ������ ��ȭ���� ǰ�� �Ǵ� ����� ����� ���� ���� ������ ������ ��쿡�� �� ������ �̿��ڿ��� ���� ������ �ּҷ� ��� �����մϴ�.

 �������� ��� �������� �̷� ���Ͽ� �̿��ڰ� ���� ���ظ� ����մϴ�. �ٸ�, �������� ���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.

��5��(������ �ߴ�) 
 �� �������� ��ǻ�� �� ������ż����� �������ˤ���ü �� ����, ����� ���� ���� ������ �߻��� ��쿡�� ������ ������ �Ͻ������� �ߴ��� �� �ֽ��ϴ�.

 �衰������ ��1���� ������ ������ ������ �Ͻ������� �ߴܵ����� ���Ͽ� �̿��� �Ǵ� ��3�ڰ� ���� ���ؿ� ���Ͽ� ����մϴ�. ��, �������� ���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.

 ���������� ��ȯ, ����� ����, ��ü���� ���� ���� ������ ���񽺸� ������ �� ���� �Ǵ� ��쿡�� �������� ��8���� ���� ������� �̿��ڿ��� �����ϰ� ���� ���������� ������ ���ǿ� ���� �Һ��ڿ��� �����մϴ�. �ٸ�, �������� ������� ���� �������� �ƴ��� ��쿡�� �̿��ڵ��� ���ϸ��� �Ǵ� ������ ���� ���������� ���Ǵ� ��ȭ��ġ�� �����ϴ� ���� �Ǵ� �������� �̿��ڿ��� �����մϴ�.

��6��(ȸ������) 
 �� �̿��ڴ� �������� ���� ���� ��Ŀ� ���� ȸ�������� ������ �� �� ����� �����Ѵٴ� �ǻ�ǥ�ø� �����μ� ȸ�������� ��û�մϴ�.

 �� �������� ��1�װ� ���� ȸ������ ������ ���� ��û�� �̿��� �� ���� ��ȣ�� �ش����� �ʴ� �� ȸ������ ����մϴ�.
  1. ���Խ�û�ڰ� �� ��� ��7����3�׿� ���Ͽ� ������ ȸ���ڰ��� ����� ���� �ִ� ���, �ٸ� ��7����3�׿� ���� ȸ���ڰ� ����� 3���� ����� �ڷμ� �������� ȸ���簡�� �³��� ���� ��쿡�� ���ܷ� �Ѵ�.
  2. ��� ���뿡 ����, ���紩��, ���Ⱑ �ִ� ���  
  3. ��Ÿ ȸ������ ����ϴ� ���� �������� ����� ������ ������ �ִٰ� �ǴܵǴ� ���
  
 �� ȸ�����԰���� �����ñ�� �������� �³��� ȸ������ ������ �������� �մϴ�.

 �� ȸ���� ��15����1�׿� ���� ��ϻ��׿� ������ �ִ� ���, ��� ���ڿ��� ��Ÿ ������� �������� ���Ͽ� �� ��������� �˷��� �մϴ�.

��7��(ȸ�� Ż�� �� �ڰ� ��� ��) 
 �� ȸ���� �������� �������� Ż�� ��û�� �� ������ �������� ��� ȸ��Ż�� ó���մϴ�.

 �� ȸ���� ���� ��ȣ�� ������ �ش��ϴ� ���, �������� ȸ���ڰ��� ���� �� ������ų �� �ֽ��ϴ�.
  1. ���� ��û�ÿ� ���� ������ ����� ���  
  2. �������� �̿��Ͽ� ������ ��ȭ���� ���, ��Ÿ �������̿뿡 �����Ͽ� ȸ���� �δ��ϴ� ä���� ���Ͽ� �������� �ʴ� ���  
  3. �ٸ� ����� ������ �̿��� �����ϰų� �� ������ �����ϴ� �� ���ڻ�ŷ� ������ �����ϴ� ���  
  4. �������� �̿��Ͽ� ���� �Ǵ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ �ϴ� ���
  
 �� �������� ȸ�� �ڰ��� ���Ѥ����� ��Ų��, ������ ������ 2ȸ�̻� �ݺ��ǰų� 30���̳��� �� ������ �������� �ƴ��ϴ� ��� �������� ȸ���ڰ��� ��ǽ�ų �� �ֽ��ϴ�.

 �� �������� ȸ���ڰ��� ��ǽ�Ű�� ��쿡�� ȸ������� �����մϴ�. �� ��� ȸ������ �̸� �����ϰ�, ȸ����� �������� �ּ��� 30�� �̻��� �Ⱓ�� ���Ͽ� �Ҹ��� ��ȸ�� �ο��մϴ�.

��8��(ȸ���� ���� ����)
 �� �������� ȸ���� ���� ������ �ϴ� ���, ȸ���� �������� �̸� �����Ͽ� ������ ���ڿ��� �ּҷ� �� �� �ֽ��ϴ�.

 �� �������� ��Ư���ټ� ȸ���� ���� ������ ��� 1�����̻� ������ �Խ��ǿ� �Խ������μ� ���� ������ ������ �� �ֽ��ϴ�. �ٸ�, ȸ�� ������ �ŷ��� �����Ͽ� �ߴ��� ������ ��ġ�� ���׿� ���Ͽ��� ���������� �մϴ�.

��9��(���Ž�û)
 �������̿��ڴ� �������󿡼� ���� �Ǵ� �̿� ������ ����� ���Ͽ� ���Ÿ� ��û�ϸ�, �������� �̿��ڰ� ���Ž�û�� �Կ� �־ ������ �� ������ �˱� ���� �����Ͽ��� �մϴ�.  ��, ȸ���� ��� ��2ȣ ���� ��4ȣ�� ������ ������ �� �ֽ��ϴ�.
  1. ��ȭ���� �˻� �� ����
  2. ����, �ּ�, ��ȭ��ȣ, ���ڿ����ּ�(�Ǵ� �̵���ȭ��ȣ) ���� �Է�  
  3. �������, û��öȸ���� ���ѵǴ� ����, ��۷����ġ�� ���� ���δ�� ������ ���뿡 ���� Ȯ��
  4. �� ����� �����ϰ� �� 3.ȣ�� ������ Ȯ���ϰų� �ź��ϴ� ǥ��(��, ���콺 Ŭ��)
  5. ��ȭ���� ���Ž�û �� �̿� ���� Ȯ�� �Ǵ� �������� Ȯ�ο� ���� ����
  6. ��������� ����

��10�� (����� ����)
 �� �������� ��9���� ���� ���Ž�û�� ���Ͽ� ���� ��ȣ�� �ش��ϸ� �³����� ���� �� �ֽ��ϴ�. �ٸ�, �̼����ڿ� ����� ü���ϴ� ��쿡�� �����븮���� ���Ǹ� ���� ���ϸ� �̼����� ���� �Ǵ� �����븮���� ����� ����� �� �ִٴ� ������ �����Ͽ��� �մϴ�.
  1. ��û ���뿡 ����, ���紩��, ���Ⱑ �ִ� ���  
  2. �̼����ڰ� ���, �ַ��� û�ҳ⺸ȣ������ �����ϴ� ��ȭ �� �뿪�� �����ϴ� ���  
  3. ��Ÿ ���Ž�û�� �³��ϴ� ���� ������ ����� ������ ������ �ִٰ� �Ǵ��ϴ� ���
  
 �� �������� �³��� ��12����1���� ����Ȯ���������·� �̿��ڿ��� ������ ������ ����� ������ ������ ���ϴ�.

 �� �������� �³��� �ǻ�ǥ�ÿ��� �̿����� ���� ��û�� ���� Ȯ�� �� �ǸŰ��� ����, ���Ž�û�� ���� ��ҵ ���� �������� �����Ͽ��� �մϴ�.

��11��(���޹��)
 ���������� ������ ��ȭ �Ǵ� �뿪�� ���� ������޹���� ���� ��ȣ�� ����� ������ ������� �� �� �ֽ��ϴ�. ��, �������� �̿����� ���޹���� ���Ͽ� ��ȭ ���� ��ݿ� ��� ������ �����ᵵ  �߰��Ͽ� ¡���� �� �����ϴ�.
  1. ����ŷ, ���ͳݹ�ŷ, ���� ��ŷ ���� ���� ������ü 
  2. ����ī��, ����ī��, �ſ�ī�� ���� ���� ī�� ����  
  3. �¶��ι������Ա�
  4. ����ȭ�� ���� ����  
  5. ���ɽ� �������  
  6. ���ϸ��� �� �������� ������ ����Ʈ�� ���� ����  
  7. �������� ����� �ξ��ų� �������� ������ ��ǰ�ǿ� ���� ����  
  8. ��Ÿ ������ ���� ����� ���� ��� ���� ��
  
��12��(����Ȯ������-���Ž�û ���� �� ���)
 �� �������� �̿����� ���Ž�û�� �ִ� ��� �̿��ڿ��� ����Ȯ�������� �մϴ�.

 �� ����Ȯ�������� ���� �̿��ڴ� �ǻ�ǥ���� ����ġ���� �ִ� ��쿡�� ����Ȯ�������� ���� �� ��� ���Ž�û ���� �� ��Ҹ� ��û�� �� �ְ� �������� ������� �̿����� ��û�� �ִ� ��쿡�� ��ü���� �� ��û�� ���� ó���Ͽ��� �մϴ�. �ٸ� �̹� ����� ������ ��쿡�� ��15���� û��öȸ � ���� ������ �����ϴ�.

��13��(��ȭ���� ����)
 �� �������� �̿��ڿ� ��ȭ���� ���޽ñ⿡ ���Ͽ� ������ ������ ���� �̻�, �̿��ڰ� û���� �� ������ 7�� �̳��� ��ȭ ���� ����� �� �ֵ��� �ֹ�����, ���� �� ��Ÿ�� �ʿ��� ��ġ�� ���մϴ�. �ٸ�, �������� �̹� ��ȭ ���� ����� ���� �Ǵ� �Ϻθ� ���� ��쿡�� ����� ���� �Ǵ� �Ϻθ� ���� ������ 2������ �̳��� ��ġ�� ���մϴ�.  �̶� �������� �̿��ڰ� ��ȭ���� ���� ���� �� ���� ������ Ȯ���� �� �ֵ��� ������ ��ġ�� �մϴ�.

 �衰������ �̿��ڰ� ������ ��ȭ�� ���� ��ۼ���, ���ܺ� ��ۺ�� �δ���, ���ܺ� ��۱Ⱓ ���� �����մϴ�. ���� �������� ���� ��۱Ⱓ�� �ʰ��� ��쿡�� �׷� ���� �̿����� ���ظ� ����Ͽ��� �մϴ�. �ٸ� �������� ���Ǥ������� ������ ������ ��쿡�� �׷����� �ƴ��մϴ�.


��14��(ȯ��)
 �������� �̿��ڰ� ���Ž�û�� ��ȭ���� ǰ�� ���� ������ �ε� �Ǵ� ������ �� �� ���� ������ ��ü���� �� ������ �̿��ڿ��� �����ϰ� ������ ��ȭ ���� ����� ���� ��쿡�� ����� ���� ������ 2������ �̳��� ȯ���ϰų� ȯ�޿� �ʿ��� ��ġ�� ���մϴ�.

��15��(û��öȸ ��)
 �硰������ ��ȭ���� ���ſ� ���� ����� ü���� �̿��ڴ� ����Ȯ���� ������ ���� ������ 7�� �̳����� û���� öȸ�� �� �� �ֽ��ϴ�.

 �� �̿��ڴ� ��ȭ���� ��۹��� ��� ���� ��ȣ�� 1�� �ش��ϴ� ��쿡�� ��ǰ �� ��ȯ�� �� �� �����ϴ�.
  1. �̿��ڿ��� å�� �ִ� ������ ��ȭ ���� ��� �Ǵ� �Ѽյ� ���(�ٸ�, ��ȭ ���� ������ Ȯ���ϱ� ���Ͽ� ���� ���� �Ѽ��� ��쿡�� û��öȸ�� �� �� �ֽ��ϴ�)
  2. �̿����� ��� �Ǵ� �Ϻ� �Һ� ���Ͽ� ��ȭ ���� ��ġ�� ������ ������ ���  
  3. �ð��� ����� ���Ͽ� ���ǸŰ� ����� ������ ��ȭ���� ��ġ�� ������ ������ ���  
  4. ���� ������ ���� ��ȭ������ ������ ������ ��� �� ������ ��ȭ ���� ������ �Ѽ��� ���
  
 �� ��2����2ȣ ���� ��4ȣ�� ��쿡 �������� ������ û��öȸ ���� ���ѵǴ� ����� �Һ��ڰ� ���� �� �� �ִ� ���� �����ϰų� �ÿ��ǰ�� �����ϴ� ���� ��ġ�� ���� �ʾҴٸ� �̿����� û��öȸ���� ���ѵ��� �ʽ��ϴ�.

 �� �̿��ڴ� ��1�� �� ��2���� ������ �ұ��ϰ� ��ȭ���� ������ ǥ�á����� ����� �ٸ��ų� ��೻��� �ٸ��� ����� ������ ���� ��ȭ���� ���޹��� ������ 3���̳�, �� ����� �� �� �Ǵ� �� �� �־��� ������ 30�� �̳��� û��öȸ ���� �� �� �ֽ��ϴ�.

��16��(û��öȸ ���� ȿ��)
 �� �������� �̿��ڷκ��� ��ȭ ���� ��ȯ���� ��� 3������ �̳��� �̹� ���޹��� ��ȭ���� ����� ȯ���մϴ�. �� ��� �������� �̿��ڿ��� ��ȭ���� ȯ���� ������ ������ �� �����Ⱓ�� ���Ͽ� �����ŷ�����ȸ�� ���Ͽ� �����ϴ� ������������ ���Ͽ� ������ �������ڸ� �����մϴ�.

 �� �������� �� ����� ȯ���Կ� �־ �̿��ڰ� �ſ�ī�� �Ǵ� ����ȭ�� ���� ������������ ��ȭ���� ����� ������ ������ ��ü���� ���� ���������� ������ ����ڷ� �Ͽ��� ��ȭ���� ����� û���� ���� �Ǵ� ����ϵ��� ��û�մϴ�.

 �� û��öȸ���� ��� ���޹��� ��ȭ���� ��ȯ�� �ʿ��� ����� �̿��ڰ� �δ��մϴ�. �������� �̿��ڿ��� û��öȸ���� ������ ����� �Ǵ� ���ع���� û������ �ʽ��ϴ�. �ٸ� ��ȭ���� ������ ǥ�á����� ����� �ٸ��ų� ��೻��� �ٸ��� ����Ǿ� û��öȸ���� �ϴ� ��� ��ȭ���� ��ȯ�� �ʿ��� ����� �������� �δ��մϴ�.

 �� �̿��ڰ� ��ȭ���� ���������� �߼ۺ� �δ��� ��쿡 �������� û��öȸ�� �� �����  ���� �δ��ϴ����� �̿��ڰ� �˱� ������ ��Ȯ�ϰ� ǥ���մϴ�.

��17��(����������ȣ)
 �硰������ �̿����� ���������� ���Ű�� ���࿡ �ʿ��� �ּ����� ������ �����մϴ�. ���� ������ �ʼ��������� �ϸ� �� �� ������ ���û������� �մϴ�. 
  1. ����
  2. �ּ�
  3. ��ȭ��ȣ
  4. ���ID(ȸ���� ���)
  5. ��й�ȣ(ȸ���� ���)
  6. ���ڿ����ּ�(�Ǵ� �̵���ȭ��ȣ)

 �� �������� �̿����� ���νĺ��� ������ ���������� �����ϴ� ������ �ݵ�� ���� �̿����� ���Ǹ� �޽��ϴ�.

 �������� ���������� ���� �̿����� ���Ǿ��� �������� �̿��̳� ��3�ڿ��� ������ �� ������, �̿� ���� ��� å���� �������� ���ϴ�. �ٸ�, ������ ��쿡�� ���ܷ� �մϴ�.
  1. ��۾����� ��۾�ü���� ��ۿ� �ʿ��� �ּ����� �̿����� ����(����, �ּ�, ��ȭ��ȣ)�� �˷��ִ� ��� 
  2. ����ۼ�, �м����� �Ǵ� �������縦 ���Ͽ� �ʿ��� ���μ� Ư�� ������ �ĺ��� �� ���� ���·� �����ϴ� ��� 
  3. ��ȭ���� �ŷ��� ���� ��������� ���Ͽ� �ʿ��� ��� 
  4. ��������� ���Ͽ� ����Ȯ�ο� �ʿ��� ��� 
  5. ������ ���� �Ǵ� ������ ���Ͽ� �ʿ��� �Ұ����� ������ �ִ� ���

 �ꡰ������ ��2�װ� ��3�׿� ���� �̿����� ���Ǹ� �޾ƾ� �ϴ� ��쿡�� ������������ å������ �ſ�(�Ҽ�, ���� �� ��ȭ��ȣ, ��Ÿ ����ó), ������ �������� �� �̿����, ��3�ڿ� ���� �������� ���û���(����������, �������� �� ������ ������ ����) �� ������Ÿ��̿���������ѹ��� ��22����2���� ������ ������ �̸� �����ϰų� �����ؾ� �ϸ� �̿��ڴ� �������� �� ���Ǹ� öȸ�� �� �ֽ��ϴ�.

 ���̿��ڴ� �������� �������� ������ �ִ� �ڽ��� ���������� ���� ���� �� ���������� �䱸�� �� ������ �������� �̿� ���� ��ü���� �ʿ��� ��ġ�� ���� �ǹ��� ���ϴ�. �̿��ڰ� ������ ������ �䱸�� ��쿡�� �������� �� ������ ������ ������ ���� ���������� �̿����� �ʽ��ϴ�.
 
 �� �������� �������� ��ȣ�� ���Ͽ� �����ڸ� �����Ͽ� �� ���� �ּ�ȭ�ϸ� �ſ�ī��, ������� ���� ������ �̿����� ���������� �н�, ����, ����, ���� ������ ���� �̿����� ���ؿ� ���Ͽ� ��� å����  ���ϴ�.

 �� ������ �Ǵ� �׷κ��� ���������� �������� ��3�ڴ� ���������� �������� �Ǵ� �������� ������ �޼��� ������ ���� ���������� ��ü���� �ı��մϴ�.

��18��(�������� �ǹ�)
 �� �������� ���ɰ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ ���� ������ �� ����� ���ϴ� �ٿ� ���� �������̰�, ���������� ��ȭ���뿪�� �����ϴµ� �ּ��� ���Ͽ��� �մϴ�.

 �� �������� �̿��ڰ� �����ϰ� ���ͳ� ���񽺸� �̿��� �� �ֵ��� �̿����� ��������(�ſ����� ����)��ȣ�� ���� ���� �ý����� ���߾�� �մϴ�.

 �� �������� ��ǰ�̳� �뿪�� ���Ͽ� ��ǥ�ä������ǰ���ȭ�����ѹ����� ��3�� ������ �δ��� ǥ�ä����������� �����ν� �̿��ڰ� ���ظ� ���� ������ �̸� ����� å���� ���ϴ�.

 �� �������� �̿��ڰ� ������ �ʴ� ���������� ������ ���ڿ����� �߼����� �ʽ��ϴ�.

��19��(ȸ���� ID �� ��й�ȣ�� ���� �ǹ�)
 �� ��17���� ��츦 ������ ID�� ��й�ȣ�� ���� ����å���� ȸ������ �ֽ��ϴ�.

 �� ȸ���� �ڽ��� ID �� ��й�ȣ�� ��3�ڿ��� �̿��ϰ� �ؼ��� �ȵ˴ϴ�.

 �� ȸ���� �ڽ��� ID �� ��й�ȣ�� �������ϰų� ��3�ڰ� ����ϰ� ������ ������ ��쿡�� �ٷ� �������� �뺸�ϰ� �������� �ȳ��� �ִ� ��쿡�� �׿� ����� �մϴ�.

��20��(�̿����� �ǹ�)
 �̿��ڴ� ���� ������ �Ͽ����� �ȵ˴ϴ�.
  1. ��û �Ǵ� ����� ���� ������ ���
  2. Ÿ���� ���� ����
  3. �������� �Խõ� ������ ����
  4. �������� ���� ���� �̿��� ����(��ǻ�� ���α׷� ��) ���� �۽� �Ǵ� �Խ�
  5. ������ ��Ÿ ��3���� ���۱� �� �������ǿ� ���� ħ��  
  6. ������ ��Ÿ ��3���� ������ �ջ��Ű�ų� ������ �����ϴ� ����
  7. �ܼ� �Ǵ� �������� �޽���, ȭ��, ����, ��Ÿ ������ӿ� ���ϴ� ������ ���� ���� �Ǵ� �Խ��ϴ� ����

��21��(���ᡰ������ �ǿ��ᡰ���� ���� ����)
 �� ���� �������� ���� �������� ������ ��ũ(��: ������ ��ũ�� ��󿡴� ����, �׸� �� ��ȭ�� ���� ���Ե�)��� ������ ����� ���, ���ڸ� ���� ������(�� ����Ʈ)�̶�� �ϰ� ���ڸ� �ǿ��� ������(������Ʈ)�̶�� �մϴ�.

 �迬�ᡰ������ �ǿ��ᡰ������ ���������� �����ϴ� ��ȭ� ���Ͽ� �̿��ڿ� ���ϴ� �ŷ��� ���ؼ� ����å���� ���� �ʴ´ٴ� ���� ���ᡰ������ �ʱ�ȭ�� �Ǵ� ����Ǵ� ������ �˾�ȭ������ ������ ��쿡�� �� �ŷ��� ���� ����å���� ���� �ʽ��ϴ�.

��22��(���۱��� �ͼ� �� �̿�����)
 �� �������� �ۼ��� ���۹��� ���� ���۱� ��Ÿ ���������� �������� �ͼ��մϴ�.

 �� �̿��ڴ� �������� �̿������ν� ���� ���� �� ���������� ���������� �ͼӵ� ������ �������� ���� �³����� ����, �۽�, ����, ����, ��� ��Ÿ ����� ���Ͽ� ������������ �̿��ϰų� ��3�ڿ��� �̿��ϰ� �Ͽ����� �ȵ˴ϴ�.

 �� �������� ������ ���� �̿��ڿ��� �ͼӵ� ���۱��� ����ϴ� ��� ���� �̿��ڿ��� �뺸�Ͽ��� �մϴ�.

��23��(�����ذ�)
 �� �������� �̿��ڰ� �����ϴ� ������ �ǰ��̳� �Ҹ��� �ݿ��ϰ� �� ���ظ� ����ó���ϱ� ���Ͽ� ���غ���ó���ⱸ�� ��ġ����մϴ�.

 �� �������� �̿��ڷκ��� ����Ǵ� �Ҹ����� �� �ǰ��� �켱������ �� ������ ó���մϴ�. �ٸ�, �ż��� ó���� ����� ��쿡�� �̿��ڿ��� �� ������ ó�������� ��� �뺸�� �帳�ϴ�.

 �顰������ �̿��ڰ��� �߻��� ���ڻ�ŷ� ����� �����Ͽ� �̿����� ���ر�����û�� �ִ� ��쿡�� �����ŷ�����ȸ �Ǵ� �á������簡 �Ƿ��ϴ� ������������� ������ ���� �� �ֽ��ϴ�.

��24��(���Ǳ� �� �ذŹ�)
 �硰������ �̿��ڰ��� �߻��� ���ڻ�ŷ� ���￡ ���� �Ҽ��� ���� ����� �̿����� �ּҿ� ���ϰ�, �ּҰ� ���� ��쿡�� �żҸ� �����ϴ� ��������� ���Ӱ��ҷ� �մϴ�. �ٸ�, ���� ��� �̿����� �ּ� �Ǵ� �żҰ� �и����� �ʰų� �ܱ� �������� ��쿡�� �λ�Ҽ۹����� ���ҹ����� �����մϴ�.

 �衰������ �̿��ڰ��� ����� ���ڻ�ŷ� �Ҽۿ��� �ѱ����� �����մϴ�.
			</textarea>
		    <br>
		    <input type="checkbox" name="agree1" id="agree1">�̿����� �����մϴ�.
		    <br><br><br><br>
	
	
	
	
	
	
	
	
	
	
	
	
			<h5>�������� ���� �� �̿뿡 ���� �ȳ�</h5>
			<textarea rows=15 cols=100>
�����ϴ� ���������� �׸�
ȸ��� ȸ������, ���, ���� ��û �� ���� ���� ���� �Ʒ��� ���� ���������� �����ϰ� �ֽ��ϴ�.
- �̸�, �̸���, �ּ�, ����ó, �ڵ��� ��ȣ, ���̵�, ��й�ȣ, �г���, �ѽ���ȣ, Ȩ������ �ּ� ���� ���� �̿�����̳� ���
 ó�� �������� �Ʒ��� ���� �������� �����Ǿ� ������ �� �ֽ��ϴ�.
- ���� �̿���, ���� �α�, ��Ű, ���� IP ����, �湮�Ͻ�, ���������� �� os, �˻���, �������, �̿����� ���, �����

���������� ���� �� �̿����

ȸ��� ������ ���������� ������ ������ ���� Ȱ���մϴ�.
��. ���� ������ ���� ��� ���� �� ���� ������ ���� �������
������ ����, ��ǰ��� �Ǵ� û���� �� �߼�, �����ŷ� ���� ���� �� ���� ����, ���� �� ��� ����, ����߽�

��. ȸ�� ����
ȸ���� ���� �̿뿡 ���� ����Ȯ��, ���νĺ�, �ҷ�ȸ���� ���� �̿� ������ ���ΰ� ��� ����, ���� �ǻ� Ȯ��, ���� �� 
����Ƚ�� ����, ��14�� �̸� �Ƶ� �������� ���� �� ���� �븮�� ���ǿ��� Ȯ��, ���� ���� �븮�� ����Ȯ��, ���� ������ ����
 ��Ϻ���, �Ҹ�ó�� �� �ο�ó��, �������� ����

���������� ����/�̿�Ⱓ

�̿����� ���������� ��Ģ������ ���������� ���� �� �̿������ �޼��Ǹ� ��ü ���� �ı��մϴ�.
��, ������ ������ ���ؼ��� �Ʒ��� ������ ������ �Ⱓ ���� �����մϴ�.
��. ȸ�� ���� ��ħ�� ���� �������� ����
- �����̿���
  ���� ���� : ���� �̿� ����
  ���� �Ⱓ : 1��

��. ���ù��ɿ� ���� �������� ����
���, ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ���� �� ��������� ������ ���Ͽ� ������ �ʿ䰡 �ִ� ��� ȸ��� ������ɿ��� ���� ������ �Ⱓ ���� ȸ�������� �����մϴ�. �� ��� ȸ��� �����ϴ� ������ �� ������ �������θ� �̿��ϸ� �����Ⱓ�� �Ʒ��� �����ϴ�.

- ��� �Ǵ� û��öȸ � ���� ���
  ���� ���� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����
  ���� �Ⱓ : 5��
- ��ݰ��� �� ��ȭ ���� ���޿� ���� ���
  ���� ���� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����
  ���� �Ⱓ : 5��
- �Һ����� �Ҹ� �Ǵ� ����ó���� ���� ���
  ���� ���� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����
  ���� �Ⱓ : 3��
- ����Ȯ�ο� ���� ���
  ���� ���� : ������� �̿����� �� ������ȣ � ���� ����
  ���� �Ⱓ : 6����
- �湮�� ���� ���
  ���� ���� : ��ź�к�ȣ��
  ���� �Ⱓ : 3����


����������� ��Ź���� / ������������ �ź�

��. ����������� ��Ź����

- �������������Ź�� �޴� �� : (��)oooo
- �������������Ź�� �ϴ� ������ ���� : ȸ������ ȸ���� ���� �̿뿡 ���� ȸ������ ���� �� ������Ʈ �ý��� ����

��. ������������ �źο� ���� ����
- ���ϲ����� �� ���� �ȳ� ������ �����Ͽ�����, �ȳ������� ���� �����Ͻ� �� �ֽ��ϴ�. ��, �����Ͻ� ��쿡�� ���� �̿뿡 ������ ���� �� �ֽ��ϴ�.


�����ĺ����� ó���� ���� ���� / ����Ȯ�μ��� �̿��� ���� �����ĺ� ���� ���� ����

NICE�ſ���������(���� ������硱)�� ������硱���� ������ ��ü[�ڼ��� ��ü ����� ������硱���� �����ϴ� ������������ �̿� ��, ����]�� ���� �����ϴ� �޴��� �������� ���񽺿� �����Ͽ� �������κ��� ������ �����ĺ������� �̿��ϰų� Ÿ�ο��� ������ ������ ��������Ÿ� �̿����� �� ������ȣ � ���� ������(���� ��������Ÿ�����)�� ���� ������ ���Ǹ� ���� �մϴ�.

��1�� [�����ĺ������� ó��]

������Ȯ�α������ �޴��� �������� ���� ���� ��, �Ʒ� �� ���� ������ ���� ������ �����ĺ������� ó���� �� �ֽ��ϴ�.

1. ������Ÿ��� ��23���� 2 ��2�׿� ���� ���ͳݻ󿡼� �ֹε�Ϲ�ȣ�� �Է����� �ʰ��� �������� Ȯ���� �� �ִ� �޴��� �����������񽺸� �����ϱ� ���� �����ĺ������� �̿�

2. ������Ȯ�α�� ���� � ���� ����(����������ȸ ����)���� ���� ������硱�� ����� ������ż��� �������� ���輭�� �� �ߺ� ����Ȯ���� ���� �ʿ��� ���, ������硱���� ������ ��ü�� �Ʒ��� �����ĺ������� �����޾� ó���� �� �ֽ��ϴ�.

(1) �̸�, �޴�����ȣ, ��Ż�, ����, �������, ����

��2�� [����Ȯ�μ��� �̿��� ���� �����ĺ� ���� ��3�� ���� ����]

�̿��ڴ� ������硱�� �����ϴ� ����Ȯ�μ���(���� �����񽺡��� �մϴ�)�� �̿��ϱ� ���� ���� �̿����� �����ĺ������� ����Ȯ�α���� �Ʒ� ����� �� 3�ڿ��� �����ϴ� �Ϳ� ���� �մϴ�.

1. �����ĺ������� �����޴� ��

������硱 �� ������硱���� ������ ��ü(SKT, Kt, LG U+, ���������������)

2. �����ĺ������� �����޴� ���� �̿����

- ����(ȸ������, ID/PWã�� ��) �̿��� ���� ��������
- ���������� ���� �޴��� ������ ��ġ ���� Ȯ��
- �޴��� ����� Ȯ���� ���� SMS ������ȣ ����
- ���� �̿� ����

3. �����ϴ� �����ĺ����� �׸�

- ����, ����, �������, ��/�ܱ���, �޴�����ȣ, �̵���Ż�


4. �����ĺ������� �����޴� ���� ���� �� �̿� �Ⱓ

- �̿����� ���������� �̿������ �޼��ǰų� ���� �� �����Ⱓ�� ������ ��� �ش� ������ ��ü ���� �ı�.
��, ���� ���� �� ȸ���ħ�� ���� �����ϴ� ������ ��� �Ʒ� �������θ� �̿��ϸ� �����Ⱓ��
������ �����ϴ�.
'������Ÿ� �̿����� �� ������ȣ � ���� ����'�� �ŷ���� ���� �ǹ��� ���� ����: 1��
			</textarea>
			<br>
			<input type="checkbox" name="agree2" id="agree2">�������� ���� �� �̿뿡 ���� �ȳ��� �����մϴ�.
			<br><br><br>
			<a href="http://localhost:9000/hallforyou/user/hfu_join_user.do" target="_top"><span class="joinUser_ok" id="member_join">�Ϲ� ȸ������</span></a>
			<a href="http://localhost:9000/hallforyou/user/hfu_join_admin.do" target="_top"><span class="joinAdmin_ok" id="admin_join">����� ȸ������</span></a>
		</div>
	</div>
	<!-- ########## join end ########## -->
	
	<!-- ########## footer start ########## -->
	<c:import url="http://localhost:9000/hallforyou/user/hfu_footer.do" />
	<!-- ########## footer end ########## -->
</body>
</html>