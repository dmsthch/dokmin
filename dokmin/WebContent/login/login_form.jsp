<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�α���</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.row div {margin-bottom: 20px; vertical-align:middle;}
.forsubmit {margin-right: 40px;}
.alert-warning{margin-top: 20px;}
</style>
</head>
<%@include file="/nav.jsp"%>
<body>
<div class="container">
	<h1>�α���</h1>
	<form action="library.dokmin.pro.login" method="post">
	<div class="row">
	  <div class="col-sm-4">���̵�</div>
	  <div class="col-sm-6"><input id="member_id" name="member_id" type="text" class="form-control" placeholder="ID"></div>
	  <div class="col-sm-2"></div>
	</div>
	
	<div class="row">
	  <div class="col-sm-4">��й�ȣ</div>
	  <div class="col-sm-6"><input id="member_pw" name="member_pw" type="password" class="form-control" placeholder="PW"></div>
	  <div class="col-sm-2"></div>
	</div>
	<button id="submit" type="submit" class="btn btn-info forsubmit">�α���</button>
	</form>
</div>
</body>
</html>