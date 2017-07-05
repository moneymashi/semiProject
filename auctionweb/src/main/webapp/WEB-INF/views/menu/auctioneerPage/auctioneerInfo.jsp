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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uptBtn").click(function() {
			if ('<c:out value="${sessionScope.mem.auth }"/>' == 1) {
				$("form").attr("action", "${path }/auctioneerPage/auctioneerInsert.do");
				alert("판매자 등록을 진행합니다..");
				$("form").submit();
			} else {
				$("form").attr("action","${path }/auctioneerPage/auctioneerUpdate.do");
				alert("판매자 정보를 수정했습니다.");
				$("form").submit();
			}
		});
		$(function() {
			if ('<c:out value="${sessionScope.mem.auth }"/>' == 1) { $("#uptBtn").text("판매자 등록");
			} else {
				$("#uptBtn").text("판매정보 수정");
			}
		});
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div class="col-sm-3">
		<jsp:include page="auctioneerPageNav.jsp" flush="false" />
	</div>
	<div class="col-sm-9">
		<h1><c:out value="${sessionScope.mem.auth }"/></h1>
		<form>
			<%-- <input type="hidden" name="user_id" value="${mem.user_id }" /> --%>
			<input type="hidden" name="auctioneer_id" value="${mem.user_id }">
			<div class="form-group">
		      <label for="auctioneer_id">AUCTIONEER_ID:</label>
		      <input type="text" class="form-control" id="auctioneer_id" value="${acnrInfo.auctioneer_id }" disabled>
		    </div>
		    <div class="form-group">
		      <label for="auctioneer_level">AUCTIONEER_LEVEL:</label>
		      <input type="text" class="form-control" id="auctioneer_level" value="${acnrInfo.auctioneer_level }" disabled>
		    </div>
		    <div class="form-group">
		      <label for="satisfaction">SATISFACTION:</label>
		      <input type="text" class="form-control" id="satisfaction" value="${acnrInfo.satisfaction }" disabled>
		    </div>
		    <div class="form-group">
		      <label for="bank_name">BANK_NAME:</label>
		      <input type="text" class="form-control" name="bank_name" id="bank_name" value="${acnrInfo.bank_name }">
		    </div>
		    <div class="form-group">
		      <label for="account_name">ACCOUNT_NAME:</label>
		      <input type="text" class="form-control" name="account_name" id="account_name" value="${acnrInfo.account_name }">
		    </div>
		    <div class="form-group">
		      <label for="account_number">ACCOUNT_NUMBER:</label>
		      <input type="text" class="form-control" id="account_number" name="account_number" value="${acnrInfo.account_number }">
		    </div>
			<button type="button" id="uptBtn" class="btn btn-primary">경매자정보(기본)</button>
			
			<%-- <div>
				<span>auctioneer_id:${acnrInfo.auctioneer_id } //
						sessionScope_id:${sessionScope.mem.user_id } //
					  session_id:${mem.user_id }</span>
				<div>AUCTIONEER_ID : ${acnrInfo.auctioneer_id }</div>
					<c:set var="memAuth" value="${mem.auth }" />
				<div>
					AUCTIONEER_LEVEL : ${acnrInfo.auctioneer_level }
				</div>
				<div>
					SATISFACTION : ${acnrInfo.satisfaction }
				</div>
				<div>
					BANK_NAME : <input type="text" name="bank_name" id="bank_name"
						value="${acnrInfo.bank_name }">
				</div>
				<div>
					ACCOUNT_NAME : <input type="text" name="account_name"
						id="account_name" value="${acnrInfo.account_name }">
				</div>
				<div>
					ACCOUNT_NUMBER : <input type="text" name="account_number"
						id="account_number" value="${acnrInfo.account_number }">
				</div>
	
				<!-- TODO 비밀번호 넣나? -->
	
				<button type="button" id="uptBtn">경매자정보(기본)</button>
			</div> --%>
		</form>
	</div>
</body>
</html>