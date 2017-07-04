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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		/* 		var id = "${sessionScope.id}";
		 $("#insert").click(function(){
		 alert(id);
		 })
		 */
		
	});
</script>
<style type="text/css">

/* CSS는 복붙이라 설명 생략 ... */

</style>




</head>
<body>

<nav class="navbar  navbar-inverse  navbar-fixed-top">
	<div class="container-fluid">
			<div class="nav navbar-nav navbar-left col-sm-7">
				
				<div class="navbar-header">
				<%-- nav 맨왼쪽 로고 부분. --%>
					<a class="navbar-brand" href="${path }/main.do">AUCTION</a>
				</div>
				 <div class="nav navbar-nav">
				 	<a href="#demo1" class="btn" role="button" data-toggle="collapse">Page 1<span class="caret"></span></a>
				 		
				 		<div id="demo1" class="collapse">
				 		
				 				<%-- 드랍다운 카테고리부분 --%>
								<%-- 부모카테고리 - Electronic --%>
								<div class="dropdown">
									<div class="dropbtn">
										<a href="${path }/search.do?schParentDept=electronics">Electronics</a>
									</div>
									<div class="dropdown-content">
										<a
											href="${path }/search.do?schParentDept=electronics&schDept=phone">Phone
										</a> <a
											href="${path }/search.do?schParentDept=electronics&schDept=laptop">Laptop
										</a> <a
											href="${path }/search.do?schParentDept=electronics&schDept=desktop">Desktop
										</a>
									</div>
								</div>
			
								<%-- 부모카테고리 - Living  // README: 아직 물품이 9개라서 카테고리 다양화는 안햇지만, 많아질때 카테고리버튼 갯수를 늘리면 됨. --%>
								<div class="dropdown">
									<div class="dropbtn">
										<a href="${path }/search.do?schParentDept=living">Living</a>
									</div>
									<div class="dropdown-content">
										<a href="${path }/search.do?schDept=homedecos">HomeDecos </a> <a
											href="${path }/search.do?schDept=bed">Bed </a> <a
											href="${path }/search.do?schDept=bath">Bath </a>
									</div>
								</div>
				 		
				 		
							</div>

				 </div>
				
				


			</div>
			<div class="col-sm-5">
				<ul class="nav navbar-nav navbar-right">
					<%-- 드랍다운 검색창 --%>
					<li class="dropdown pull-right">
						<a href="#" class=" dropdown-toggle " role="button" data-toggle="dropdown">
					  		<span class="glyphicon glyphicon-search"></span>Search
					  	</a>
						<ul class="dropdown-menu">
							<li style="width:300px;">
								<%-- 검색파트 :: //README: 검색 숨김 참고링크  https://bootsnipp.com/snippets/featured/inline-navbar-search   --%>
								<form class="input-group input-group-lg" method="get" action="${path }/search.do">
									<%-- name = schAll 로 searchLists메서드의 전체검색담당 --%>
									<input type="text" class="search-query form-control" name="schAll" placeholder="Search" value="${itemSch.schAll }" />
									<div class="input-group-btn">
									<%-- submit버튼 --%>
									<button class="btn btn-default" type="submit">
										<span class=" glyphicon glyphicon-search"><span	class="sr-only">Search</span></span>
									</button>
									</div>
								</form>
							</li>
						</ul>
						<%-- 검색드랍다운 끝 --%>
					</li>
					<c:choose>
						<c:when test="${sessionScope.mem.user_id == null }">
							<%-- TODO 새창 띄우기
								 onclick="window.open(this.href,'_blank','width=800,height=600, scrollbars=yes');return false;" --%>
							<li class=""><a href="${path }/login/login.do">로그인</a></li>
							<li class=""><a href="${path }/login/signUp.do">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="pull-right"><a href="${path }/login/logout.do">로그아웃</a></li>
							<li class="dropdown pull-right">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >마이메뉴 
								<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li class="dropdown-header">기본메뉴</li>
									<li class=""><a href="${path }/menuHome.do">메뉴홈</a></li>
									<%-- TODO 공지사항 및 문의 주소 변경 해야됨 --%>
									<li class=""><a href="${path }/notice/notice.do">공지/문의</a></li>
									<%-- 회원정보(메뉴) : 개인정보,입찰정보,배송지정보,카드정보,쪽지함 페이지로~ --%>
									<li class=""><a href="${path }/myPage/userInfo.do">회원정보(메뉴)</a></li>
									<li class="divider"></li>
									<li class="dropdown-header">판매자메뉴</li>
									<%-- 판매정보(메뉴) : 판매자 정보, 판매물품, 물품등록, 출금?? 등등..  --%>
									<c:if test="${sessionScope.mem.auth == 1 }">
										<li class=""><a href="${path}/auctioneerPage/auctioneerInfo.do">판매자등록</a></li>
									</c:if>
									<c:if test="${sessionScope.mem.auth == 2 || sessionScope.mem.auth == 3 }">
										<li class=""><a href="${path}/auctioneerPage/saleInfo.do">판매물품정보</a></li>
									</c:if>
								</ul>
							</li>
							
							<ul class="nav navbar-nav navbar-left row list-inline">
								<%-- TODO 사진 이미지넣을꺼? --%>
								<li style="color: white;"><a>[${sessionScope.mem.picture_location }]사진</a></li>
								<li style="color: white;"><a>[${sessionScope.mem.user_name }]님	환영합니다.</a></li>
								<%-- TODO 확인 안한 쪽지 갯수 링크 --%>
								
								<li style="color: white;"><a href="#">새메세지<span class="badge">222</span></a></li>
								<li style="color: white;"><a>Point :[ ${sessionScope.mem.user_point } ]</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</ul>
				<c:if test="${msg=='logout' }">
					<div class="pull-right" style="color: red;">로그아웃되었습니다.</div>
				</c:if>
			</div>
			
			
		
			
			
	</div>

				 		
	
</nav>

</body>
</html>