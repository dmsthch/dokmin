<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dokmin.library.dto.HopeBook" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.right{text-align: right; margin:20px;}

</style>
</head>
<body>
<%@include file="/nav.jsp"%>
<%
//alb로 셋팅했던 리스트 받기.
ArrayList<HopeBook> alb = (ArrayList<HopeBook>)request.getAttribute("hopebook");


%>

<div class="container">
		
		<h1>희망도서 리스트</h1>
		
		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>일련번호</th>
		        <th>신청자</th>
		        <th>도서명</th>
		        <th>저자</th>
		        <th>신청일</th>
		        <th>처리상태</th>
		        <th>상태변경</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% 
		    	//for문으로 반복하여 b에 alb를 할당한다.
				//for(Book b : alb){
				for(int i=0; i<alb.size();i++){	
			   	HopeBook b = alb.get(i);
			   	System.out.println(b+"<<--b");
			   	int hb_code=b.getHbook_no();
			   	String member_id = b.getMember_id();
			   	String hb_name = b.getHbook_name();
			   	String hb_writer = b.getHbook_writer();
			   	String hb_date = b.getHbook_date();
			   	String hb_progress = b.getHbook_progress();
			   %>
			   
			   <tr>
			   <td><%=hb_code %></td>
			   <td><%=member_id %></td>
			   <td><%=hb_name %></td>
			   <td><%=hb_writer %></td>
			   <td><%=hb_date %></td>
			   <td><%=hb_progress %></td>
			   <td><div class="dropdown">
				  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">처리상태
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
				    <li><a href="library.dokmin.hope.progress.book?hb_code=<%=hb_code%>&hb_progress=1">취소됨</a></li>
				    <li><a href="library.dokmin.hope.progress.book?hb_code=<%=hb_code%>&hb_progress=2">처리중</a></li>
				    <li><a href="library.dokmin.hope.progress.book?hb_code=<%=hb_code%>&hb_progress=3">입고됨</a></li>
				  </ul>
				</div></td>
			  <!--  <td><a href=""><button>처리상태</button></a></td> -->
			   </tr>
			<%
			} 
			%>
		    
		    </tbody>
		</table>
	</div>





</body>
</html>