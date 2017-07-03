<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>auctionInfo</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name=auction_id]").closest("div").click(function() {
			//TODO "배웠던, emp리스트 클릭시 deptno에따라 이동하는 로직 구현해야됨"
			alert("배웠던, emp리스트 클릭시 deptno에따라 이동하는 로직 구현해야됨");
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
	<form>
		<%--<input type="hidden" name="userId" value="${mem.userId }" /> --%>
		<div>
			<div>WinBid</div>
			<div>
				<c:if test="${winBidMsg=='nothing' }">
					<div>낙찰된 물품이 없습니다.</div>
				</c:if>
				<c:forEach var="winBidJspOnly" items="${winBid }">
					<div>
						<!-- 해당 물품 테이블 클릭시 해당 페이지로 이동 -->
						<input type="hidden" name="auction_id"
							value="${winBidJspOnly.auction_id }" />
						<div>이미지 : ${winBidJspOnly.picture_location}</div>
						<div>물품명 : ${winBidJspOnly.item_name}</div>
						<div>마감날짜 : ${winBidJspOnly.end_date}</div>
						<div>현재상태 : ${winBidJspOnly.state_code}</div>
						<div>가격 : ${winBidJspOnly.current_bid_amount}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />
		<div>
			<div>Bidding</div>
			<div>
				<c:if test="${biddingMsg=='nothing' }">
					<div>입찰된 물품이 없습니다.</div>
				</c:if>
				<!-- TODO 남은시간 넣으면 좋을듯. -->
				<c:forEach var="biddingJspOnly" items="${bidding }">
					<div>
						<!-- 해당 물품 테이블 클릭시 해당 페이지로 이동  -->
						<input type="hidden" name="auction_id"
							value="${biddingJspOnly.auction_id }" />
						<div>이미지 : ${biddingJspOnly.picture_location}</div>
						<div>물품명 : ${biddingJspOnly.item_name}</div>
						<div>마감날짜 : ${biddingJspOnly.end_date}</div>
						<div>현재상태 : ${biddingJspOnly.state_code}</div>
						<div>가격 : ${biddingJspOnly.current_bid_amount}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />
		<div>
			<div>LoseBid</div>
			<div>
				<c:if test="${loseBidMsg=='nothing' }">
					<div>낙찰에 실패한 물품이 없습니다.</div>
				</c:if>
				<c:forEach var="loseBidJspOnly" items="${loseBid }">
					<div>
						<!-- 해당 물품 테이블 클릭시 해당 페이지로 이동  -->
						<input type="hidden" name="auction_id"
							value="${loseBidJspOnly.auction_id }" />
						<div>이미지 : ${loseBidJspOnly.picture_location}</div>
						<div>물품명 : ${loseBidJspOnly.item_name}</div>
						<div>마감날짜 : ${loseBidJspOnly.end_date}</div>
						<div>현재상태 : ${loseBidJspOnly.state_code}</div>
						<div>가격 : ${loseBidJspOnly.current_bid_amount}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />
	</form>
</body>
</html>