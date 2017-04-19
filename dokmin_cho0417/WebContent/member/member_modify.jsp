<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dokmin.library.dao.Mdao" %>
<%@ page import = "dokmin.library.dto.Member" %>
    
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<- send_id");
Mdao dao = new Mdao();
Member m = dao.mSelectforUpdate(send_id);

String dbid = m.getMember_id();
String dbpw = m.getMember_pw();
String dbname = m.getMember_name();
String dbbirth = m.getMember_birth();
String dbphone = m.getMember_phone();
String dbaddr = m.getMember_addr();


%>
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

<%@include file="/nav.jsp"%>

<script>
	 $(document).ready(function(){
	//경고창이 많이 생기지 않게 하기위한 변수. 경고창이 생기면 1 , 아니면 0
	//warningNumber=>생년월일 warningNumber2=>연락처 warningNumbe3=>null 관련 경고
	var warningNumber = 0;
	var warningNumber2 = 0;
	var warningNumber3 = 0;
	
	//생년월일에서 커서가 나왔을때 유효성검사
	$('#member_birth').blur(function(){
		//데이터를 가져온다 
		var member_birth = $('#member_birth').val();
		//정규식을 re_date에 넣는다
		var re_birth = /^[0-9]{8}$/;
		// ^:정규식 시작    $:정규식 종료     {8}:8자리 체크 
		//경고창변수가 0일때만 실행되도록함
		if(warningNumber==0){
			//정규식과 데이터가 맞지않으면 경고창 출력 
			if(re_birth.test(member_birth)!=true){
				//alert('test');
				var warning = '<div class="alert alert-warning alert-dismissable">'+
				'<a href="#" id="close" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
					 '생년월일은 하이픈(-)없이 YYYYMMDD의 형태로 입력하세요. ex)19990101</div>';
				//$('#b_date').focus();
				$(this).parent().append(warning);
				//console.log($(this));
				//경고창변수를 1로 만들어주어서 더 많이 생성되지 않도록 한다.
				warningNumber=1;
				console.log(warningNumber);
			}
		}
	});

	//생년월일경고닫을시. 경고창이 새로 생성된것을 닫으면 다시 경고창변수를 0으로 만든다.
	$(document).on("click","#close",function(){
		warningNumber=0;
		console.log(warningNumber);
	});
	
	
	//연락처에서 커서가 나왔을때 유효성검사
	$('#member_phone').blur(function(){
		//데이터를 가져온다 
		var member_phone = $('#member_phone').val();
		//정규식을 re_date에 넣는다
		var re_phone = /^[0-9]{10,11}$/;
		//경고창변수가 0일때만 실행되도록함
		if(warningNumber2==0){
			//정규식과 데이터가 맞지않으면 경고창 출력 
			if(re_phone.test(member_phone)!=true){
				var warning2 = '<div class="alert alert-warning alert-dismissable">'+
				'<a href="#" id="close2" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
					 '연락처는 하이픈(-)없이 숫자로10~11자로 입력하세요 ex)01012345678</div>';
				//$('#b_date').focus();
				$(this).parent().append(warning2);
				//console.log($(this));
				//경고창변수를 1로 만들어주어서 더 많이 생성되지 않도록 한다.
				warningNumber2=1;
				console.log(warningNumber2);
			}
		}
	});
	
	//연락처 경고닫을시. 경고창이 새로 생성된것을 닫으면 다시 경고창변수를 0으로 만든다.
	$(document).on("click","#close2",function(){
		warningNumber2=0;
		console.log(warningNumber2);
	});

	
	//form에서 submit이 발생하면 유효성검사를한다
	//모든데이터를 가져온후 하나라도 null이면 경고 
	$('#form').submit(function(){
		alert('click test');
		//값가져와서 변수에
		var member_id = $('#member_id').val();
		var member_pw = $('#member_pw').val();
		var member_name = $('#member_name').val();
		var member_birth = $('#member_birth').val();
		var member_phone = $('#member_phone').val();
		var member_addr = $('#member_addr').val();
		
		//alert(member_addr+"테스트");
		
		//정규식들
		var re_birth = /^[0-9]{8}$/;
		var re_phone = /^[0-9]{10,11}$/;
			
		if(re_birth.test(member_birth)!=true){
			$('#member_birth').focus();
			return false;
		}else if(re_phone.test(member_phone)!=true){
			$('#member_phone').focus();
			return false;
		}else{
			//if문 하나라도 null일경우	
			if(member_id==''||member_pw==''||member_name==''||member_birth==''||member_phone==''||member_addr==''){
				//null일때 + 경고창이 없을때(warningNumber3가 0이면 경고창 없고 1이면 경고창 떠있음)
				if(warningNumber3==0){
				alert('항목을 모두 입력해주세요');
				var warning3 = '<div class="alert alert-danger alert-dismissable" style="margin-top:10px;">'+
				'<a href="#" id="close3" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
				 '항목을 모두 입력해주세요.</div>';
				$('#form').append(warning3);
				warningNumber3=1;
				console.log(warningNumber3+"<<<warningNumber3");
				return false;
				}else{
					return false;
				}
			};
		}
	});
	
	//null경고창을 닫을경우 warningNumber2변수를 0으로 바꿔줌
	$(document).on("click","#close3",function(){
		warningNumber3=0;
		console.log(warningNumber3);
	});
})

</script>
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
		    <a href="index.jsp" class="btn btn-info btn-lg" >
         <span class="glyphicon glyphicon-home"></span> Home
        </a>
		</div>

		
		<h1>회원정보/수정</h1>
		
		<form action="<%= request.getContextPath() %>/library.dokmin.modifypro.member" method="post">
<table border="1">
		
		<div class="row">
		  <div class="col-sm-4">회원아이디</div>
		  <div class="col-sm-6"><input id="member_id" name="member_id" type="text" value="<%= dbid %>" readonly class="form-control"></div>
		  <div class="col-sm-2"></div>
	
		</div>
		<div class="row">
		  <div class="col-sm-4">회원 비밀번호</div>
		  <div class="col-sm-6"><input id="member_pw" name="member_pw" type="text" value="<%= dbpw %>"class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">회원이름</div>
		  <div class="col-sm-6"><input id="member_name" name="member_name" type="text" value="<%= dbname %>"class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">생년월일</div>
		  <div class="col-sm-6"><input id="member_birth" name="member_birth" type="text" value="<%= dbbirth %>"class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">연락처</div>
		  <div class="col-sm-6"><input id="member_phone" name="member_phone" type="text" value="<%= dbphone %>"class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">주소</div>
		  <div class="col-sm-6"><input id="member_addr" name="member_addr" type="text" value="<%= dbaddr %>"class="form-control"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		
		<a href="main.jsp"><button type="button" class="btn btn-danger forsubmit">취소</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">수정</button>
		
		</form>
	
	</div>


</body>
</html>
