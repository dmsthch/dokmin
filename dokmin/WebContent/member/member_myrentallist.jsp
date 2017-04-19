<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import =  "dokmin.library.dto.Rental" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 대여리스트</title>

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
		
		<h1>나의 대여리스트</h1>
		<div class="row" style="margin-bottom: -20px;">
			
      	</div>
		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>대여일련번호</th>
		        <th>도서일련번호</th>
		        <th>대출일</th>
		        <th>반납여부</th>
		     
		      </tr>
		    </thead>
		    <tbody>
		       <%
		    ArrayList<Rental> alm = (ArrayList<Rental>)request.getAttribute("alm");
		    	for(Rental r : alm){
		    		
		    	
		    	
		    %>
		    <tr>
				<td><%= r.getRental_no() %></td>
				<td><%= r.getBook_code() %></td>
				<td><%= r.getRental_date() %></td>
				<td><%= r.getRental_return() %></td>
				
				
				
			</tr>
	<%
		}
	%>
		    </tbody>
		</table>
		
	</div>
</body>
</html>