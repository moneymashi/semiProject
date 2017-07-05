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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuHome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<style type="text/css">
.box {
	display: inline-block;
	width: 100%;
	margin: 1em;
}
</style>
</head>
<body>
	<div>
		<c:import url="../main/header.jsp" />
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="box">
		<!-- 공지사항 게시판위치 -->
		<c:if test="${pageName == 'notice/notice' }">
			<c:import url="notice/notice.jsp" />
		</c:if>
		<c:if test="${pageName == 'notice/qna' }">
			<c:import url="notice/qna.jsp" />
		</c:if>

		<!-- myPage메뉴 입찰정보/쪽지함/낙찰배송/주소지/신용카드/회원정보 순서-->
		<c:if test="${pageName == 'myPage/auctionInfo' }">
			<c:import url="myPage/auctionInfo.jsp" />
		</c:if>
		<c:if test="${pageName == 'myPage/message' }">
			<c:import url="myPage/message.jsp" />
		</c:if>
		<c:if test="${pageName == 'myPage/delivery' }">
			<c:import url="myPage/delivery.jsp" />
		</c:if>
		<c:if test="${pageName == 'myPage/locationInfo'}">
			<c:import url="myPage/locationInfo.jsp" />
		</c:if>
		<c:if test="${pageName == 'myPage/userPayment' }">
			<c:import url="myPage/userPayment.jsp" />
		</c:if>
		<c:if test="${pageName == 'myPage/userInfo' }">
			<c:import url="myPage/userInfo.jsp" />
		</c:if>

		<!-- 판매자(물품등록/계좌등록/판매중인물품-판매중,낙찰,유찰)-->
		<c:if test="${pageName == 'auctioneerPage/auctioneerInfo' }">
			<c:import url="auctioneerPage/auctioneerInfo.jsp" />
		</c:if>
		<c:if test="${pageName == 'auctioneerPage/itemInsert' }">
			<c:import url="auctioneerPage/itemInsert.jsp" />
		</c:if>
		<c:if test="${pageName == 'auctioneerPage/saleInfo' }">
			<c:import url="auctioneerPage/saleInfo.jsp" />
		</c:if>
	</div>

	<div>
		<c:import url="../main/footer.jsp" />
	</div>
</body>
</html>