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
<c:import url="../structure/head.jsp" />
<body class="signup-page">
	<c:import url="../structure/header.jsp" />
	<div class="wrapper">
		<div class="header header-filter" style="background-image: url('/auction/resources/img/Auctioneer.jpg'); background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">
							<form id="login-form" method="post">
								<div class="header header-primary text-center">
									<h4>로그인</h4>
									<div class="social-line">
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-facebook-square"></i>
										</a>
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-twitter"></i>
										</a>
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-google-plus"></i>
										</a>
									</div>
								</div>
								<c:if test="${msg=='failure' }">
									<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
								</c:if>
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">email</i>
										</span>
										<input type="email" class="form-control" placeholder="Email..." name="email"  id="email" />
									</div>

									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">lock_outline</i>
										</span>
										<input type="password" placeholder="Password..." class="form-control" name="password"  id="password"/>
									</div>
								</div>
								<div class="footer text-center">
									<a href="#" class="btn btn-simple btn-primary btn-lg" id="loginBtn">Get Started</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

    </div>
</body>
<c:import url="../structure/tail.jsp" />
<script type="text/javascript">
/* TODO 인증번호 만들고 작업..  */
	$(document).ready(function(){
		$("#loginBtn").click(function(){
			$("form").attr("action", "${path}/login/loginCheck.do");
			$("form").submit();
		});
	});
</script>

</html>