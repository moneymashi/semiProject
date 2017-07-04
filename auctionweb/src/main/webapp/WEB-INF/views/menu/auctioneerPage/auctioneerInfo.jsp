<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userPayment</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uptBtn").click(function() {
			if ('<c:out value="${mem.auth }"/>' == 1) {
				$("form").attr("action", "${path }/auctioneerPage/auctioneerInsert.do");
				alert("판매자 등록을 진행합니다..");
				$("form").submit();
			} else {
				$("form").attr("action", "${path }/auctioneerPage/auctioneerUpdate.do");
				alert("판매자 정보를 수정했습니다.");
				$("form").submit();
			}
		});
		$(function() {
			if ('<c:out value="${mem.auth }"/>' == 1) {
				$("#uptBtn").text("판매자 등록");
			} else {
				$("#uptBtn").text("판매정보 수정");
			}
		});
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<jsp:include page="auctioneerPageNav.jsp" flush="false" />
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form>
		<input type="hidden" name="user_id" value="${mem.user_id }" />
		<div>
			<span>auctioneer_id:${acnrInfo.user_id } //
				session_id:${mem.user_id }</span>
		</div>
		<c:set var="auctioneeridserver" value="${acnrInfo.user_id }" />
		<div>
			<div>
				 AUCTIONEER_ID : <input type="text" name="auctioneer_id" id="auctioneer_id"
					value="${acnrInfo.auctioneer_id }">
			</div>
			<div>
				 AUCTIONEER_LEVEL : <input type="text" name="auctioneer_level" id="auctioneer_level"
					value="${acnrInfo.auctioneer_level }">
			</div>
			<div>
				SATISFACTION : <input type="text" name="satisfaction" id="satisfaction"
					value="${acnrInfo.satisfaction }">
			</div>
			<div>
				BANK_NAME : <input type="text" name="bank_name" id="bank_name"
					value="${acnrInfo.bank_name }">
			</div>
			<div>
				ACCOUNT_NAME : <input type="text" name="account_name" id="account_name"
					value="${acnrInfo.account_name }">
			</div>
			<div>
				ACCOUNT_NUMBER : <input type="text" name="account_number" id="account_number"
					value="${acnrInfo.account_number }">
			</div>

			<!-- TODO 비밀번호 넣나? -->

			<button type="button" id="uptBtn">경매자정보(기본)</button>
		</div>
	</form>
</body>
</html>