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
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${path }/main.do">CTO AUCTION</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Phone <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${path }/search.do?schParentDept=Phone">Phone</a></li>
						<li class="divider"></li>
						<li><a
							href="${path }/search.do?schParentDept=Phone&schDept=Apple">Apple</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Phone&schDept=Samsung">Samsung</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Phone&schDept=LG">LG</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Phone&schDept=Motorola">Motorola</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Phone&schDept=Nokia">Nokia</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Phone&schDept=Blackberry">Blackberry</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Laptop <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${path }/search.do?schParentDept=Laptop">Laptop</a></li>
						<li class="divider"></li>
						<li><a
							href="${path }/search.do?schParentDept=Laptop&schDept=Apple">Apple</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Laptop&schDept=Acer">Acer</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Laptop&schDept=Hp">HP</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Laptop&schDept=Samsung">Samsung</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Laptop&schDept=Sony">Sony</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Desktop <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${path }/search.do?schParentDept=Desktop">Desktop</a></li>
						<li class="divider"></li>
						<li><a
							href="${path }/search.do?schParentDept=Desktop&schDept=DIY">DIY</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Desktop&schDept=Dell">Dell</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Desktop&schDept=Samsung">Samsung</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Desktop&schDept=LG">LG</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Desktop&schDept=Sony">Sony</a></li>
						<li><a
							href="${path }/search.do?schParentDept=Desktop&schDept=Asus">Asus</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" action="${path }/search.do">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="schAll" value="${itemSch.schAll }" size="70">
				</div>
				<button type="submit" class="btn btn-default">
					<span class=" glyphicon glyphicon-search">
				</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.mem.user_id == null }">
						<li class="pull-right"><a href="${path }/login/signUp.do">회원가입</a></li>
						<li class="pull-right"><a href="${path }/login/login.do">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="pull-right"><a href="${path }/login/logout.do">로그아웃</a></li>
						<li class="dropdown pull-right"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">마이메뉴<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">기본메뉴</li>
								<li><a href="${path }/menuHome.do">메뉴홈</a></li>
								<li><a href="${path }/notice/list.do">공지/문의</a></li>
								<li><a href="${path }/myPage/userInfo.do">회원정보(메뉴)</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">판매자메뉴</li>
								<c:if test="${sessionScope.mem.auth == 1 }">
									<li><a href="${path}/auctioneerPage/auctioneerInfo.do">판매자등록</a></li>
								</c:if>
								<c:if
									test="${sessionScope.mem.auth == 2 || sessionScope.mem.auth == 3 }">
									<li><a href="${path}/auctioneerPage/saleInfo.do">판매물품정보</a></li>
								</c:if>
							</ul>
						</li>
						<ul class="nav navbar-nav row list-inline">
							<li><a>[${sessionScope.mem.user_name }]님</a></li>
							<li><a>새메세지<span class="badge">222</span></a></li>
							<li><a>Point :[ ${sessionScope.mem.user_point } ]</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				<c:if test="${msg=='logout' }">
					<li><a style="color: #b71c1c;">로그아웃되었습니다.</a></li>
				</c:if>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<%-- <nav class="nav navbar-inverse  navbar-fixed-top">
   <div class="container-fluid">
        <div class="nav navbar-nav navbar-left col-sm-7">
            <div class="navbar-header">
               nav 맨왼쪽 로고 부분.
               <a class="navbar-brand" href="${path }/main.do">AUCTION</a>
            </div>
            네비바에 상위카테고리들
            <ul class="nav navbar-nav">
               드랍다운 카테고리부분
               부모카테고리 - Electronic
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Phone<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path }/search.do?schParentDept=Phone">Phone</a></li>
                     <li class="divider"></li>
                     <li><a href="${path }/search.do?schParentDept=Phone&schDept=Apple">Apple</a></li>
                     <li><a href="${path }/search.do?schParentDept=Phone&schDept=Samsung">Samsung</a></li>
                     <li><a href="${path }/search.do?schParentDept=Phone&schDept=LG">LG</a></li>
                     <li><a href="${path }/search.do?schParentDept=Phone&schDept=Motorola">Motorola</a></li>
                     <li><a href="${path }/search.do?schParentDept=Phone&schDept=Nokia">Nokia</a></li>
                     <li><a href="${path }/search.do?schParentDept=Phone&schDept=Blackberry">Blackberry</a></li>
                  </ul>
               </li>
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Laptop<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path }/search.do?schParentDept=Laptop">Laptop</a></li>
                     <li class="divider"></li>
                     <li><a href="${path }/search.do?schParentDept=Laptop&schDept=Apple">Apple</a></li>
                     <li><a href="${path }/search.do?schParentDept=Laptop&schDept=Acer">Acer</a></li>
                     <li><a href="${path }/search.do?schParentDept=Laptop&schDept=Hp">HP</a></li>
                     <li><a href="${path }/search.do?schParentDept=Laptop&schDept=Samsung">Samsung</a></li>
                     <li><a href="${path }/search.do?schParentDept=Laptop&schDept=Sony">Sony</a></li>
                  </ul>
               </li>
               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Desktop<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="${path }/search.do?schParentDept=Desktop">Desktop</a></li>
                     <li class="divider"></li>
                     <li><a href="${path }/search.do?schParentDept=Desktop&schDept=DIY">DIY</a></li>
                     <li><a href="${path }/search.do?schParentDept=Desktop&schDept=Dell">Dell</a></li>
                     <li><a href="${path }/search.do?schParentDept=Desktop&schDept=Samsung">Samsung</a></li>
                     <li><a href="${path }/search.do?schParentDept=Desktop&schDept=LG">LG</a></li>
                     <li><a href="${path }/search.do?schParentDept=Desktop&schDept=Sony">Sony</a></li>
                     <li><a href="${path }/search.do?schParentDept=Desktop&schDept=Asus">Asus</a></li>
                  </ul>
               </li>
            </ul>
         </div>
         
         <div class="col-sm-5">
            <ul class="nav navbar-nav navbar-right">
               드롭다운 검색
               <li class="dropdown pull-right">
                  <a href="#" class=" dropdown-toggle " role="button" data-toggle="dropdown">
                       <span class="glyphicon glyphicon-search"></span>Search
                    </a>
                  <ul class="dropdown-menu">
                     <li style="width:300px;">
                        검색파트 :: //README: 검색 숨김 참고링크  https://bootsnipp.com/snippets/featured/inline-navbar-search  
                        <form class="input-group input-group-lg" method="get" action="${path }/search.do">
                           name = schAll 로 searchLists메서드의 전체검색담당
                           <input type="text" class="search-query form-control" name="schAll" placeholder="Search" value="${itemSch.schAll }" />
                           <div class="input-group-btn">
                              submit버튼
                              <button class="btn btn-default" type="submit"><span class=" glyphicon glyphicon-search"></span></button>
                           </div>
                        </form>
                     </li>
                  </ul>
               </li>
               검색드랍다운 끝
               
               세션에 따른 우측메뉴
               <c:choose>
                  <c:when test="${sessionScope.mem.user_id == null }">
                     TODO 새창 띄우기
                         onclick="window.open(this.href,'_blank','width=800,height=600, scrollbars=yes');return false;"
                     <li class="pull-right"><a href="${path }/login/signUp.do">회원가입</a></li>
                     <li class="pull-right"><a href="${path }/login/login.do">로그인</a></li>
                  </c:when>
                  <c:otherwise>
                     <li class="pull-right"><a href="${path }/login/logout.do">로그아웃</a></li>
                     <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >마이메뉴<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <li class="dropdown-header">기본메뉴</li>
                           <li><a href="${path }/menuHome.do">메뉴홈</a></li>
                           TODO 공지사항 및 문의 주소 변경 해야됨
                           <li><a href="${path }/notice/list.do">공지/문의</a></li>
                           회원정보(메뉴) : 개인정보,입찰정보,배송지정보,카드정보,쪽지함 페이지로~
                           <li><a href="${path }/myPage/userInfo.do">회원정보(메뉴)</a></li>
                           <li class="divider"></li>
                           <li class="dropdown-header">판매자메뉴</li>
                           판매정보(메뉴) : 판매자 정보, 판매물품, 물품등록, 출금?? 등등.. 
                           <c:if test="${sessionScope.mem.auth == 1 }">
                              <li><a href="${path}/auctioneerPage/auctioneerInfo.do">판매자등록</a></li>
                           </c:if>
                           <c:if test="${sessionScope.mem.auth == 2 || sessionScope.mem.auth == 3 }">
                              <li><a href="${path}/auctioneerPage/saleInfo.do">판매물품정보</a></li>
                           </c:if>
                        </ul>
                     </li>
                     
                     로그인후 개인알림줄
                     <ul class="nav navbar-nav row list-inline">
                        TODO 사진 이미지넣을꺼?
                        <li style="color: white;"><span>[${sessionScope.mem.picture_location }]사진</span></li>
                        <li style="color: white;"><span>[${sessionScope.mem.user_name }]님   환영합니다.</span></li>
                        TODO 확인 안한 쪽지 갯수 링크
                        
                        <li style="color: white;"><span>새메세지<span class="badge">222</span></span></li>
                        <li style="color: white;"><span>Point :[ ${sessionScope.mem.user_point } ]</span></li>
                     </ul>
                  </c:otherwise>
               </c:choose>
               <c:if test="${msg=='logout' }">
                  <div class="pull-left" style="color: red;">로그아웃되었습니다.</div>
               </c:if>
            </ul>
            
         </div>
         
   </div>

                   
   
</nav> --%>
