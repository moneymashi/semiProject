<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<div class="col-sm-3">
	<jsp:include page="myPageNav.jsp" flush="false" />
</div>
<div class="col-sm-7">
	<form>
		<input type="hidden" name="user_id" value="${userInfo.user_id }" />
		<div class="form-group">
			<label for="usr">이메일:</label> <input type="text"
				class="form-control" id="usr" value="${userInfo.email }" disabled>
		</div>
		<div class="form-group">
			<label for="password">변경할 비밀번호:</label> <input type="password"
				class="form-control" name="password" id="password"
				value="${userInfo.password }">
		</div>
		<div class="form-group">
			<label for="picture_location">프로필 사진:</label> <input type="text"
				class="form-control" name="picture_location" id="picture_location"
				value="${userInfo.picture_location }">
		</div>
		<div class="form-group">
			<label for="phone_number">전화번호:</label> <input type="text"
				class="form-control" name="phone_number" id="phone_number"
				value="${userInfo.phone_number }">
		</div>
		<div class="form-group">
			<label for="user_name">닉네임:</label> <input type="text"
				class="form-control" name="user_name" id="user_name"
				value="${userInfo.user_name }">
		</div>
		<div class="form-group">
			<label for="point">포인트:</label> <input type="text"
				class="form-control" id="point" value="${userInfo.user_point }">
		</div>
		<button type="button" id="uptBtn" class="btn btn-primary">수정</button>
		<button type="button" id="delBtn" class="btn btn-danger">회원탈퇴</button>
	</form>
</div>
<div class="col-sm-2"></div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uptBtn").click(function() {
			var userName = $("#userName").val();
			var password = $("#password").val();
			if (userName == "") {
				alert("닉네임을 입력하세요");
				$("#userName").focus();
				return;
			}
			if (password == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			$("form").attr("action", "${path }/myPage/update.do");
			alert("회원정보수정");
			$("form").submit();
		});
		$("#delBtn").click(function() {
			$("form").attr("action", "${path}/myPage/delete.do");
			$("form").submit();
		});
	});
</script>