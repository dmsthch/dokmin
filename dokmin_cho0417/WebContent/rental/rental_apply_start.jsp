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
	
	
		
		<h1>대여신청</h1>
		
		<!-- <div style="margin-bottom: 20px;">
		<select id="select" class="btn btn-default" style="height:40px;">
			<option value="">회원유형</option>
			<option value="회원">회원</option>
			<option value="비회원">비회원</option>
		</select>
		</div> -->
		
		<!-- ------회원일 경우의 form------- -->
	<form name="form" id="form" method="post" action="library.dokmin.apply.rental"> 

		<div class="row">
		  <div class="col-sm-4">아이디</div>
		  <div class="col-sm-6"><input id="m_id" name="m_id" type="text" class="form-control" placeholder="아이디를 입력해주세요"></div>
		 <!--  <div class="col-sm-2"><input type="button" class="btn btn-info" value="검색"></div> -->
		</div>
		
	
		<a href="./library.dokmin.list.rental"><button type="button" class="btn btn-danger forsubmit">취소</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">검색</button>
		</form>
		<!-- ------회원일 경우의 form end------- -->
		

	
	</div>


</body>
</html>