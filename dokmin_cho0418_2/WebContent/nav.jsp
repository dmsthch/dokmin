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
<!--  -------------------------------------�α��� �� ȭ�� ����---------------------------------  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">���� <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">��������Ʈ</a></li>
        </ul>
      </li>

    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="library.dokmin.signupform.member"><span class="glyphicon glyphicon-user"></span> ȸ������</a></li>
      <li><a href="library.dokmin.form.login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<!--  -------------------------------------�α��� �� ȭ�� ��---------------------------------  -->
<%
	
}else if(S_level.equals("�Ϲ�ȸ��")){
%>
<!--  -------------------------------------�Ϲ�ȸ�� ȭ�� ����---------------------------------  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">���� <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">��������Ʈ</a></li>
          <li><a href="library.dokmin.hope.book">������� ��û</a></li>
        </ul>
      </li>
      
 
    </ul>
    <ul class="nav navbar-nav navbar-right">
   	 <li><a><%=S_name%>��, '<%=S_level %>'�������� �α����� </a></li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">������ <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.modifyform.member?send_id=<%=S_id%>">����������</a></li>
          <li><a href="library.dokmin.myrentallistform.member?send_id=<%=S_id%>">���� �뿩����Ʈ</a></li>
          <li><a href="library.dokmin.myhopelist.member?send_id=<%=S_id%>">����  ��� ���� ����Ʈ</a></li>
        </ul>
      </li>
      <li><a href="library.dokmin.logout.login"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<!--  -------------------------------------�Ϲ�ȸ�� ȭ�� ��---------------------------------  -->
<% 	
}else if(S_level.equals("������")){
%>
<!--  -------------------------------------������ ȭ�� ����---------------------------------  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">�������� <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">��������Ʈ</a></li>
          <li><a href="library.dokmin.insert.book">�����߰�</a></li>
          <li><a href="library.dokmin.hope.book">������� ��û</a></li>
          <li><a href="library.dokmin.hopelist.book">������� ��û����Ʈ</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ȸ������ <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.member">ȸ������Ʈ</a></li>
          <li><a href="library.dokmin.blacklist.member">������Ʈ</a></li>
          <li><a href="library.dokmin.signupform.member">ȸ���߰�</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">�뿩���� <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.applystart.rental">�뿩��û</a></li>
          <li><a href="library.dokmin.list.rental">�뿩����Ʈ</a></li>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
   	 <li><a><%=S_name%>��, '<%=S_level %>'�������� �α����� </a></li>
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">������ <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.modifyform.member?send_id=<%=S_id%>">����������</a></li>
        </ul>
      </li>
      <li><a href="library.dokmin.logout.login"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

<%
}
%>


<%-- �����

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp"><img src="<%=request.getContextPath()%>/image/dmbanner.png" style="width: 130px"></a>
    </div>
    <ul class="nav navbar-nav">
            
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">�������� <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.book">��������Ʈ</a></li>
          <li><a href="library.dokmin.insert.book">�����߰�</a></li>
          <li><a href="library.dokmin.hope.book">������� ��û</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ȸ������ <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.list.member">ȸ������Ʈ</a></li>
          <li><a href="library.dokmin.blacklist.member">������Ʈ</a></li>
          <li><a href="library.dokmin.signupform.member">ȸ���߰�</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">�뿩���� <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="library.dokmin.applystart.rental">�뿩��û</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> �ѱ�</a></li>
      <li><a href="library.dokmin.form.login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
 --%>