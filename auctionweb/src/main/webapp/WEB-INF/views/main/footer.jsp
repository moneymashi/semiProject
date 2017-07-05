<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0; // For Chrome, Safari and Opera 
	}
</script>
<style type="text/css">
#sec1 {
	padding: 2px;
	background-color: #37474f;
	color: white;
	margin: 0;
}

#backToTop {
	background-color: #102027;
	color: white;
	padding: 15px;
	margin: 0;
}

.site {
	color: white;
	font-size: 0.9em;
	
}

.site:hover { 
    color: white;
    font-weight: bold;
    text-decoration: none;
}

.siteTitle {
	font-weight: bold;
}

ul {
	list-style: none;
}
</style>
<h4 id="backToTop" align="center" onclick="topFunction()">Back to
	Top</h4>
<section id="sec1">
	<div class="row">
		<div class="col-md-4" align="center">
			<ul>
				<h4 class="siteTitle">환영합니다</h4>
				<li><a class="site" href="/auction/main.do">옥션물품 보기</a></li>
				<li><a class="site" href="https://ko.wikipedia.org/wiki/%EC%98%A5%EC%85%98_(%EC%9B%B9%EC%82%AC%EC%9D%B4%ED%8A%B8)">옥션에 대해</a></li>
				<li><a class="site" href="https://recruit.ebaykorea.com/">옥션에 취직하기</a></li>
			</ul>
		</div>
		<div class="col-md-4" align="center">
			<ul>
				<h4 class="siteTitle">내 정보관리하기</h4>
				<li><a class="site" href="/auction/myPage/auctionInfo.do">내 입찰보기</a></li>
				<li><a class="site" href="/auction/myPage/userInfo.do">내 계정관리</a></li>
				<li><a class="site" href="/auction/myPage/message.do">내 쪽지함관리</a></li>
				<li><a class="site" href="/auction/myPage/userPayment.do">내 결제관리</a></li>
				<li><a class="site" href="/auction/myPage/delivery.do">내 배송관리</a></li>
			</ul>
		</div>
		<div class="col-md-4" align="center">
			<ul>
				<h4 class="siteTitle">도움받기</h4>
				<li><a class="site" href="/auction/notice/qna.do">물어보세요</a></li>
				<li><a class="site" href="/auction/notice/list.do">공지사항 확인하기</a></li>
			</ul>
		</div>
	</div>

</section>
