<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dokmin.library.dao.*" %>
<%
String book_code = request.getParameter("book_code");
Rdao dao =new Rdao();
String checkResult=dao.rentalBookCheck(book_code);
if(checkResult==null){
	out.print("�������� ����");
}else{
	out.print(checkResult);	
}


%>