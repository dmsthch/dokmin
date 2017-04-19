<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인화면</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.container{text-align: center; }
.container h1{margin: 30px;}
.container button{height :300px; width: 250px; border-radius: 30px; margin:15px; font-size:30px;}

</style>
<%@include file="/nav.jsp"%>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;

  }
</style>
<body>


<div class="container">

	<h1><img src="./image/dmbanner.png" style="width: 300px"></h1>
	
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 100%; ">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" >
      <div class="item active">
        <img src="./image/main_img02.jpg" alt="Chania"  height="345">
      </div>

      <div class="item">
        <img src="./image/main_img03.jpg" alt="Chania"  height="345">
      </div>
    
      <div class="item">
        <img src="./image/main_img04.jpg" alt="Flower"  height="345">
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>



  
	<!-- <a href="./Bk/Bk_li.html"><button type="button" class="btn btn-info">도서관리</button></a>
	<a href="./Mb/Mb_li.html"><button type="button" class="btn btn-info">회원관리</button></a>
	<a href="./Rt/Rt_li.html"><button type="button" class="btn btn-info">대여관리</button></a> -->
</div>
</body>
</html>