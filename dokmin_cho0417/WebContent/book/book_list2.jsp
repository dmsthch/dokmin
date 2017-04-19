<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dokmin.library.dto.Book" %>
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
ArrayList<Book> alb = (ArrayList<Book>)request.getAttribute("alb");
//System.out.println(alb+"<<--alb");
ArrayList<String> bg = (ArrayList<String>)request.getAttribute("bg");

//���ǿ��� ���������ޱ�
String s_level = (String)session.getAttribute("S_level");
System.out.println(s_level+"<<s_level ��������Ʈ");
%>
<div class="container">
		<h1>��������Ʈ</h1>
				<div class="row">
					<div  class="col-sm-3 left">
					  <select name="b_genre" id="b_genre" class="btn btn-primary" style="height:38px;">
						<option value="" selected>�帣����</option>
						<option value="">�Ҽ�</option>
						<option value="">��</option>
						<option value="">����</option>		  
					  </select>
					</div>
					<div  class="col-sm-8-offset">
			      	</div>
		      	</div>



<% 
if(s_level==null||s_level.equals("�Ϲ�ȸ��")){
%>
<!-- --------------------------ȸ�� ȭ�� ���� -------------------------- -->

		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>�Ϸù�ȣ</th>
		        <th>�帣</th>
		        <th>������</th>
		        <th>����</th>
		        <th>���ǻ�</th>
		        <th>��������</th>
		        <th>�뿩�ϱ�</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% 
		    	//for������ �ݺ��Ͽ� b�� alb�� �Ҵ��Ѵ�.
				//for(Book b : alb){
				for(int i=0; i<alb.size();i++){	
			   	Book b = alb.get(i);
			   	String b_genreK = bg.get(i);
			   	System.out.println(b+"<<--b");
			   	String b_code=b.getBook_code();
			   	int b_genre = b.getBook_genre();
			   	String b_title = b.getBook_title();
			   	String b_writer = b.getBook_writer();
			   	String b_publisher = b.getBook_publisher();
			   	String b_state =b.getBook_state();
			   	//�Ϲ�ȸ���� �ջ�� ������ �� �� ����.
			   	if(b_state.equals("�ջ�")){
			   		continue;
			   	}
			   %>
			   
			   <tr>
			   <td><%=b_code %></td>
			   <td><%=b_genre %>/<%=b_genreK%></td>
			   <td><%=b_title %></td>
			   <td><%=b_writer %></td>
			   <td><%=b_publisher %></td>
			   <td><%=b_state %></td>
			   
			   <%
			   //�뿩���� �ƴϸ� �뿩��û��ư�� �ߵ���
			   if(b_state.equals("����")){
				   if(s_level==null){
					   //�α������� �ƴ϶��, �α����� ���� �ϵ��� �Ѵ�.
					   %>
					   <td><a href="library.dokmin.form.login"><button>�뿩��û�ϱ�</button></a></td>
					   <%  
				   }else if(s_level.equals("�Ϲ�ȸ��")){
					   //�α������̶�� �뿩��û�Ҽ��ֵ��� ��
					   %>
					   <td><a href=""><button>�뿩��û�ϱ�</button></a></td>
					   <% 
				   }
			   }else if(b_state.equals("�뿩��")){
				//�뿩���̸� �뿩�Ұ���� �ߵ��� �Ѵ�   
				%>
				<td>�뿩�Ұ�</td>				
				<%} %>
			   
			   </tr>
			<%
		   } 
		    %>
		    
		    </tbody>
		</table>
	</div>
<!-- --------------------------ȸ�� ȭ�� ��-------------------------- -->
<%
}else if(s_level.equals("������")){
%>
<!-- --------------------------������ ȭ�� ���� -------------------------- -->


		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>�Ϸù�ȣ</th>
		        <th>�帣</th>
		        <th>������</th>
		        <th>����</th>
		        <th>���ǻ�</th>
		        <th>��������</th>
		        <th>������/����</th>
		        <th>����</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% 
		    	//for������ �ݺ��Ͽ� b�� alb�� �Ҵ��Ѵ�.
				//for(Book b : alb){
				for(int i=0; i<alb.size();i++){	
			   	Book b = alb.get(i);
			   	String b_genreK = bg.get(i);
			   	System.out.println(b+"<<--b");
			   	String b_code=b.getBook_code();
			   	int b_genre = b.getBook_genre();
			   	String b_title = b.getBook_title();
			   	String b_writer = b.getBook_writer();
			   	String b_publisher = b.getBook_publisher();
			   	String b_state =b.getBook_state();
			   	
			   %>
			   
			   <tr>
			   <td><%=b_code %></td>
			   <td><%=b_genre %>/<%=b_genreK%></td>
			   <td><%=b_title %></td>
			   <td><%=b_writer %></td>
			   <td><%=b_publisher %></td>
			   <td><%=b_state %></td>
			   <td><a href="library.dokmin.modify.book?b_code=<%=b_code%>"><button>�󼼺���</button></a></td>
			   <td><a href="library.dokmin.delete.book?b_code=<%=b_code%>"><button>�����ϱ�</button></a></td>
			   </tr>
			<%
		   } 
}
		    %>
		    
		    </tbody>
		</table>
	</div>
<!-- --------------------------������ ȭ�� �� -------------------------- -->




</body>
</html>