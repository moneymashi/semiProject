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
	<div class="col-sm-3">
		<jsp:include page="auctioneerPageNav.jsp" flush="false" />
	</div>
	<h1>경매자 판매 물품관리 페이지</h1>
	<div class="col-sm-9">
		<form>
			<input type="hidden" name="bidding1" id="bidding1" value="${bidding1 }" />
			<input type="hidden" name="bidding2" id="bidding2" value="${bidding2 }" />
			<input type="hidden" name="winBid1" id="winBid1" value="${winBid1 }" />
			<input type="hidden" name="winBid2" id="winBid2" value="${winBid2 }" />
			<input type="hidden" name="loseBid1" id="loseBid1" value="${loseBid1 }" />
			<input type="hidden" name="loseBid2" id="loseBid2" value="${loseBid2 }" />
			<div>
				<div><h1>Bidding(입찰중인물품)</h1></div>
				<div>
					<c:if test="${biddingMsg=='nothing' }">
						<div>입찰된 물품이 없습니다.</div>
					</c:if>
					<!-- TODO 남은시간 넣으면 좋을듯. -->
					<c:forEach var="bidding1JspOnly" items="${bidding1}">
						<div>
							<!-- 해당 물품 테이블 클릭시 해당 페이지로 이동  -->
							<input type="hidden" name="auction_id"
								value="${bidding1JspOnly.auction_id }" />
							<div>이미지 : ${bidding1JspOnly.picture_location}</div>
							<div>물품명 : ${bidding1JspOnly.item_name}</div>
							<div>마감날짜 : ${bidding1JspOnly.end_date}</div>
							<div>현재상태 : ${bidding1JspOnly.state_code}</div>
							<div>가격 : ${bidding1JspOnly.current_bid_amount}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<br />
			<div>
				<div><h1>WinBid(낙찰된물품)</h1></div>
				<div>
					<c:if test="${winBidMsg=='nothing' }">
						<div>낙찰된 물품이 없습니다.</div>
					</c:if>
					<c:forEach var="winBidJspOnly" items="${winBid1 }">
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
				<div><h1>LoseBid(낙찰 실패한 물품)</h1></div>
				<div>
					<c:if test="${loseBidMsg=='nothing' }">
						<div>낙찰에 실패한 물품이 없습니다.</div>
					</c:if>
					<c:forEach var="loseBidJspOnly" items="${loseBid1 }">
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
	</div>
</body>
</html>