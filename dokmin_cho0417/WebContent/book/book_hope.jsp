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
	
		
		<h1>������� ��û�ϱ�</h1>
		<div style="margin-bottom: 20px">�а� ���� å�� �������� ���ٸ�, ��û���ּ���.</div>
		<form id="form" action="library.dokmin.hope.pro.book" method="post">
		
		<div class="row">
		  <div class="col-sm-4">������</div>
		  <div class="col-sm-6"><input id="hbook_name" name="hbook_name" type="text" class="form-control" placeholder="������"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">���ڸ�</div>
		  <div class="col-sm-6"><input id="hbook_writer" name="hbook_writer" type="text" class="form-control" placeholder="���ڸ�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div>
		</div>
		
		<button id="submit" type="submit" class="btn btn-info forsubmit">��û</button>
		</form>
	
	</div>


</body>
</html>