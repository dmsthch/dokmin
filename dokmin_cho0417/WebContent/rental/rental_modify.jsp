<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="dokmin.library.dto.Rental" %>   
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
	
		<div style="text-align: left; margin-top: 20px;">
		  <a href="../main.jsp" class="btn btn-info btn-lg" >
         <span class="glyphicon glyphicon-home"></span> Home
        </a>
		</div>
		
		<h1>대여수정</h1>
		
	<%
		Rental r = (Rental)request.getAttribute("r");
	
		
	%>


	<form name="form" id="form" method="post" action="library.dokmin.modifypro.rental">
		<div class="row">
		  <div class="col-sm-4">대여번호</div>
		  <div class="col-sm-6"><input id="rental_no" name="rental_no" value="<%=r.getRental_no()%>" type="text" class="form-control" placeholder="검색되어 나오는아이디" readonly></div>
		  
		  <div class="col-sm-2"></div>
		</div>
		<%-- 
		<div class="row">
		  <div class="col-sm-4">회원이름</div>
		  <div class="col-sm-6"><input id="Member_name" name="Member_name" value="<%=m.getMember_name()%>" type="text" class="form-control" placeholder="검색되어 나오는 회원이릅" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
			<div class="row">
		  <div class="col-sm-4">빌릴수 있는 횟수</div>
		  <div class="col-sm-6"><input id="Member_limit" name="Member_limit" value="<%=m.getMember_limit()%>" type="text" class="form-control" placeholder="빌릴수 있는 책 횟수 " readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">대여권수</div>
		  <div class="col-sm-6"><input id="Member_rentalno" name="Member_rentalno" value="<%=m.getMember_rentalno()%>" type="text" class="form-control" placeholder="검색되어 나오는 대여중인 도서의 수" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
	
	 	<div id="num">
		<div  class="row">
		  <div class="col-sm-4">도서일련번호</div>
		  <div class="col-sm-6"><input id="Book_code" name="Book_code" type="text" class="form-control" placeholder="도서일련번호를 입력해주세요"></div>
		  <div class="col-sm-2"><button id="plus" type="button" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-plus"></span>
      		  </button>
    		  </div>
		</div>
		
		</div> 
		

		
		<a href="./library.dokmin.applystart.rental"><button type="button" class="btn btn-danger forsubmit">취소</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">추가</button>
	
		
			</form>
		
		
		
		<!-- -------복사할 html--------- -->
		<div id="rt_num" style="display:none;" >
			<div class="row">
			  <div class="col-sm-4">도서일련번호</div>
			  <div class="col-sm-6"><input id="b_number" name="b_number" type="text" class="form-control" placeholder="도서일련번호를 입력해주세요"></div>
			  <div class="col-sm-2">
			  <button id="plus" type="button" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-plus"></span></button>
			  <button id="minus" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span></button>
     		  </div>
			</div>
		</div>
		
		<div id="rt_num2" style="display:none;" >
			<div class="row">
			  <div class="col-sm-4">도서일련번호</div>
			  <div class="col-sm-6"><input id="b_number" name="b_number" type="text" class="form-control" placeholder="도서일련번호를 입력해주세요"></div>
			  <div class="col-sm-2">
			  <button id="plus2" type="button" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-plus"></span></button>
			  <button id="minus2" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span></button>
     		  </div>
			</div>
		</div>
		<!-- -------복사할 html end--------- -->
		 --%>
	
	</div>


</body>
</html>