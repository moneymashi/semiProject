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
<title>auctioneerPageNav</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<h1>판매자페이지 네비</h1>
	<div>
		<a href="${path }/auctioneerPage/auctioneerInfo.do">판매자정보</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	</div>
	<div>
		<a href="${path }/auctioneerPage/saleRege.do">판매등록</a>
	</div>
	<div>
		<a href="${path }/auctioneerPage/saleInfo.do">경매정보</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	</div>
</body>
</html>