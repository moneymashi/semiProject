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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<c:if test="${mem.auth == 1}">
		<div>판매자 등록하고 집문서 까지 팔아보자~!</div>
	</c:if>
	<c:if test="${mem.auth != 1}">
		<ul class="list-group">
		  <li class="list-group-item">
		  	<a href="${path }/auctioneerPage/auctioneerInfo.do">판매자정보</a>
			<!-- TODO 입찰중인 상품 갯수 -->
		  </li>
		  <li class="list-group-item">
		  	<a href="${path }/auctioneerPage/itemInsert.do">판매등록</a>
		  </li>
		  <li class="list-group-item">
		  	<a href="${path }/auctioneerPage/saleInfo.do">경매정보</a>
		  </li>
		</ul>
		
		<%-- <div>
			<a href="${path }/auctioneerPage/auctioneerInfo.do">판매자정보</a>
			<!-- TODO 입찰중인 상품 갯수 -->
		</div>
		<div>
			<a href="${path }/auctioneerPage/itemInsert.do">판매등록</a>
		</div>
		<div>
			<a href="${path }/auctioneerPage/saleInfo.do">경매정보</a>
			<!-- TODO 입찰중인 상품 갯수 -->
		</div> --%>
	</c:if>
	
</body>
</html>