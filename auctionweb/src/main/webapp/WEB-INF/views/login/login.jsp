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
<title>LoginLogin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* TODO 인증번호 만들고 작업..  */
	$(document).ready(function(){
		$("#loginBtn").click(function(){
			
/*	의미 없음 삭제...
			var email = $("#email").val();
			var password = $("#password").val();
			if(email == ""){
				alert("E-mail을 입력하세요//작동할때 CSS작동");
				$("#errorMsg").html("E-mail을 입력하세요");
				$("#email").focus();
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				$("#errorMsg").html("비밀번호를 입력하세요.//작동할때 CSS작동");
				alert("E-mail을 입력하세요//작동할때 CSS작동");
				$("#password").focus();
				return;
			} */
			$("form").attr("action", "${path}/login/loginCheck.do");
			$("form").submit();
		});
	});
</script>
<style type="text/css">
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }
</style>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<div class="container">
	    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
	        <div class="panel panel-success">
	            <div class="panel-heading">
	                <div class="panel-title">로그인하세요!</div>
	                <c:if test="${msg=='failure' }">
						<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
	            </div>
	            <!-- 로그인 중 얼럿창뜰때 css 작동해야됨 -->
	            <div class="panel-body">
	                <form id="login-form" method="post">
	                    <div>
	                        <input type="text" class="form-control" name="email"  id="email" placeholder="E-mail" autofocus>
	                    </div>
	                    <div>
	                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
	                    </div>
	                    <div>
	                        <button type="button" class="form-control btn btn-primary" id="loginBtn" >로그인</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>