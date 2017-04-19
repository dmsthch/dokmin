<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
.container{text-align: center; }
.container h1{margin: 30px;}


</style>
</head>
<body>
<%
String S_id = (String)session.getAttribute("S_id");
String S_name = (String)session.getAttribute("S_name");
String S_level = (String)session.getAttribute("S_level");


if (S_level==null){
%>
<!--  -------------------------------------로그인 전 화면 시작---------------------------------  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">도서 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">도서리스트</a></li>
        </ul>
      </li>

    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="library.dokmin.signupform.member"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="library.dokmin.form.login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<!--  -------------------------------------로그인 전 화면 끝---------------------------------  -->
<%
	
}else if(S_level.equals("일반회원")){
%>
<!--  -------------------------------------일반회원 화면 시작---------------------------------  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">도서 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">도서리스트</a></li>
          <li><a href="library.dokmin.hope.book">희망도서 신청</a></li>
        </ul>
      </li>
      
 
    </ul>
    <ul class="nav navbar-nav navbar-right">
   	 <li><a><%=S_name%>님, '<%=S_level %>'권한으로 로그인중 </a></li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">내정보 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.modifyform.member?send_id=<%=S_id%>">내정보수정</a></li>
          <li><a href="library.dokmin.myrentallistform.member?send_id=<%=S_id%>">나의 대여리스트</a></li>
          <li><a href="library.dokmin.myhopelist.member?send_id=<%=S_id%>">나의  희망 도서 리스트</a></li>
        </ul>
      </li>
      <li><a href="library.dokmin.logout.login"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<!--  -------------------------------------일반회원 화면 끝---------------------------------  -->
<% 	
}else if(S_level.equals("관리자")){
%>
<!--  -------------------------------------관리자 화면 시작---------------------------------  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">도서관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">도서리스트</a></li>
          <li><a href="library.dokmin.insert.book">도서추가</a></li>
          <li><a href="library.dokmin.hope.book">희망도서 신청</a></li>
          <li><a href="library.dokmin.hopelist.book">희망도서 신청리스트</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.member">회원리스트</a></li>
          <li><a href="library.dokmin.blacklist.member">블랙리스트</a></li>
          <li><a href="library.dokmin.signupform.member">회원추가</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">대여관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.applystart.rental">대여신청</a></li>
          <li><a href="library.dokmin.list.rental">대여리스트</a></li>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
   	 <li><a><%=S_name%>님, '<%=S_level %>'권한으로 로그인중 </a></li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">내정보 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.modifyform.member?send_id=<%=S_id%>">내정보수정</a></li>
        </ul>
      </li>
      <li><a href="library.dokmin.logout.login"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

<%
}
%>


<%-- 백업용

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">도서관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">도서리스트</a></li>
          <li><a href="library.dokmin.insert.book">도서추가</a></li>
          <li><a href="library.dokmin.hope.book">희망도서 신청</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.member">회원리스트</a></li>
          <li><a href="library.dokmin.blacklist.member">블랙리스트</a></li>
          <li><a href="library.dokmin.signupform.member">회원추가</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">대여관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.applystart.rental">대여신청</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 한글</a></li>
      <li><a href="library.dokmin.form.login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
 --%>