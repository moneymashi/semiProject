<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userInfo</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uptBtn").click(function(){
/* 			var password = $("#password").val();
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			} */
			$("form").attr("action", "${path }/myPage/locUpdate.do");
			alert("회원정보수정");
			$("form").submit();
		});
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form>
	<div>
	<input type="hidden" name="user_id" value="${userInfo.user_id }"/>
		<div>이름 : <input id="real_name" type="text" name="real_name" value="${userInfo.real_name }"></div>
		<div>주소(API가능?)<input id="address" type="text" name="address" value="${userInfo.address }"></div>
		<div>우편번호(API가능?) : <input id="zip_code" type="text" name="zip_code" value="${userInfo.zip_code }"></div>
		<div>전화번호<input id="phone_number" type="text" name="phone_number" value="${userInfo.phone_number }"></div>
		<!-- TODO 비밀번호 검사 -->
		<!-- <div>현재 비밀번호(필수)<input type="password" name="password" id="password" value=""></div> -->
		<button type="button" id="uptBtn">주소 수정</button>
	</div>
	</form>
</body>
</html>