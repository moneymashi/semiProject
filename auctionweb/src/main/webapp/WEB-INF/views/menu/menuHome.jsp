<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuHome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<c:import url="../main/header.jsp" />
	</div>
	<br />
	<br />
	<br />
	<h1>MenuHome</h1>
	<div class="col-sm-2" role="group" aria-label="...">
		<ul class="list-group">
			<li class="list-group-item">
				<a href="${path }/notice/list.do">공지/문의</a>
			</li>
			<li class="list-group-item">
				<a href="${path }/myPage/auctionInfo.do">MY	PGAE</a>
			</li>
			<li class="list-group-item">
				<a href="${path }/auctioneerPage/auctioneerInfo.do">판매자페이지</a>
			</li>
		</ul>
	</div>
	<div class="col-sm-7">
		<img
			src="https://www.askideas.com/media/13/Welcome-Colorful-Clipart.png"
			width="100%">
	</div>
	<div class="col-sm-3"></div>
</body>
</html>