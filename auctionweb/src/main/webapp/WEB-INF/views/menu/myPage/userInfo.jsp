<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuHome</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uptBtn").click(function(){
			var userName = $("#userName").val();
			var password = $("#password").val();
			if(userName == ""){
				alert("닉네임을 입력하세요");
				$("#userName").focus();
				return;
			}
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			$("form").attr("action", "${path }/myPage/update.do");
			alert("회원정보수정");
			$("form").submit();
		});
		$("#delBtn").click(function(){
			$("form").attr("action", "${path}/myPage/delete.do");
			$("form").submit();
		});
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<c:import url="../main/header.jsp" />
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<div>
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	<br>
	<form>
	<input type="hidden" name="user_id" value="${userInfo.user_id }"/>
	<div>
		<div>이메일(변경불가) : ${userInfo.email }</div>
		<div>login user_id: ${mem.user_id }</div>
		<div>info user_id : ${info.user_id }</div>
		<div>userInfo user_id : ${userInfo.user_id }</div>
		<!-- TODO 사진 불러오기~ -->
		<div>사진 :<input id="picture_location" type="text" name="picture_location"  value="${userInfo.picture_location }"></div>
		<div>전화번호 :<input id="phone_number" type="text" name="phone_number"  value="${userInfo.phone_number }"></div>
		<div>닉네임 :<input id="user_name" type="text" name="user_name"  value="${userInfo.user_name }"></div>
		<!-- TODO 비밀번호 검사 -->
		<!-- <div>현재 비밀번호(필수)<input type="password" name="password" id="password" value=""></div>
		 -->
		<!-- TODO 변경할 비밀번호 중복검사 -->
		<div>변경할 비밀번호 :<input id="password" type="password" name="password"  value="${userInfo.password }"></div>
		
		<div>포인트 : ${userInfo.user_point }</div>
<!-- 		<div>인증번호 : 미구현</div>
		<div>인증번호받기(인증번호 생성)</div> -->
		
		<button type="button" id="uptBtn">수정</button>
		<button type="button" id="delBtn">회원탈퇴</button>
	</div>
	</form>
</body>
</html>