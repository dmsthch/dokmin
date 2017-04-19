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
				ArrayList<Rental> alm = (ArrayList<Rental>)request.getAttribute("alm");
				
				for(int i=0;i<alm.size();i++){
					Rental r = alm.get(i);
					System.out.println(r+"<<--r");
					int rental_no=r.getRental_no();
					String member_id = r.getMember_id();
					String member_name = r.getMember_name();
					String book_code = r.getBook_code();
					String book_title = r.getBook_title();
					String rental_date = r.getRental_date();
					String rental_return = r.getRental_return();
					
			%>
			<tr>
			<td><%=rental_no %></td>
			<td><%=member_id %></td>
			<td><%=member_name %></td>
			<td><%=book_code %></td>
			<td><%=book_title %></td>
			<td><%=rental_date %></td>
			<td><%=rental_return %></td>
				<td>
<a href="<%= request.getContextPath() %>/library.dokmin.modify.rental?rental_no=<%= r.getRental_no()%>">
수정버튼
</a>			
	</td>
	<td><div class="dropdown">
				  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">처리상태
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
				    <li><a href="library.dokmin.list.return.rental?rental_no=<%=r.getRental_no()%>&rental_return=1">반 납</a></li>
				    <li><a href="library.dokmin.list.return.rental?rental_no=<%=r.getRental_no()%>&rental_return=2">미반납</a></li>
				  </ul>
				</div></td>
	<%-- <td>
<a href="<%= request.getContextPath() %>/Mdel/m_delete_pro.ksmart?send_id=<%= r.getMember_id()%>">
반납버튼
</a>			
	</td> --%>
			</tr>
			<% 
			}
				%>
		    </tbody>
		</table>
		
	</div>
</body>
</html>