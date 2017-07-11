<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<html>
<c:import url="./structure/head.jsp" />
<body class="index-page">
	<c:import url="./structure/header.jsp" />
	<div class="wrapper">
		<div class="header header-filter"
			style="background-image: url('resources/img/auction-main.jpg');">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="brand">
							<h1>CTO Auction System</h1>
							<h3>CTO 옥션 시스템이 오신것을 환영합니다. 합리적인 가격, 훌륭한 품질, 빠른 피드백. 원하는것을 얻을
								수 있습니다.</h3>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="main main-raised">
			<div class="section" id="carousel">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">

							<!-- Carousel Card -->
							<div class="card card-raised card-carousel">
								<div id="carousel-example-generic" class="carousel slide"
									data-ride="carousel">
									<div class="carousel slide" data-ride="carousel">

										<!-- Indicators -->
										<ol class="carousel-indicators">
											<li data-target="#carousel-example-generic" data-slide-to="0"
												class="active"></li>
											<li data-target="#carousel-example-generic" data-slide-to="1"></li>
											<li data-target="#carousel-example-generic" data-slide-to="2"></li>
										</ol>

										<!-- Wrapper for slides -->
										<div class="carousel-inner">
											<div class="item active">
												<img src="resources/img/carasol_Samsung-Galaxy-S8.jpg"
													alt="Awesome Image">
												<div class="carousel-caption">
													<h4>
														<i class="material-icons">location_on</i> Yellowstone
														National Park, United States
													</h4>
												</div>
											</div>
											<div class="item">
												<img src="resources/img/carasole_iPhone.png"
													alt="Awesome Image">
												<div class="carousel-caption">
													<h4>
														<i class="material-icons">location_on</i> Somewhere
														Beyond, United States
													</h4>
												</div>
											</div>
											<div class="item">
												<img src="resources/img/carasole_G6.jpg" alt="Awesome Image">
												<div class="carousel-caption">
													<h4>
														<i class="material-icons">location_on</i> Yellowstone
														National Park, United States
													</h4>
												</div>
											</div>
										</div>

										<!-- Controls -->
										<a class="left carousel-control"
											href="#carousel-example-generic" data-slide="prev"> <i
											class="material-icons">keyboard_arrow_left</i>
										</a> <a class="right carousel-control"
											href="#carousel-example-generic" data-slide="next"> <i
											class="material-icons">keyboard_arrow_right</i>
										</a>
									</div>
								</div>
							</div>
							<!-- End Carousel Card -->
						</div>
					</div>
				</div>
			</div>
			<div class="section section-basic">
				<div class="container">
					<div class="row">
						<!--  최다 조회 물품 -->
						<div class="col-md-4">
							<div class="block box">
								<div class="top">
									<i class="fa fa-star-o" aria-hidden="true">highestHit</i> <i
										class="pull-right">hit: ${highestHit.auction_hit }</i>
								</div>
								<div class="middle">
									<a class="thumbnail"
										href='${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />'>
										<img src="${highestHit.picture_location  }" alt="pic"
										style="width: 100%; height: 100%; max-height: 600px; background: cover;" />
									</a>
								</div>
								<div class="bottom">
									<div class=" panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" href="#item01">${highestHit.item_name }</a>
											</h4>
										</div>
										<div id="item01" class="panel-collapse collapse">
											<div class="panel-body" id="panel-body">${highestHit.item_content }</div>
											<div class="panel-footer">Price:
												${highestHit.current_bid_amount }</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--  최고 입찰금 물품 -->
						<div class="col-md-4">
							<div class="block box">
								<div class="top">
									<i class="fa fa-star-o" aria-hidden="true">highestBid</i> <i
										class="pull-right">hit: ${highestBid.auction_hit }</i>
								</div>
								<div class="middle">
									<a class="thumbnail"
										href='${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />'>
										<img src="${highestBid.picture_location  }" alt="pic"
										style="width: 100%; height: 100%; max-height: 600px; background: cover;" />
									</a>
								</div>
								<div class="bottom">
									<div class=" panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" href="#item02">${highestBid.item_name }</a>
											</h4>
										</div>
										<div id="item02" class="panel-collapse collapse">
											<div class="panel-body">${highestBid.item_content }</div>
											<div class="panel-footer">Price:
												${highestBid.current_bid_amount }</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-md-4">
							<div class="block box">
								<div class="top">
									<i class="fa fa-star-o" aria-hidden="true">randomOne</i> <i
										class="pull-right">hit: ${randomOne.auction_hit }</i>
								</div>
								<div class="middle">
									<a class="thumbnail"
										href='${path }/board/list.do?auction_id=<c:out value = "${randomOneBid.auction_id }" />'>
										<img src="${randomOne.picture_location  }" alt="pic"
										style="width: 100%; height: 100%; max-height: 600px; background: cover;" />
									</a>
								</div>
								<div class="bottom">
									<div class=" panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" href="#item03">${randomOne.item_name }</a>
											</h4>
										</div>
										<div id="item03" class="panel-collapse collapse">
											<div class="panel-body">${randomOne.item_content }</div>
											<div class="panel-footer">Price:
												${randomOne.current_bid_amount }</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<c:import url="./structure/footer.jsp"></c:import>
		</div>
	</div>
</body>
<c:import url="./structure/tail.jsp" />
</html>
