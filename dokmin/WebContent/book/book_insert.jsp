<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.row div {margin-bottom: 20px; vertical-align:middle;}
.forsubmit {margin-right: 40px;}
.alert-warning{margin-top: 20px;}
</style>
<%@include file="/nav.jsp"%>
</head>
<body>
	<div class="container">
	
		
		<h1>�����߰�</h1>
		
		<form id="form" action="library.dokmin.insert.pro.book" method="post">
		<div class="row">
		  <div class="col-sm-4">ISBN</div>
		  <div class="col-sm-6"><input id="book_code" name="book_code" type="text" class="form-control" placeholder="ISBN�� ��Ȯ�� �Է��ϼ���. �����ڵ�� ���Ŀ� �����Ұ����մϴ�."></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">������</div>
		  <div class="col-sm-6"><input id="book_title" name="book_title" type="text" class="form-control" placeholder="������"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">���ڸ�</div>
		  <div class="col-sm-6"><input id="book_writer" name="book_writer" type="text" class="form-control" placeholder="���ڸ�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">���ǻ�</div>
		  <div class="col-sm-6"><input id="book_publisher" name="book_publisher" type="text" class="form-control" placeholder="���ǻ�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">������</div>
		  <div class="col-sm-6"><input id="book_date" name="book_date" type="text" class="form-control" placeholder="������:������(-)���� 8�ڸ� ���ڷ� �Է�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">�帣�ڵ�</div>
		 <div class="col-sm-6"><input id="book_genre" name="book_genre" type="text" class="form-control" placeholder="3�ڸ� ����"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">��������</div>
		 <div class="col-sm-6"><input id="book_price" name="book_price" type="text" class="form-control" placeholder=""></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">������</div>
		 <div class="col-sm-6"><input id="book_manager" name="book_manager" type="text" class="form-control" placeholder="������ ID"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
			<div class="col-sm-4">�Ǽ�</div>
			<div class="col-sm-6"><input id="book_volume" name="book_volume" type="text" class="form-control" placeholder="������ �Է��ϼ���"></div>
			<div class="col-sm-2"></div>
		</div>
	
		
		<div>
		</div>
		
		<a href="./Bk_li.html"><button type="button" class="btn btn-danger forsubmit">���</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">�߰�</button>
		</form>
	
	</div>


</body>
</html>