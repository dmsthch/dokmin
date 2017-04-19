<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	 $(document).ready(function(){
	//���â�� ���� ������ �ʰ� �ϱ����� ����. ���â�� ����� 1 , �ƴϸ� 0
	//warningNumber=>������� warningNumber2=>����ó warningNumbe3=>null ���� ���
	var warningNumber = 0;
	var warningNumber2 = 0;
	var warningNumber3 = 0;
	
	//������Ͽ��� Ŀ���� �������� ��ȿ���˻�
	$('#member_birth').blur(function(){
		//�����͸� �����´� 
		var member_birth = $('#member_birth').val();
		//���Խ��� re_date�� �ִ´�
		var re_birth = /^[0-9]{8}$/;
		//���â������ 0�϶��� ����ǵ�����
		if(warningNumber==0){
			//���Խİ� �����Ͱ� ���������� ���â ��� 
			if(re_birth.test(member_birth)!=true){
				//alert('test');
				var warning = '<div class="alert alert-warning alert-dismissable">'+
				'<a href="#" id="close" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
					 '��������� ������(-)���� YYYYMMDD�� ���·� �Է��ϼ���. ex)19990101</div>';
				//$('#b_date').focus();
				$(this).parent().append(warning);
				//console.log($(this));
				//���â������ 1�� ������־ �� ���� �������� �ʵ��� �Ѵ�.
				warningNumber=1;
				console.log(warningNumber);
			}
		}
	});

	//������ϰ�������. ���â�� ���� �����Ȱ��� ������ �ٽ� ���â������ 0���� �����.
	$(document).on("click","#close",function(){
		warningNumber=0;
		console.log(warningNumber);
	});
	
	
	//����ó���� Ŀ���� �������� ��ȿ���˻�
	$('#member_phone').blur(function(){
		//�����͸� �����´� 
		var member_phone = $('#member_phone').val();
		//���Խ��� re_date�� �ִ´�
		var re_phone = /^[0-9]{10,11}$/;
		//���â������ 0�϶��� ����ǵ�����
		if(warningNumber2==0){
			//���Խİ� �����Ͱ� ���������� ���â ��� 
			if(re_phone.test(member_phone)!=true){
				var warning2 = '<div class="alert alert-warning alert-dismissable">'+
				'<a href="#" id="close2" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
					 '����ó�� ������(-)���� ���ڷ�10~11�ڷ� �Է��ϼ��� ex)01012345678</div>';
				//$('#b_date').focus();
				$(this).parent().append(warning2);
				//console.log($(this));
				//���â������ 1�� ������־ �� ���� �������� �ʵ��� �Ѵ�.
				warningNumber2=1;
				console.log(warningNumber2);
			}
		}
	});
	
	//����ó ��������. ���â�� ���� �����Ȱ��� ������ �ٽ� ���â������ 0���� �����.
	$(document).on("click","#close2",function(){
		warningNumber2=0;
		console.log(warningNumber2);
	});

	
	//form���� submit�� �߻��ϸ� ��ȿ���˻縦�Ѵ�
	//��絥���͸� �������� �ϳ��� null�̸� ��� 
	$('#form').submit(function(){
		//alert('click test');
		//�������ͼ� ������
		var member_id = $('#member_id').val();
		var member_pw = $('#member_pw').val();
		var member_name = $('#member_name').val();
		var member_birth = $('#member_birth').val();
		var member_phone = $('#member_phone').val();
		var member_addr = $('#member_addr').val();
		
		//alert(member_addr+"�׽�Ʈ");
		
		//���Խĵ�
		var re_birth = /^[0-9]{8}$/;
		var re_phone = /^[0-9]{10,11}$/;
			
		if(re_birth.test(member_birth)!=true){
			$('#member_birth').focus();
			return false;
		}else if(re_phone.test(member_phone)!=true){
			$('#member_phone').focus();
			return false;
		}else{
			//if�� �ϳ��� null�ϰ��	
			if(member_id==''||member_pw==''||member_name==''||member_birth==''||member_phone==''||member_addr==''){
				//null�϶� + ���â�� ������(warningNumber3�� 0�̸� ���â ���� 1�̸� ���â ������)
				if(warningNumber3==0){
				alert('�׸��� ��� �Է����ּ���');
				var warning3 = '<div class="alert alert-danger alert-dismissable" style="margin-top:10px;">'+
				'<a href="#" id="close3" class="close" data-dismiss="alert" aria-label="close">&times;</a>'+
				 '�׸��� ��� �Է����ּ���.</div>';
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
	
	//null���â�� ������� warningNumber2������ 0���� �ٲ���
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
<%@include file="/nav.jsp"%>
<body>

	<div class="container">
	
		
		<h1>ȸ������</h1>
		
		<form action="<%= request.getContextPath() %>/library.dokmin.signup.member" method="post" id="form">
<table border="1">
		<div class="row">
		  <div class="col-sm-4">ȸ�� ���̵�</div>
		  <div class="col-sm-6"><input id="member_id" name="member_id" type="text" class="form-control" placeholder="ȸ�� ���̵�"></div>
		  <div class="col-sm-2"></div>
		</div>
		<div class="row">
		  <div class="col-sm-4">ȸ�� ��й�ȣ</div>
		  <div class="col-sm-6"><input id="member_pw" name="member_pw" type="text" class="form-control" placeholder="ȸ�� ��й�ȣ"></div>
		  <div class="col-sm-2"></div>
		</div>
		<div class="row">
		  <div class="col-sm-4">ȸ�� �̸�</div>
		  <div class="col-sm-6"><input id="member_name" name="member_name" type="text" class="form-control" placeholder="ȸ�� �̸�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">�������</div>
		  <div class="col-sm-6"><input id="member_birth" name="member_birth" type="text" class="form-control" placeholder="�������:������(-)���� 8�ڸ� ���ڷ� �Է�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">����ó</div>
		  <div class="col-sm-6"><input id="member_phone" name="member_phone" type="text" class="form-control" placeholder="����ó:������(-)���� ���ڷ� �Է�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		<div class="row">
		  <div class="col-sm-4">�ּ�</div>
		  <div class="col-sm-6"><input id="member_addr" name="member_addr" type="text" class="form-control" placeholder="�ּ�"></div>
		  <div class="col-sm-2"></div>
		</div>
		
		
		<a href="main.jsp"><button type="button" class="btn btn-danger forsubmit">���</button></a>
		<button id="submit" type="submit" class="btn btn-info forsubmit">�߰�</button>
		</form>
	
	</div>
</table>
</form>

</body>
</html>
