<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dokmin.library.dao.*" %>
<%@ page import="dokmin.library.dto.*" %>
<%
String book_code = request.getParameter("book_code");
Rdao dao =new Rdao();
Book b = new Book();
b = dao.rentalBookCheck(book_code);
if(b==null){
	out.print("{\"book_title\" : \" 결과 없음 \" , \"book_state\" : \" 결과 없음 \"}");
}else{
	out.print("{\"book_title\" : \""+b.getBook_title()+"\" , \"book_state\" : \""+b.getBook_state()+"\"}");	
}


%>