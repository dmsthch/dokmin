<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<%@include file="/nav.jsp"%>
<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.row div {margin-bottom: 20px; vertical-align:middle;}
.forsubmit {margin-right: 40px;}
.alert-warning{margin-top: 20px;}
</style>

</head>
<body>
	<div class="container">
	
	
		
		<h1>�뿩��û</h1>
		
		<!-- <div style="margin-bottom: 20px;">
		<select id="select" class="btn btn-default" style="height:40px;">
			<option value="">ȸ������</option>
			<option value="ȸ��">ȸ��</option>
			<option value="��ȸ��">��ȸ��</option>
		</select>
		</div> -->
		
		<!-- ------ȸ���� ����� form------- -->
	<form name="form" id="form" method="post" action="library.dokmin.apply.rental"> 

		<div class="row">
		  <div class="col-sm-4">���̵�</div>
		  <div class="col-sm-6"><input id="m_id" name="m_id" type="text" class="form-control" placeholder="���̵� �Է����ּ���"></div>
		 <!--  <div class="col-sm-2"><input type="button" class="btn btn-info" value="�˻�"></div> -->
		</div>
		
	
		<a href="./library.dokmin.list.rental"><button type="button" class="btn btn-danger forsubmit">���</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">�˻�</button>
		</form>
		<!-- ------ȸ���� ����� form end------- -->
		

	
	</div>


</body>
</html>