<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delivery</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	<br>
	<form>
	<%--<input type="hidden" name="userId" value="${mem.userId }" /> --%>
		<div>
			<h1>현재 이 페이지에 대한 조 내 결정사항 없음.(없는 페이지)</h1>
		</div>
	</form>
</body>
</html>