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
//alb�� �����ߴ� ����Ʈ �ޱ�.
ArrayList<HopeBook> alb = (ArrayList<HopeBook>)request.getAttribute("hopebook");


%>

<div class="container">
		
		<h1>������� ����Ʈ</h1>
		
		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>�Ϸù�ȣ</th>
		        <th>��û��</th>
		        <th>������</th>
		        <th>����</th>
		        <th>��û��</th>
		        <th>ó������</th>
		        <th>���º���</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% 
		    	//for������ �ݺ��Ͽ� b�� alb�� �Ҵ��Ѵ�.
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
				  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">ó������
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
				    <li><a href="library.dokmin.hope.progress.book?hb_code=<%=hb_code%>&hb_progress=1">��ҵ�</a></li>
				    <li><a href="library.dokmin.hope.progress.book?hb_code=<%=hb_code%>&hb_progress=2">ó����</a></li>
				    <li><a href="library.dokmin.hope.progress.book?hb_code=<%=hb_code%>&hb_progress=3">�԰��</a></li>
				  </ul>
				</div></td>
			  <!--  <td><a href=""><button>ó������</button></a></td> -->
			   </tr>
			<%
			} 
			%>
		    
		    </tbody>
		</table>
	</div>





</body>
</html>