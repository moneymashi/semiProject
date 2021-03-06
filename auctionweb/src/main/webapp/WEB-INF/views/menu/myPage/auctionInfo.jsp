<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-3">
	<jsp:include page="myPageNav.jsp" flush="false" />
</div>
<h1>입찰 물품관리 페이지</h1>
<div class="col-sm-7">
	<div>
		<div>
			<h1>Bidding(입찰중인물품)</h1>
		</div>
		<div>
			<c:if test="${biddingMsg=='nothing' }">
				<div class="alert alert-success">입찰된 물품이 없습니다.</div>
			</c:if>
			<!-- TODO 남은시간 넣으면 좋을듯. -->
			<c:forEach var="bidding1JspOnly" items="${bidding1}">
				<div class="panel panel-success itemSend">
					<div class="panel-heading">Bidding(입찰중인물품)</div>
					<div class="media">
						<div class="media-left">
							<a href="#"> 
							<img class="media-object" src="${path }/auction/resources/upload/${bidding1JspOnly.picture_location}"
								style="width: 70px; height: auto;">
							</a>
						</div>
						<div class="media-body">
							<input type="hidden" name="auction_id"
								value="${bidding1JspOnly.auction_id }" />
							<h4 class="media-heading">${bidding1JspOnly.item_name}</h4>
							<div>마감날짜 : ${bidding1JspOnly.end_date}</div>
							<div>현재상태 : ${bidding1JspOnly.state_code}</div>
							<div>가격 : ${bidding1JspOnly.current_bid_amount}</div>
						</div>
					</div>
				</div>
				<%-- <div class="itemSend">
					<form>
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
					</form>
				</div> --%>
			</c:forEach>
<%-- 				<jsp:include page="../../main/paging.jsp" flush="true">
					<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
					<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
					<jsp:param name="startPageNo" value="${paging.startPageNo}" />
					<jsp:param name="pageNo" value="${paging.pageNo}" />
					<jsp:param name="endPageNo" value="${paging.endPageNo}" />
					<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
					<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
				</jsp:include> --%>

		</div>
	</div>

	<hr />
	<div>
		<div>
			<h1>WinBid(낙찰된물품)</h1>
		</div>
		<div>
			<c:if test="${winBidMsg=='nothing' }">
				<div class="alert alert-danger" role="alert">낙찰된 물품이 없습니다.</div>
			</c:if>
			<c:forEach var="winBidJspOnly" items="${winBid1 }">
				<div class="panel panel-danger itemSend">
					<div class="panel-heading">WinBid(낙찰된물품)</div>
					<div class="media">
						<div class="media-left">
							<a href="#"> <img class="media-object"
								src="${path }/auction/resources/upload/${bidding1JspOnly.picture_location}"
								style="width: 70px; height: auto;">
							</a>
						</div>
						<div class="media-body">
							<input type="hidden" name="auction_id"
								value="${winBidJspOnly.auction_id }" />
							<h4 class="media-heading">${winBidJspOnly.item_name}</h4>
							<div>마감날짜 : ${winBidJspOnly.end_date}</div>
							<div>현재상태 : ${winBidJspOnly.state_code}</div>
							<div>가격 : ${winBidJspOnly.current_bid_amount}</div>
						</div>
					</div>
				</div>
				<%-- <form class="itemSend">
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
				</form> --%>
			</c:forEach>
		</div>
	</div>
	<hr />
	<div>
		<div>
			<h1>LoseBid(낙찰 실패한 물품)</h1>
		</div>
		<div>
			<c:if test="${loseBidMsg=='nothing' }">
				<div class="alert alert-warning" role="alert">낙찰에 실패한 물품이
					없습니다.</div>
			</c:if>
			<c:forEach var="loseBidJspOnly" items="${loseBid1 }">
				<div class="panel panel-warning itemSend">
					<div class="panel-heading">WinBid(낙찰된물품)</div>
					<div class="media">
						<div class="media-left">
							<a href="#"> <img class="media-object"
								src="${path }/auction/resources/upload/${bidding1JspOnly.picture_location}"
								style="width: 70px; height: auto;">
							</a>
						</div>
						<div class="media-body">
							<input type="hidden" name="auction_id"
								value="${loseBidJspOnly.auction_id }" />
							<h4 class="media-heading">${loseBidJspOnly.item_name}</h4>
							<div>마감날짜 : ${loseBidJspOnly.end_date}</div>
							<div>현재상태 : ${loseBidJspOnly.state_code}</div>
							<div>가격 : ${loseBidJspOnly.current_bid_amount}</div>
						</div>
					</div>
				</div>
				<%-- <div class="itemSend">
					<form>
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
					</form>
				</div> --%>
			</c:forEach>
		</div>
	</div>
	<br />
</div>
<div class="col-sm-2"></div>
<script type="text/javascript">
	$(function() {
		$("input[name=auction_id]").closest("div").click(
				function() {
					$(location).attr("href","${path}/auction/board/list.do?auction_id="+$(this).children().val());
					alert($(this).children().val());
				});
	});
</script>