<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="col-sm-3">
	<jsp:include page="myPageNav.jsp" flush="false" />
</div>
<div class="col-sm-7">
	<form>
		<input type="hidden" name="user_id" value="${mem.user_id }" />
		<div class="form-group">
		      <label for="payInfo_id">payInfo_id:</label>
		      <input type="text" class="form-control" id="payInfo_id" value="${payInfo.user_id}" disabled>
		</div>
		<div class="form-group">
		      <label for="session_id">session_id:</label>
		      <input type="text" class="form-control" id="session_id" value="${mem.user_id }" disabled>
		</div>
		<c:set var="payidserver" value="${payInfo.user_id }" />
		<div class="form-group">
		      <label for="session_id">카드회사:</label>
		      <input type="text" class="form-control" name="card_company" id="card_company" value="${payInfo.card_company }">
		</div>
		<div class="form-group">
		      <label for="serial_number">카드번호:</label>
		      <input type="text" class="form-control" name="serial_number" id="serial_number" value="${payInfo.serial_number }">
		</div>
		<div class="form-group">
		      <label for="cvc">cvc번호:</label>
		      <input type="text" class="form-control" name="cvc" id="cvc" value="${payInfo.cvc }">
		</div>
		<label>유효기간:</label>
		<div class="form-group row">
		  <div class="col-xs-2">
		    <label for="month">년</label>
		    <input class="form-control" name="month" id="month" type="text" value="${payInfo.month }">
		  </div>
		  <div class="col-xs-2">
		    <label for="year">월</label>
		    <input class="form-control" name="year" id="year" type="text" value="${payInfo.year }">
		  </div>
		</div>
		
		<button type="button" id="uptBtn" class="btn btn-primary">카드정보(기본)</button>
	</form>
</div>
<div class="col-sm-2"></div>
<script type="text/javascript">
	$(document).ready(function() {
		/* alert('<c:out value="${payInfo.user_id }"/>'); */
		$("#uptBtn").click(function() {
			if ('<c:out value="${payInfo.user_id }"/>') {
				$("form").attr("action", "${path }/myPage/payUpdate.do");
				alert("카드정보수정");
				$("form").submit();
			} else {
				$("form").attr("action", "${path }/myPage/payInsert.do");
				alert("카드정보입력!!!");
				$("form").submit();
			}
		});
		$(function() {
			if ('<c:out value="${payInfo.user_id }"/>') {
				$("#uptBtn").text("카드변경");
			} else {
				$("#uptBtn").text("카드등록");
			}
		});
	});
</script>