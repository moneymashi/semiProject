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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<div>
		<div class="col-sm-3">
			<jsp:include page="myPageNav.jsp" flush="false" />
		</div>
		<div class="col-sm-9">
			<form>
				<input type="hidden" name="user_id" value="${userInfo.user_id }"/>
				<div class="form-group">
			      <label for="usr">이메일:</label>
			      <input type="text" class="form-control" id="usr" value="${userInfo.email }" disabled>
			    </div>
			    <div class="form-group">
			      <label for="password">변경할 비밀번호:</label>
			      <input type="password" class="form-control" name="password" id="password" value="${userInfo.password }">
			    </div>
			    <div class="form-group">
			      <label for="picture_location">프로필 사진:</label>
			      <input type="text" class="form-control" name="picture_location" id="picture_location" value="${userInfo.picture_location }">
			    </div>
			    <div class="form-group">
			      <label for="phone_number">전화번호:</label>
			      <input type="text" class="form-control" name="phone_number" id="phone_number" value="${userInfo.phone_number }">
			    </div>
			    <div class="form-group">
			      <label for="user_name">닉네임:</label>
			      <input type="text" class="form-control" name="user_name" id="user_name" value="${userInfo.user_name }">
			    </div>
			    <div class="form-group">
			      <label for="point">포인트:</label>
			      <input type="text" class="form-control" id="point" value="${userInfo.user_point }" >
			    </div>
			    <button type="button" id="uptBtn" class="btn btn-primary">수정</button>
				<button type="button" id="delBtn" class="btn btn-danger">회원탈퇴</button>
				<%-- <div>
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
				</div> --%>
			</form>
		</div>
	</div>
</body>
</html>