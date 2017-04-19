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
<title>�뿩����Ʈ</title>

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
		
		<h1>�뿩����</h1>
		<div class="row" style="margin-bottom: -20px;">
			<div  class="col-sm-3 left">
			<input type="text" class="form-control"  placeholder="db�����ϸ� �˻���� �߰�">
			</div>
			<div  class="col-sm-8 right">
				<a href="./rental_apply_start.jsp"><button class="btn btn-primary">�뿩��û</button></a>
	      	</div>
      	</div>
		<div class="left">
		*ȸ���ϰ�� ȸ����ȣ, ��ȸ���ϰ�� ����ó ���<br/>
		*�뿩Ƚ���� �뿩�ϼ��� �ش� ������ �� �뿩Ƚ���� �ش絵���� �� �뿩�ϼ��Դϴ�
		</div>
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>�뿩�Ϸù�ȣ</th>
		        <th>ȸ�����̵�</th>
		        <th>ȸ����</th>
		        <th>�����ڵ�</th>
		        <th>������</th>
		        <th>�ݳ���</th>
		      	<th>�ݳ�����</th>
		      	<th>�� ��</th>
		      	<th>�� ��</th>
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
������ư
</a>			
	</td>
	<td><div class="dropdown">
				  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">ó������
				  <span class="caret"></span></button>
				  <ul class="dropdown-menu">
				    <li><a href="library.dokmin.list.return.rental?rental_no=<%=r.getRental_no()%>&rental_return=1">�� ��</a></li>
				    <li><a href="library.dokmin.list.return.rental?rental_no=<%=r.getRental_no()%>&rental_return=2">�̹ݳ�</a></li>
				  </ul>
				</div></td>
	<%-- <td>
<a href="<%= request.getContextPath() %>/Mdel/m_delete_pro.ksmart?send_id=<%= r.getMember_id()%>">
�ݳ���ư
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