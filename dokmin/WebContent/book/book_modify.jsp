<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dokmin.library.dto.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
</script>

<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.row div {margin-bottom: 20px; vertical-align:middle;}
.forsubmit {margin-right: 40px;}

</style>

</head>
<body>
<%@include file="/nav.jsp"%>
	<div class="container">
	<%
	//String b_code=request.getParameter("b_code");
	//하나의 도서정보와, 한글화된 장르코드를 가져옴.
	Book b = (Book)request.getAttribute("book");
	String bg = (String)request.getAttribute("bg");
	String manager_name = (String)request.getAttribute("manager_name");
	%>
		
		<h1>도서상세정보</h1>
		<div style="margin-bottom: 20px;">*담당자를 수정할때는 아이디만 적어주세요.</div>
		<form id="form" action="library.dokmin.modify.pro.book" method="post">
		<div class="row">
		  <div class="col-sm-4">일련번호</div>
		  <div class="col-sm-6"><input id="book_code" name="book_code" type="text" class="form-control" value="<%=b.getBook_code()%>" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">도서명</div>
		  <div class="col-sm-6"><input id="book_title" name="book_title" type="text" value="<%=b.getBook_title() %>" class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">저자명</div>
		  <div class="col-sm-6"><input id="book_writer" name="book_writer" type="text" value="<%=b.getBook_writer() %>" class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">출판사</div>
		  <div class="col-sm-6"><input id="book_publisher" name="book_publisher" type="text" value="<%=b.getBook_publisher() %>" class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">출판일</div>
		  <div class="col-sm-6"><input id="book_date" name="book_date" type="text" value="<%=b.getBook_date() %>" class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">장르코드 / 장르구분</div>
		  <div class="col-sm-3"><input id="book_genre" name="book_genre" type="text" value="<%=b.getBook_genre() %>" class="form-control"></div>
		  <div class="col-sm-3"><input type="text" value="<%=bg %>" class="form-control" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">도서상태</div>
		  <div class="col-sm-6">
		  <input id="book_state" name="book_state" type="text" value="<%=b.getBook_state() %>" class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">총 대여횟수</div>
		  <div class="col-sm-6"><input id="book_tnor" name="book_tnor" type="text" value="<%=b.getBook_tnor() %>" class="form-control" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">도서정가</div>
		  <div class="col-sm-6"><input id="book_price" name="book_price" type="text" value="<%=b.getBook_price() %>" class="form-control" ></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">담당자 ID / 이름</div>
		  <div class="col-sm-3"><input id="book_manager" name="book_manager" type="text" value="<%=b.getBook_manager() %>" class="form-control" ></div>
		  <div class="col-sm-3"><input id="book_manager_name" name="book_manager_name" type="text" value="<%=manager_name%>" class="form-control" readonly></div>
		  <div class="col-sm-2"></div>
		</div>


		<a href="library.dokmin.list.book"><button type="button" class="btn btn-danger forsubmit">취소</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">수정</button>
		</form>
		
</div>

</body>
</html>