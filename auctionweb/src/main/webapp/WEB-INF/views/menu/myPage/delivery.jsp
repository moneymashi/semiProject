<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delivery</title>
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
	<div class="col-sm-3">
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>

	<div class="col-sm-9">
		<form>
			<%--<input type="hidden" name="userId" value="${mem.userId }" /> --%>
			<div>
				<div>(낙찰=입금대기)->(결재+배송지입력)->배송중->배송완료</div>
			</div>
			<div>
				<div>
					<h1>배송중 상품(조건:낙찰,결제완,구매자확인전)</h1>
				</div>
				<div>
					<c:if test="${deliveryMsg=='nothing' }">
						<div class="alert alert-danger" role="alert">낙찰된 물품이 없습니다.</div>
					</c:if>
					<c:forEach var="deliveryJspOnly" items="${delivery }">
						<div class="panel panel-danger itemSend">
							<div class="panel-heading">Delivery(배송중 상품)</div>
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="${path }/auction/resources/upload/${deliveryJspOnly.picture_location}"
										style="width: 70px; height: auto;">
									</a>
								</div>
								<div class="media-body">
									<input type="hidden" name="auction_id"
										value="${deliveryJspOnly.auction_id }" />
									<h4 class="media-heading">${deliveryJspOnly.item_name}</h4>
									<div>마감날짜 : ${deliveryJspOnly.end_date}</div>
									<div>현재상태 : ${deliveryJspOnly.state_code}</div>
									<div>가격 : ${deliveryJspOnly.current_bid_amount}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div>
				<div>
					<h1>내가 구매한 물품(구매자확인후)</h1>
				</div>
				<div>
					<c:if test="${endDealMsg=='nothing' }">
						<div class="alert alert-danger" role="alert">낙찰된 물품이 없습니다.</div>
					</c:if>
					<c:forEach var="endDealJspOnly" items="${endDeal }">
						<div class="panel panel-danger itemSend">
							<div class="panel-heading">EndDeal(구매한물품)</div>
							<div class="media">
								<div class="media-left">
									<a href="#"> <img class="media-object"
										src="${path }/auction/resources/upload/${endDealJspOnly.picture_location}"
										style="width: 70px; height: auto;">
									</a>
								</div>
								<div class="media-body">
									<input type="hidden" name="auction_id"
										value="${endDealJspOnly.auction_id }" />
									<h4 class="media-heading">${endDealJspOnly.item_name}</h4>
									<div>마감날짜 : ${endDealJspOnly.end_date}</div>
									<div>현재상태 : ${endDealJspOnly.state_code}</div>
									<div>가격 : ${endDealJspOnly.current_bid_amount}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
</body>
</html>