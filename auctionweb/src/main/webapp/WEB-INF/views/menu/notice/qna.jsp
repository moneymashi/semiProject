<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#writeBtn").click(function() {
			$(location).attr("href", "${path}/notice/insert.do");
			alert(session);
		});
	});

	// 페이징 처리후 매 페이지 선택할 때마다 값을 떠넘김
	function list(page) {
		$(location).attr("href", "${path}/notice/list.do?curPage=" + page);
	}
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="col-sm-3">
		<jsp:include page="noticeNav.jsp" flush="false" />
	</div>
	<div class="col-sm-9">
		<form action="${path }/mail/mailSending.do" method="post">
			<div class="form-group">
				<label for="tomail">받는사람:</label> 
				<input type="hidden" name="tomail" value="llighter.aco@gmail.com">
				<input type="text" class="form-control" name="tomail" id="tomail"
					value="옥션 서비스센터" disabled="disabled">
			</div>
			<div class="form-group">
				<label for="title">제목:</label> 
				<input type="text" class="form-control" name="title" id="title"
					placeholder="무엇에 대한 문의 입니까?">
			</div>
			<p>
			<div class="form-group">
				<label for="title">내용:</label>
				<textarea name="content" cols="120" rows="12"
					style="resize: none" placeholder="문의할 내용을 상세하게 작성해주세요."
					class="form-control"></textarea>
			</div>
			<p>
			<div align="center">
				<input type="submit" value="SEND" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>