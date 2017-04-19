<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "dokmin.library.dao.Rdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dokmin.library.dto.Rental" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/nav.jsp"%>
<meta charset="EUC-KR">
<title>대여리스트</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.right{text-align: right; margin:20px;}

</style>
</head>
<body>

	<div class="container">
		
		<h1>대여관리</h1>
		<div class="row" style="margin-bottom: -20px;">
			<div  class="col-sm-3 left">
			<input type="text" class="form-control"  placeholder="db연결하면 검색기능 추가">
			</div>
			<div  class="col-sm-8 right">
				<a href="./rental_apply_start.jsp"><button class="btn btn-primary">대여신청</button></a>
	      	</div>
      	</div>
		<div class="left">
		*회원일경우 회원번호, 비회원일경우 연락처 등록<br/>
		*대여횟수와 대여일수는 해당 도서의 총 대여횟수와 해당도서의 총 대여일수입니다
		</div>
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>대여일련번호</th>
		        <th>회원아이디</th>
		        <th>회원명</th>
		        <th>도서코드</th>
		        <th>도서명</th>
		        <th>반납일</th>
		      	<th>반납여부</th>
		      	<th>수 정</th>
		      	<th>반 납</th>
		      </tr>
		    </thead>
		    <tbody>
		    <%
				Rdao dao = new Rdao();
				//ArrayList<Member> get_alm = dao.mAllSelect();
				ArrayList<Rental> get_alm = (ArrayList<Rental>)request.getAttribute("alm");
				
				for(int i=0;i<get_alm.size();i++){
					Rental r = get_alm.get(i);
					
			%>
			<tr>
			<td><%= r.getRental_no() %></td>
			<td><%= r.getMember_id() %></td>
			<td><%= r.getMember_name() %></td>
			<td><%= r.getBook_code() %></td>
			<td><%= r.getBook_title() %></td>
			<td><%= r.getRental_date()%></td>
			<td><%= r.getRental_return()%></td>
				<td>
<a href="<%= request.getContextPath() %>/library.dokmin.modify.rental?send_id=<%= r.getMember_id()%>">
수정버튼
</a>			
	</td>
	<td>
<a href="<%= request.getContextPath() %>/Mdel/m_delete_pro.ksmart?send_id=<%= r.getMember_id()%>">
반납버튼
</a>			
	</td>
			</tr>
			<% 
			}
				%>
		    </tbody>
		</table>
		
	</div>
</body>
</html>