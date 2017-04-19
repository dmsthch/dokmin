<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dokmin.library.dao.*" %>
<%
String book_code = request.getParameter("book_code");
Rdao dao =new Rdao();
String checkResult=dao.rentalBookCheck(book_code);
if(checkResult==null){
	out.print("존재하지 않음");
}else{
	out.print(checkResult);	
}


%>