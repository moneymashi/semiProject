<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="UTF-8"/> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%request.setCharacterEncoding("UTF-8"); 
  String path=request.getContextPath();	
%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#item").dblclick(function(){
			$(location).attr("href","${path}/board/list.do");
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
  background: #f9fafa;
  padding: 20px;
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
  margin: 20px;
  border-radius: 4px;
  width: 280px;
  min-height: 430px;
  background: #fff;
  padding: 23px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  box-shadow: 0 2px 55px rgba(0,0,0,0.1);
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

</style>
</head>
<body>


	<!--  헤더 import -->
	<div>
	<c:import url="header.jsp"/>
	</div>
	<br><br><br><br><br><br>
	<c:choose>
		<%-- 서버단에서 받은 값이 insert면 물품 등록창 나옴 --%>
		<c:when test="${item == 'insert' }">
			<br><br><br><br><br><br>
			<c:import url="../item/insert.jsp"/>
		</c:when>
		<%-- 그외는 list화면 --%>
		<c:otherwise>
			<c:import url="../item/list.jsp"/>
		</c:otherwise>
	</c:choose>
	
	<!-- carousel 슬라이드쇼  -->
	<div class="container">
		<h2>Carousel SlideShow Example</h2>  <!-- https://www.w3schools.com/bootstrap/bootstrap_carousel.asp 참고 -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators : 자동으로 갯수만큼 매핑해주는듯. -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				
				<!-- 랜덤 입찰 물품 -->
				<div class="item active" style = "max-width: 700px; max-height:150px;">
					<a href = '${path }/board/list.do?auction_id=<c:out value = "${randomOne.auction_id }" />' >  <!-- //TODO: 정효형 게시글 링크. -->
					<img src="${randomOne.picture_location }" alt="Random data" style="width: 100%; height: 100%;" /> -->
					<div class="carousel-caption">
						<h3>randomOne ${randomOne.item_name } </h3>
						<p>randomOne ${randomOne.item_content } </p>
					</div>
					</a>
				</div>

				<!-- 카테고리 홍보: phone -->
				<div class="item" style = "max-width: 700px; max-height:150px;">
					<a href = "${path }/search.do?schParentDept=&schDept=phone" > 
					
					<img src="http://cfile1.uf.tistory.com/image/230CD4385334098709CFFC" alt="Category Ads - Phone" style="width: 100%; height: 100%;" />-->
					<div class="carousel-caption">
						<h3> category Ads </h3>
						<p> try Smart Phone! </p>
					</div>
					</a>
				</div>

				<!-- 공지사항 게시글 -->
				<div class="item" style = "max-width: 700px; max-height:150px;">
					<a href = "### 홍보/공지게시판링크 ###" > <!-- //TODO: 종원형 게시글 링크. ex) ${path }/notice.do  =>관련 입찰목록창 -->
					image03
					<img src="http://images.kbench.com:8080/kbench/article/2013_08/k121978p1n1.jpg" alt="Board Ads" style="width: 100%; height: 100%;" />
					<div class="carousel-caption">
						<h3>Board Ads </h3>
						<p>Board Ads Content</p>
					</div>
					</a>
				</div>
			</div>

			<!-- carousel slide show - 왼쪽, 오른쪽 버튼. -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	
	<!-- main 중간 - 추천 이미지샷 3가지. -->
	<h3>recommend  </h3>
	
	<!--  최다 조회 물품 -->
	<div class="block"  style = "display: inline-block; width:33%; height:100%;">
		<div class="top">
			<ul>
				<a href = '${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />' >  <!-- //TODO: 정효형 게시글 링크. -->	
				<li><i class="fa fa-star-o" aria-hidden="true">highestHit</i></li>
				<li><span class="converse">  카테고리id; ${highestHit.category_id }  // 옥션id; ${highestHit.auction_id }</span></li>
				</a>
			</ul>
		</div>
		<a href = '${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />' >  <!-- //TODO: 정효형 게시글 링크. -->
			<div class="middle"  style = "width:33%; height:33%;">
				<img src="${highestHit.picture_location  }" alt="pic" style = "width:100%; height:100%; background: cover;" />
			</div>
		</a>
		<div class="bottom">
			<a href = '${path }/board/list.do?auction_id=<c:out value = "${highestHit.auction_id }" />' > <!-- //TODO: 정효형 게시글 링크. -->
				<div class="heading"> item_name: ${highestHit.item_name }</div>
				<div class="info"> item_content: ${highestHit.item_content }</div>
				<div class="style"> auction_hit: ${highestHit.auction_hit }</div>
				<div class="price"> current_bid_amount: ${highestHit.current_bid_amount } </div>
			</a>
		</div>
	</div>
	
	<!--  최고 입찰금 물품 -->
	<div class="block"  style = "display: inline-block; width:33%; height:100%;">
		<div class="top">
			<ul>
				<a href = '${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />' >  <!-- //TODO: 정효형 게시글 링크. -->	
				<li><i class="fa fa-star-o" aria-hidden="true">highestBid</i></li>
				<li><span class="converse">  카테고리id; ${highestBid.category_id }  // 옥션id; ${highestBid.auction_id }</span></li>
				</a>
			</ul>
		</div>
		<a href = '${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />' >  <!-- //TODO: 정효형 게시글 링크. -->
			<div class="middle"  style = "width:33%; height:33%;">
				<img src="${highestBid.picture_location  }" alt="pic" style = "width:100%; height:100%; background: cover;" />
			</div>
		</a>
		<div class="bottom">
			<a href = '${path }/board/list.do?auction_id=<c:out value = "${highestBid.auction_id }" />' >  <!-- //TODO: 정효형 게시글 링크. -->
				<div class="heading"> item_name: ${highestBid.item_name }</div>
				<div class="info"> item_content: ${highestBid.item_content }</div>
				<div class="style"> auction_hit: ${highestBid.auction_hit }</div>
				<div class="price"> current_bid_amount: ${highestBid.current_bid_amount } </div>
			</a>
		</div>
	</div>
	
	<!--  공지/회원가입 게시글 --> <!-- //TODO: 종원형 게시판보고 판단할문제.. -->
	<div class="block"  style = "display: inline-block; width:33%; height:100%;">
		<div class="top">
			<ul>
				<a href = '#### 공지/회원가입 링크 ####' >  <!-- //TODO: 종원형 게시글 링크. -->	
				<li><i class="fa fa-star-o" aria-hidden="true"> 공지/회원가입 링크 </i></li>
				<li><span class="converse"> 게시자  // 카테고리 </span></li>
				</a>
			</ul>
		</div>
		<a href = '#### 공지/회원가입 링크 ####' >  <!-- //TODO: 종원형 게시글 링크. -->	
			<div class="middle"  style = "width:33%; height:33%;">
				<img src="https://www.sw.or.kr/img/join/m_mem_n.gif" alt="pic" style = "width:100%; height:100%; background: cover;" />
			</div>
		</a>
		<div class="bottom">
			<a href = '#### 공지/회원가입 링크 ####' >  <!-- //TODO: 종원형 게시글 링크. -->	
				<div class="heading"> HeadLine </div>
				<div class="info">  Content </div>
				<div class="style"> 관리자: 누구누구 </div>
				<div class="price"> ???? </div>
			</a>
		</div>
	</div>
	
	
	
	<!-- 맨아래 사이트맵. -->
	<footer  id = "block" >
	<c:import url="siteMap.jsp"/>
	</footer>
</body>
</html>