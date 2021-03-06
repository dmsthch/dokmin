<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dokmin.library.dto.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
	$('#b_genre').on('change',function(){
		//alert('test');
		if($('#b_genre').val()==""){
			//alert('test');
			$('#b_genre_2').find('option').each(function(){
						$(this).remove(); 
			})
			$('#b_genre_2').append("<option value=''> 전체 </option>");
		}else{
			$.ajax({
				type:'GET',
				url:'./book/test.jsp',
				data : {b_genre:$('#b_genre').val()},
				dataType:"JSON",
				success : function(data){
					//alert('성공');
					//alert("data.length : "+data.length);
					$('#b_genre_2').find('option').each(function(){
						$(this).remove(); 
					})
					$.each(data,function(){
						//alert(this.genre_code+ this.genre_name);
						var getGc = this.genre_code;
						var getGn = this.genre_name;
						$('#b_genre_2').append("<option value=" + getGc +">"+ getGn + "</option>");
					})
					//alert("Data :"+data[0].find('genre_code')+ "\nStatus : "+ status);	
				} ,
				error:function(xhr, status , error){
					alert("에러발생");
				}
			}) 
		/* $.get("/dokmin_cho0417/library.dokmin.test.book", {b_genre:$('#b_genre').val()}, function(data,status){
			alert('test');
			alert("Data :"+data+ "\nStatus : "+ status);
			console.log($(data).get('genre_code'));
		}) */
		}
	})
	
})
</script>
<style>
.container, table th{text-align: center;}
.container h1{margin-bottom: 50px;}
.left{text-align: left; margin:20px;}
.right{text-align: right; margin:20px;}

</style>
</head>
<body>
<%@include file="/nav.jsp"%>
<%
//alb로 셋팅했던 리스트 받기.
ArrayList<Book> alb = (ArrayList<Book>)request.getAttribute("alb");
//System.out.println(alb+"<<--alb");
ArrayList<String> bg = (ArrayList<String>)request.getAttribute("bg");

//세션에서 권한정보받기
String s_level = (String)session.getAttribute("S_level");
System.out.println(s_level+"<<s_level 도서리스트");
%>
<div class="container">
		<h1>도서리스트</h1>
				<div class="row" style="margin-bottom: 0px;">
					<div  class="col-sm-6 left">
					  <select name="b_genre" id="b_genre" class="btn btn-primary" style="height:38px;">
						<option value="" selected>장르정렬</option>
						<option value=0>총류</option>
						<option value=10>철학</option>
						<option value=20>종교</option>
						<option value=30>사회과학</option>
						<option value=40>언어학</option>
						<option value=50>순수과학</option>
						<option value=60>응용과학</option>
						<option value=70>예술</option>
						<option value=80>문학</option>
						<option value=90>역사</option>		  
								 
					  </select>
					  
					   <select name="b_genre_2" id="b_genre_2" class="btn btn-primary" style="height:38px;">
						<option value="">전체</option>  
					  </select>
					</div>
<!-- 					<div  class="col-sm-6-offset">
			      	</div> -->
		      	</div>
		      	<div class="row" style="margin-top: -20px;">
		      		<div class="col-sm-6 left">
		      			<form action="" method="post">
		      			<select name="searchselect" class="btn btn-primary">
		      				<option value="book_title">도서명</option>
		      				<option value="book_writer">저자</option>
		      				<option value="book_publisher">출판사</option>
		      			</select>
		      			<input name="searchValue" type="text">
		      			<button class="btn btn-default">검색</button>
		      			</form>
		      		</div>
		      	</div>

<% 
if(s_level==null||s_level.equals("일반회원")){
%>
<!-- --------------------------회원 화면 시작 -------------------------- -->

		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>일련번호</th>
		        <th>장르</th>
		        <th>도서명</th>
		        <th>저자</th>
		        <th>출판사</th>
		        <th>도서상태</th>
		        <th>대여하기</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% 
		    	//for문으로 반복하여 b에 alb를 할당한다.
				//for(Book b : alb){
				for(int i=0; i<alb.size();i++){	
			   	Book b = alb.get(i);
			   	String b_genreK = bg.get(i);
			   	System.out.println(b+"<<--b");
			   	String b_code=b.getBook_code();
			   	int b_genre = b.getBook_genre();
			   	String b_title = b.getBook_title();
			   	String b_writer = b.getBook_writer();
			   	String b_publisher = b.getBook_publisher();
			   	String b_state =b.getBook_state();
			   	//일반회원은 손상된 도서는 볼 수 없다.
			   	if(b_state.equals("손상")){
			   		continue;
			   	}
			   %>
			   
			   <tr>
			   <td><%=b_code %></td>
			   <td><%=b_genre %>/<%=b_genreK%></td>
			   <td><%=b_title %></td>
			   <td><%=b_writer %></td>
			   <td><%=b_publisher %></td>
			   <td><%=b_state %></td>
			   
			   <%
			   //대여중이 아니면 대여신청버튼이 뜨도록
			   if(b_state.equals("정상")){
				   if(s_level==null){
					   //로그인중이 아니라면, 로그인을 먼저 하도록 한다.
					   %>
					   <td><a href="library.dokmin.form.login"><button>대여신청하기</button></a></td>
					   <%  
				   }else if(s_level.equals("일반회원")){
					   //로그인중이라면 대여신청할수있도록 함
					   %>
					   <td><a href=""><button>대여신청하기</button></a></td>
					   <% 
				   }
			   }else if(b_state.equals("대여중")){
				//대여중이면 대여불가라고 뜨도록 한다   
				%>
				<td>대여불가</td>				
				<%} %>
			   
			   </tr>
			<%
		   } 
		    %>
		    
		    </tbody>
		</table>
	</div>
<!-- --------------------------회원 화면 끝-------------------------- -->
<%
}else if(s_level.equals("관리자")){
%>
<!-- --------------------------관리자 화면 시작 -------------------------- -->


		
		<table class="table table-hover">
		    <thead>
		      <tr>
		        <th>일련번호</th>
		        <th>장르</th>
		        <th>도서명</th>
		        <th>저자</th>
		        <th>출판사</th>
		        <th>도서상태</th>
		        <th>상세정보/수정</th>
		        <th>삭제</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<% 
		    	//for문으로 반복하여 b에 alb를 할당한다.
				//for(Book b : alb){
				for(int i=0; i<alb.size();i++){	
			   	Book b = alb.get(i);
			   	String b_genreK = bg.get(i);
			   	System.out.println(b+"<<--b");
			   	String b_code=b.getBook_code();
			   	int b_genre = b.getBook_genre();
			   	String b_title = b.getBook_title();
			   	String b_writer = b.getBook_writer();
			   	String b_publisher = b.getBook_publisher();
			   	String b_state =b.getBook_state();
			   	
			   %>
			   
			   <tr>
			   <td><%=b_code %></td>
			   <td><%=b_genre %>/<%=b_genreK%></td>
			   <td><%=b_title %></td>
			   <td><%=b_writer %></td>
			   <td><%=b_publisher %></td>
			   <td><%=b_state %></td>
			   <td><a href="library.dokmin.modify.book?b_code=<%=b_code%>"><button>상세보기</button></a></td>
			   <td><a href="library.dokmin.delete.book?b_code=<%=b_code%>"><button>삭제하기</button></a></td>
			   </tr>
			<%
		   } 
}
		    %>
		    
		    </tbody>
		</table>
	</div>
<!-- --------------------------관리자 화면 끝 -------------------------- -->




</body>
</html>