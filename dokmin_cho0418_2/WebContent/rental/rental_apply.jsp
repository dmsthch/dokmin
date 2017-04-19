<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="dokmin.library.dto.Member" %>   
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
<script>
$(document).ready(function(){
	$('.bookCheck').on("click",function(){
		var checkValue= $('#bookCheck').parent().parent().find('input').val();
		//alert('test');
		$.ajax({
			type:'GET',
			url:'./rental/rental_book_check.jsp',
			data : {book_code:checkValue},
			dataType : "JSON",
			success : function(data){
			var book_title =data.book_title;
			var book_state =data.book_state;
			//alert('����'+book_title+book_state);
				$('#bookCheck').parent().parent().find('.selectResult').html('');
				 $('#bookCheck').parent().parent().find('.selectResult').append(book_title+" / ���� :  "+book_state);
			}
		})
	})
})
</script>

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
		
	<%
		Member m = (Member)request.getAttribute("m");
	
		
	%>


	<form name="form" id="form" method="post" action="library.dokmin.applypro.rental">
		<div class="row">
		  <div class="col-sm-3">ȸ�����̵�</div>
		  <div class="col-sm-7"><input id="Member_id" name="Member_id" value="<%=m.getMember_id()%>" type="text" class="form-control" placeholder="�˻��Ǿ� �����¾��̵�" readonly></div>
		  
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-3">ȸ���̸�</div>
		  <div class="col-sm-7"><input id="Member_name" name="Member_name" value="<%=m.getMember_name()%>" type="text" class="form-control" placeholder="�˻��Ǿ� ������ ȸ���̸�" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
			<div class="row">
		  <div class="col-sm-3">������ �ִ� Ƚ��</div>
		  <div class="col-sm-7"><input id="Member_limit" name="Member_limit" value="<%=m.getMember_limit()%>" type="text" class="form-control" placeholder="������ �ִ� å Ƚ�� " readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-3">�뿩�Ǽ�</div>
		  <div class="col-sm-7"><input id="Member_rentalno" name="Member_rentalno" value="<%=m.getMember_rentalno()%>" type="text" class="form-control" placeholder="�˻��Ǿ� ������ �뿩���� ������ ��" readonly></div>
		  <div class="col-sm-2"></div>
		</div>
		
	
	 	<div id="num">
		<div  class="row">
		  <div class="col-sm-3">�����Ϸù�ȣ</div>
		  <div class="col-sm-3"><input id="Book_code" name="Book_code" type="text" class="form-control" placeholder="�����Ϸù�ȣ�� �Է����ּ���"></div>
		  <div class="col-sm-1"><button id="bookCheck" type="button" class="btn btn-default btn-sm bookCheck"> ���� Ȯ��
      		  </button>
    		</div>
    		<div class="col-sm-3 selectResult"></div>
    		<div class="col-sm-2"><button id="plus" type="button" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-plus"></span></button></div>
 
		</div>
		
		</div> 
		

		
		<a href="./library.dokmin.applystart.rental"><button type="button" class="btn btn-danger forsubmit">���</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">�߰�</button>
	
		
			</form>
		
		
		
		<!-- -------������ html--------- -->
		<div id="rt_num" style="display:none;" >
			<div class="row">
			  <div class="col-sm-4">�����Ϸù�ȣ</div>
			  <div class="col-sm-6"><input id="b_number" name="b_number" type="text" class="form-control" placeholder="�����Ϸù�ȣ�� �Է����ּ���"></div>
			  <div class="col-sm-2">
			  <button id="plus" type="button" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-plus"></span></button>
			  <button id="minus" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span></button>
     		  </div>
			</div>
		</div>
		
		<div id="rt_num2" style="display:none;" >
			<div class="row">
			  <div class="col-sm-4">�����Ϸù�ȣ</div>
			  <div class="col-sm-6"><input id="b_number" name="b_number" type="text" class="form-control" placeholder="�����Ϸù�ȣ�� �Է����ּ���"></div>
			  <div class="col-sm-2">
			  <button id="plus2" type="button" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-plus"></span></button>
			  <button id="minus2" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span></button>
     		  </div>
			</div>
		</div>
		<!-- -------������ html end--------- -->
		
	
	</div>


</body>
</html>