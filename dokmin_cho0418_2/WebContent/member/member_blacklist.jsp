<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.util.ArrayList" %>
  <%@ page import =  "dokmin.library.dto.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>회원리스트</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>

</script>


<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.right{text-align: right; margin:20px;}

</style>
</head>
<%@include file="/nav.jsp"%>
<body>
	<div class="container">

		
		<h1>블랙리스트</h1>
		*연체 횟수가 5회 초과인 회원 목록
	<div class="row">

			</div>
		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>회원아이디</th>
		        <th>이름</th>
		        <th>생년월일</th>
		        <th>연락처</th>
		        <th>주소</th>
		        <th>권한</th>
		  
		      </tr>
		    </thead>
		    <tbody>
		    
		    <%
		    ArrayList<Member> alm = (ArrayList<Member>)request.getAttribute("alm");
		    	for(Member m : alm){
		    		
		    	
		    	
		    %>
		    <tr>
				<td><%= m.getMember_id() %></td>
				<td><%= m.getMember_name() %></td>
				<td><%= m.getMember_birth() %></td>
				<td><%= m.getMember_phone() %></td>
				<td><%= m.getMember_addr() %></td>
				<td><%= m.getMember_level() %></td>
				
			</tr>
	<%
		}
	%>
		    </tbody>
		</table>
	</div>
</body>
</html>