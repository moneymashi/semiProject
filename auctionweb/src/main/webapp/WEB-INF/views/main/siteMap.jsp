<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%request.setCharacterEncoding("UTF-8"); 
  String path=request.getContextPath();	
%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// Adds active state to secion navigation
		$('.nav li').click(function(e) {
		  e.preventDefault();
		  $('.nav li').removeClass('active');
		  $(this).addClass('active');
		});
	});
</script>
<style type="text/css">

section {
  border-bottom: 1px solid #ccc;
  margin-top: 1em;
}

section .col-md-3 {
  border-left: 1px solid #ccc;
}

section .col-md-3:first-child {
  border: none;
}

</style>
</head>
<body>


<!-- 출처: w3school -siteMap. 
	//README: 링크만 걸어주면 될거같아 작업을 딱히 하지않았음.
	뭘 걸어줘야할지는 의논해야할듯.
 -->
<div class="container">
  <h1>siteMap</h1>

  <ul class="nav nav-pills">
    <li role="presentation"><a rel="nofollow" rel="noreferrer"href="#sec1">Section 1</a></li>
    <li role="presentation"><a rel="nofollow" rel="noreferrer"href="#sec2">Section 2</a></li>
    <li role="presentation"><a rel="nofollow" rel="noreferrer"href="#sec3">Section 3</a></li>
    <li role="presentation"><a rel="nofollow" rel="noreferrer"href="#sec4">Section 4</a></li>
  </ul>

  <section id="sec1">

    <h2>Section 1</h2>
    <div class="row">
      <div class="col-md-3">
        <ul>
          <li><a rel="nofollow" rel="noreferrer"href="#">Home</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">About</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Clients</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Contact Us</a></li>
        </ul>
      </div>
      <div class="col-md-3">
        <ul>
          <li><a rel="nofollow" rel="noreferrer"href="#">Home</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">About</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Clients</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Contact Us</a></li>
        </ul>
      </div>
    </div>
  </section>
  <section id="sec2">

    <h2>Section 2</h2>
    <div class="row">
      <div class="col-md-3">
        <ul>
          <li><a rel="nofollow" rel="noreferrer"href="#">Home</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">About</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Clients</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Contact Us</a></li>
        </ul>
      </div>
      <div class="col-md-3">
        <ul>
          <li><a rel="nofollow" rel="noreferrer"href="#">Home</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">About</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Clients</a></li>
          <li><a rel="nofollow" rel="noreferrer"href="#">Contact Us</a></li>
        </ul>
      </div>
      <div class="col-md-3">
        <ul>
          <li><a rel="nofollow" rel="noreferrer"href="#">Home</a></li>

        </ul>
      </div>
      <div class="col-md-3">
        <ul>

        </ul>
      </div>
    </div>
  </section>
  <section id="sec3"></section>

</div>
<!-- /container -->

</body>
</html>