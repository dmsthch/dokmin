<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import =  "dokmin.library.dto.HopeBook" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��� ���� ����Ʈ</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!--  -->
<%@include file="/nav.jsp"%>

<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.right{text-align: right; margin:20px;}

</style>
</head>
<body>
	<div class="container">
	
		<div style="text-align: left; margin-top: 20px;">
		    <a href="../main.html" class="btn btn-info btn-lg" >
         <span class="glyphicon glyphicon-home"></span> Home
        </a>
		</div>
		
		<h1>���� ��� ���� ����Ʈ</h1>
	
		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>������� �����ڵ�</th>
		        <th>��û������</th>
		        <th>��û���� ����</th>
		        <th>��û��</th>
		        <th>�������</th>
		     
		      </tr>
		    </thead>
		    <tbody>
		       <%
		    ArrayList<HopeBook> alm = (ArrayList<HopeBook>)request.getAttribute("alm");
		    	for(HopeBook h : alm){
		    		
		    	
		    	
		    %>
		    <tr>
				<td><%= h.getHbook_no() %></td>
				<td><%= h.getHbook_name() %></td>
				<td><%= h.getHbook_writer() %></td>
				<td><%= h.getHbook_date() %></td>
				<td><%= h.getHbook_progress() %></td>
				
				
				
			</tr>
	<%
		}
	%>
		    </tbody>
		</table>
		
	</div>
</body>
</html>