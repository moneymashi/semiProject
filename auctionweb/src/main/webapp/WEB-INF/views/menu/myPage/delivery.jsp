<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delivery</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div class="col-sm-3">
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	
	<div class="col-sm-9">
		<form>
		<%--<input type="hidden" name="userId" value="${mem.userId }" /> --%>
			<div>
				<img src="http://mokpo.mof.go.kr/images/contents/nopage.gif">
			</div>
		</form>
	</div>
</body>
</html>