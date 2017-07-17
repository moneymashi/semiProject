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
<style type="text/css">
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }
</style>
<body>
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
	                	<div class="col-sm-12">
							<div class="form-group label-floating">
								<label class="control-label">E-mail</label>
								<input type="email" class="form-control" name="email"  id="email">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group label-floating">
								<label class="control-label">Password</label>
								<input type="password" class="form-control" name="password"  id="password">
							</div>
						</div>
	                    <div>
	                        <button type="button" class="form-control btn btn-primary btn-round" id="loginBtn" >로그인</button>
	                    </div>
	                </form>
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