<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="UTF-8"/> 
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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#uptBtn").click(function(){
			var name = $("#user_name").val();
			var pwd = $("#user_password").val();
			if(name == ""){
				alert("이름을 입력하세요");
				$(this).focus();
				return;
			}
			if(pwd == ""){
				alert("비밀번호를 입력하세요.");
				$(this).focus();
				return;
			}
			$("form").attr("action", "${path}/member/update.do");
			$("form").submit();
		});
		$("#delBtn").click(function(){
			$("form").attr("action", "${path}/member/delete.do");
			$("form").submit();
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<br>
	<br>
	<form>
		<input type="hidden" name="email" value="${mem.email }"/>
		<div class="container-fluid well span1, container">
			<div class="row-fluid">
				<div class="span2">
					<img
						src="https://secure.gravatar.com/avatar/de9b11d0f9c0569ba917393ed5e5b3ab?s=140&r=g&d=mm"
						class="img-circle">
				</div>
				<div class="span8">
					<h3>User ID: ${mem.email }</h3>
					<h3>Register Date: ${mem.register_date }</h3>
					<h6>Password: <input type="text" class="form-control" name="password" id="password" type="password" size="10"></h6>
					<h6>Name: <input type="text" class="form-control" name="user_name" id="user_name" value="${mem.user_name }" size="10"></h6>
					<button type="button" class="form-control btn btn-primary" id="uptBtn">수정</button>
					<button type="button" class="form-control btn btn-primary" id="delBtn">삭제</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>