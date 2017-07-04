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
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style> -->
</head>
<body>
	<div>
		<c:import url="../main/header.jsp" />
	</div>
	<br/>
	<br/>
	<br/>
	<h1>MenuHome(필요없는 페이지... 삭제 고민중.)</h1>
	<div>
		<!-- TODO 공지 문의 게시판 주소 -->
		<a href="${path }/notice/notice.do">공지/문의</a>
	</div>
	<div>
		<a href="${path }/myPage/auctionInfo.do">MY PGAE</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	</div>
	<!-- TODO 공지 문의 게시판 주소 -->
	<div>
		<a href="${path }/TODO.do">판매자페이지</a>
		<!-- TODO 입찰중인 상품 갯수 -->
	</div>
</body>
</html>