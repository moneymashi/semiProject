<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.text.*, javax.servlet.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<c:import url="../structure/head.jsp" />
<style type="text/css">
.main {
	padding-top: 120px;
}
</style>
</head>
<body class="index-page">
	<%-- 헤더삽입 --%>
	<c:import url="../structure/header-other.jsp" />
	<div class="wrapper">
		<div class="main main-raised">
			<div class="section section-basic">
				<div class="container">
					<div class="row">
						<div class="col-xs-4 item-photo">
							<img style="max-width: 70%; max-height: 70%;"
								src="${path }/resources/upload/${itemInfo.picture_location}" />
						</div>
						<div class="col-xs-5" style="border: 0px solid gray">
							<%-- 물품명, 물품번호, 물품번호 숨기기 --%>
							<h3>물품명: ${itemInfo.item_name }</h3>
							<h5 style="color: #337ab7">물품번호: ${itemInfo.auction_id }</h5>
							<input type="hidden" name=auction_id id="auction_id" value="${itemInfo.auction_id }" />
							
							<%-- 물품 현재가격 --%>
							<h6 class="title-price">
								<small>현재가격</small>
							</h6>
							<h3 style="margin-top: 0px;">${itemInfo.current_bid_amount}원</h3>
			
							<%-- 경매시작일, 종료일, 카운트다운--%>
							<div class="section">
								<h4>
									경매시작일:
									<fmt:formatDate value="${itemInfo.start_date }"
										pattern="yyyy-MM-dd hh:mm:ss" />
								</h4>
								<h4>
									경매종료일:
									<fmt:formatDate value="${itemInfo.end_date }"
										pattern="yyyy-MM-dd hh:mm:ss" />
								</h4>
								<h4 id="showTime"></h4>
							</div>
			
							<%-- 현재가격(input hidden), 입찰입력창, 입찰로그(모달) --%>
							<div class="section" style="padding-bottom: 20px;">
								<%-- 폼시작 --%>
								<form method="post" action="${path}/board/bid.do?auction_id=${itemInfo.auction_id}">
									<%-- 현재입찰가격 숨기기 --%>
									<input type="hidden" name="current_bid_amount" value="${itemInfo.current_bid_amount}" />
									<%-- 입찰값입력창 --%>
									<h4><input class="input" type="number" name="bid_amount" value="0" /></h4>
									<%-- 모달 시작 --%>
									<a data-toggle="modal" href="#myModal" class="btn btn-primary">입찰로그</a>
									<div class="modal" id="myModal">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">×</button>
													<h4 class="modal-title">입찰자</h4>
												</div>
												<div class="modal-body">
													<table class="table">
														<thead>
															<tr>
																<th>번호</th>
																<th>옥션아이디</th>
																<th>입찰가격</th>
																<th>입찰한 날짜</th>
															</tr>
														</thead>
														<tbody>
															<%-- 입찰 로그 리스트 불러오기 --%>
															<c:forEach var="bid" items="${bidList }" varStatus="sts" begin="0" end="${bidList.size() }" step="1">
																<tr class="active">
																	<td>${sts.count }</td>
																	<td>${bid.bidder_id }</td>
																	<td>${bid.bid_amount }</td>
																	<td><fmt:formatDate value="${bid.bidding_date }" pattern="yyyy/MM/dd hh:mm:ss"/></td>
																</tr>
															</c:forEach>
															<%-- 입찰 로그 리스트가 없을 경우 --%>
															<c:if test="${bidList.size()==0 }">
																<tr class="active">
																	<td colspan="4" style="text-align:center;">입찰참여자가 아직 없습니다!</td>
																</tr>
															</c:if>
														</tbody>
													</table>
												</div>
												<div class="modal-footer">
													<a href="#" data-dismiss="modal" class="btn">닫기</a> 
												</div>
											</div>
										</div>
									</div>
									<%-- 모달 끝 --%>
									<%-- 조건문1 시작. 만약  서버단에서 넘겨온 값이 ing라면(경매 진행중) --%>
									<c:if test="${time =='ing' }">
										<%-- choose 조건문 시작 --%>
										<c:choose>
											<%-- 만약 로그인 정보가 있을 경우에는 입찰 화면창이 나옴 --%>
											<c:when test="${sessionScope.mem!=null }">
												<button class="btn btn-success" id="bidBtn" type="submit">
													<span style="margin-right: 20px"
														class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>입찰하기
												</button>
											</c:when>
											<%-- 로그인 정보가 없을 경우에는 로그인버튼이 나옴 --%>
											<c:otherwise>
												<button class="btn btn-success" id="notBtn" type="button">
													<span style="margin-right: 20px"
														class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>로그인
													하기
												</button>
											</c:otherwise>
										</c:choose>
										<%-- choose조건문 끝 --%>
									</c:if>
									<%-- 조건문1 끝 --%>
									<%-- 조건문2 시작. 만약 경매가 끝났다면  경매종료 표시--%>
									<c:if test="${time == 'end' }">
										<h4>경매마감</h4>
										<%-- 만약 로그인 접속 계정과 최고낙찰자가 동일하다면 결제진행 버튼 나옴 --%>
										<c:if test="${sessionScope.id == itemInfo.current_bidder_id }">
											<button class="btn btn-success" id="payBtn" type="button">
												<span style="margin-right: 20px"
													class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>결제진행
											</button>
										</c:if>
									</c:if>
								</form>
								<h6>
									<span class="glyphicon glyphicon-heart-empty"
										style="cursor: pointer;"></span> Agregar a lista de deseos
								</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section section-tab">
				<div class="container">
					<div class="row">
						<%-- 아이템 정보 밑에 게시글, 상세정보 등 탭화면 삽입 --%>
						<c:import url="tab.jsp" />
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<c:import url="../structure/footer.jsp" />
		</div>
	</div>
</body>
<c:import url="../structure/tail.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		// 입찰input창 포커싱 처리
		$(".input").focus(function() {
			$(this).val('');
		}).blur(function() {
			if ($(this).val() == "") {
				$(this).val("0");
			}
		});
		setTime();

		$("#notBtn").click(function() {
			alert("로그인 후 이용 가능합니다.");
			$(location).attr("href", "${path}/member/login.do");
		});
		$("#payBtn").click(function() {
			//alert("결제창으로 넘어갑니다.");
			$(location).attr("href", "${path}/myPage/payTheWin.do");
		});
	});
	// 서버단에서 받는 msg값이 있으면 알림창
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	// 해당 물품의 물품번호 변수 선언
	var auction_id = "${itemInfo.auction_id }";
	function setTime() {
		var endDate = "${sessionScope.endDate }";
		var sysday = new Date();
		var dday = new Date(endDate);
		var gap = parseInt((dday.getTime() - sysday.getTime()) / 1000);
		var days = parseInt(gap / (60 * 60 * 24));
		var hours = parseInt((gap % (60 * 60 * 24)) / (60 * 60));
		var minutes = parseInt((gap % (60 * 60)) / 60);
		var seconds = gap % 60;
		$("#showTime").html(
				"카운트다운: " + days + "일 " + hours + "시간 " + minutes + "분 "
						+ seconds + "초 ");
		if (gap <= 0) {
			$("#showTime").html("");
			clearInterval(count);
		}
	}
	var count = setInterval(setTime, 1000);
</script>
</html>