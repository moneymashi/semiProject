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
							<h3>CTO 옥션 시스템에 오신것을 환영합니다. 합리적인 가격, 훌륭한 품질, 빠른 피드백. 원하는것을 얻을
								수 있습니다.</h3>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="main main-raised">
			<div class="section" id="carousel">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 ">

							<!-- Carousel Card -->
							<div class="card card-raised card-carousel">
								<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
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
											<div class="item active" style="width:100%; height:800px;">
												<img src="resources/img/carasol_Samsung-Galaxy-S8.jpg" alt="Awesome Image" style="width:100%; height:auto;">
												<div class="carousel-caption">
													<h4>
														<i class="material-icons">location_on</i> Yellowstone National Park, United States
													</h4>
												</div>
											</div>
											<div class="item" style="width:100%; height:800px;">
												<img src="resources/img/carasole_iPhone.png" alt="Awesome Image" style="width:100%; height:auto; ">
												<div class="carousel-caption">
													<h4>
														<i class="material-icons">location_on</i> Somewhere	Beyond, United States
													</h4>
												</div>
											</div>
											<div class="item" style="width:100%; height:800px;">
												<img src="resources/img/carasole_G6.jpg" alt="Awesome Image" style="width:100%; height:auto; ">
												<div class="carousel-caption">
													<h4>
														<i class="material-icons">location_on</i> Yellowstone National Park, United States
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
						<c:forEach var = "highestHit" items ="${highestHit }" varStatus = "status" >
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="top">
								<span class="label label-info">
									<i class="fa fa-star-o" aria-hidden="true">BestHit ${status.index +1 }</i>
								</span>
								<i class="pull-right">hit: ${highestHit.auction_hit }</i>
							</div>
							<div class="middle " >
								<div class="panel panel-default">
									<a class="thumbnail" href='${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />' style="height: 370px;">
										<img src="${path }/resources/upload/${highestHit.picture_location  }"
										alt="pic" style="width: auto; height: 100%; max-height: 300px; background: cover;" />
										<div class="caption">
											<p>${highestHit.item_name }</p>
										</div>
									</a>
								
									<div align="center">	
										<a href='${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />'
										class="btn btn-success btn-lg btn-round" data-toggle="tooltip" data-placement="top" title="경매중: 입찰하세요!" >
											Now Price: ${highestHit.current_bid_amount }
										</a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					
					<div class="row">
						<!--  최고 입찰금 물품 -->
						<c:forEach var = "highestBid" items ="${highestBid }" varStatus = "status" >
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="top">
								<span class="label label-info">
									<i class="fa fa-star-o" aria-hidden="true">BestBid ${status.index +1 }</i>
								</span>
								<i class="pull-right">hit: ${highestBid.auction_hit }</i>
							</div>
							<div class="middle " >
								<div class="panel panel-default">
									<a class="thumbnail" href='${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />' style="height: 370px;">
										<img src="${path }/resources/upload/${highestBid.picture_location  }"
										alt="pic" style="width: auto; height: 100%; max-height: 300px; background: cover;" />
										<div class="caption">
											<p>${highestBid.item_name }</p>
										</div>
									</a>
									<div align="center">	
										<a href='${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />'
										class="btn btn-success btn-lg btn-round" data-toggle="tooltip" data-placement="top" title="경매중: 입찰하세요!" >
											Now Price: ${highestBid.current_bid_amount }
										</a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					
					<div class="row">
						<c:forEach var = "randomOne" items ="${randomOne }" varStatus = "status" >
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="top">
								<span class="label label-info">
									<i class="fa fa-star-o" aria-hidden="true">latestOne Recent ${status.index +1 }</i>
								</span>
								<i class="pull-right">hit: ${randomOne.auction_hit }</i>
							</div>
							<div class="middle " >
								<div class="panel panel-default">
									<a class="thumbnail" href='${path }/board/list.do?auction_id=<c:out value = "${randomOne.auction_id }" />' style="height: 370px;">
										<img src="${path }/resources/upload/${randomOne.picture_location  }"
										alt="pic" style="width: auto; height: 100%; max-height: 300px; background: cover;" />
										<div class="caption">
											<p>${randomOne.item_name }</p>
										</div>
									</a>
									<div align="center">	
										<a href='${path }/board/list.do?auction_id=<c:out value = "${randomOne.auction_id }" />'
										class="btn btn-success btn-lg btn-round" data-toggle="tooltip" data-placement="top" title="경매중: 입찰하세요!" >
											Now Price: ${randomOne.current_bid_amount }
										</a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
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
