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

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#item").dblclick(function() {
			$(location).attr("href", "${path}/board/list.do");
		});
	});
</script>
<style type="text/css">
* {
	font-family: "Roboto";
	list-style: none;
	margin: 0;
	padding: 0;
	text-decoration: none;
	letter-spacing: 1px;
	box-sizing: border-box;
}

body {
	padding: 70px 0 0 ;
	background: #f9fafa;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

.block {
	margin: 15px;
	border-radius: 4px;
	background: #fff;
	padding: 23px;
	box-shadow: 0 2px 55px rgba(0, 0, 0, 0.1);
}

.top {
	border-bottom: 1px solid #e5e5e5;
	padding-bottom: 10px;
}

.top ul {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
}

.top a {
	color: #9e9e9e;
}

.top a:hover {
	color: #c7ccdb;
}

.converse {
	padding: 2px 10px;
	border-radius: 20px;
	text-transform: uppercase;
	font-size: 14px;
}

.middle {
	margin-bottom: 40px;
}

.middle img {
	width: 100%;
}

.bottom {
	text-align: center;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-box-flex: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.heading {
	font-size: 17px;
	text-transform: uppercase;
	margin-bottom: 5px;
	letter-spacing: 0;
}

.info {
	font-size: 14px;
	color: #969696;
	margin-bottom: 10px;
}

.style {
	font-size: 16px;
	margin-bottom: 20px;
}

.old-price {
	color: #f00;
	text-decoration: line-through;
}

.box {
	display: inline-block;
	width: 100%;
	margin: 1em;
}

.footer {
	width: 100% !important;
	margin: 0;
}
</style>
</head>
<body>


	<!--  헤더 import -->
	<div>
		<c:import url="header.jsp" />
	</div>
	
	<div class="box">
		<!-- carousel 슬라이드쇼  -->
		<div class="container-fluid">
			<!-- https://www.w3schools.com/bootstrap/bootstrap_carousel.asp 참고 -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators : 자동으로 갯수만큼 매핑해주는듯. -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				
				<div class="carousel-inner">
					<div class="item active" style="height: 600px; width:100%;">
						<a href="http://www.samsung.com/sec/">
							<img src="https://www.hartware.de/wp-content/uploads/2017/03/Samsung-Galaxy-S8-design.jpg"
							alt="Galaxys8" style="width: 100%; height: auto;" />
							<div class="carousel-caption">
								<h3>SAMSUNG</h3>
								<p>Galaxy S8 | S8+</p>
							</div>
						</a>
					</div>

					<!-- 카테고리 홍보: phone -->
					<div class="item " style="height: 600px; width:100%;">
						<a href="https://www.apple.com/kr/iphone/">
						<img src="http://cfile24.uf.tistory.com/attach/21055A3357D2569A12450D"
							alt="iPhone7" style="width: 100%; height: auto;" />
							<div class="carousel-caption">
								<h3>APPLE</h3>
								<p>iPhone7</p>
							</div>
						</a>
					</div>

					<!-- 공지사항 게시글 -->
					<div class="item " style="height: 600px; width:100%;">
						<a href="http://www.lge.co.kr/lgekor/product/mobile/categoryMain.do">
						<img src="https://s3.amazonaws.com/poderpda/2017/03/LG-G6-tecnologia-FullVision.jpg"
							alt="g6" style="width: 100%; height: auto;" />
							<div class="carousel-caption">
								<h3>LG</h3>
								<p>G6+</p>
							</div>
						</a>
					</div>
				</div>

				<!-- carousel slide show - 왼쪽, 오른쪽 버튼. -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<!-- main 중간 - 추천 이미지샷 3가지. -->

		<!--  최다 조회 물품 -->
		<div class="col-sm-4">
			<div class="block box">
				<div class="top">
					<ul>
						<a
							href='${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />'>
							<!-- //TODO: 정효형 게시글 링크. -->
							<li><i class="fa fa-star-o" aria-hidden="true">highestHit</i></li>
							<li><span class="converse"> 카테고리id;
									${highestHit.category_id } // 옥션id; ${highestHit.auction_id }</span></li>
						</a>
					</ul>
				</div>
				<a
					href='${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />'>
					<!-- //TODO: 정효형 게시글 링크. -->
					<div class="middle" style="width: 33%; height: 33%;">
						<img src="${highestHit.picture_location  }" alt="pic"
							style="width: 100%; height: 100%; background: cover;" />
					</div>
				</a>
				<div class="bottom">
					<a
						href='${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />'>
						<!-- //TODO: 정효형 게시글 링크. -->
						<div class="heading">item_name: ${highestHit.item_name }</div>
						<div class="info">item_content: ${highestHit.item_content }</div>
						<div class="style">auction_hit: ${highestHit.auction_hit }</div>
						<div class="price">current_bid_amount:
							${highestHit.current_bid_amount }</div>
					</a>
				</div>
			</div>
		</div>

		<!--  최고 입찰금 물품 -->
		<div class="col-sm-4">
			<div class="block box">
				<div class="top">
					<ul>
						<a
							href='${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />'>
							<!-- //TODO: 정효형 게시글 링크. -->
							<li><i class="fa fa-star-o" aria-hidden="true">highestBid</i></li>
							<li><span class="converse"> 카테고리id;
									${highestBid.category_id } // 옥션id; ${highestBid.auction_id }</span></li>
						</a>
					</ul>
				</div>
				<a
					href='${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />'>
					<!-- //TODO: 정효형 게시글 링크. -->
					<div class="middle" style="width: 33%; height: 33%;">
						<img src="${highestBid.picture_location  }" alt="pic"
							style="width: 100%; height: 100%; background: cover;" />
					</div>
				</a>
				<div class="bottom">
					<a
						href='${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />'>
						<!-- //TODO: 정효형 게시글 링크. -->
						<div class="heading">item_name: ${highestBid.item_name }</div>
						<div class="info">item_content: ${highestBid.item_content }</div>
						<div class="style">auction_hit: ${highestBid.auction_hit }</div>
						<div class="price">current_bid_amount:
							${highestBid.current_bid_amount }</div>
					</a>
				</div>
			</div>
		</div>

		<!--  공지/회원가입 게시글 -->
		<!-- //TODO: 종원형 게시판보고 판단할문제.. -->
		<div class="col-sm-4">
			<div class="block box">
				<div class="top">
					<ul>
						<a href='#### 공지/회원가입 링크 ####'> <!-- //TODO: 종원형 게시글 링크. -->
							<li><i class="fa fa-star-o" aria-hidden="true"> 공지/회원가입
									링크 </i></li>
							<li><span class="converse"> 게시자 // 카테고리 </span></li>
						</a>
					</ul>
				</div>
				<a href='#### 공지/회원가입 링크 ####'> <!-- //TODO: 종원형 게시글 링크. -->
					<div class="middle" style="width: 33%; height: 33%;">
						<img src="https://www.sw.or.kr/img/join/m_mem_n.gif" alt="pic"
							style="width: 100%; height: 100%; background: cover;" />
					</div>
				</a>
				<div class="bottom">
					<a href='#### 공지/회원가입 링크 ####'> <!-- //TODO: 종원형 게시글 링크. -->
						<div class="heading">HeadLine</div>
						<div class="info">Content</div>
						<div class="style">관리자: 누구누구</div>
						<div class="price">????</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>
</body>
</html>