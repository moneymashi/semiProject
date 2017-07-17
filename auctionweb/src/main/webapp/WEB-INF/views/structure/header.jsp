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
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('input[name =schAll]').keyup(function(){
			var schAll = $(this).val();
			$.ajax({
				url : "${path}/preSearch.do",
				data : "schAll=" +schAll,
				dataType : "json",
				type : "post",
				success: function(data) {
					alert("성공:"+data.preSearchLists);
					for(item in data.preSearchLists){
						console.log(item);
					}
					
					
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			}); 
		})
	});
	// Jul17, 21:00
	// JB 작업중. 데이터 끌어들이기까지가능. autocomplet이 아직 미완.
	


</script>
</html>


<!-- Navbar -->
<nav class="navbar navbar-transparent navbar-fixed-top navbar-color-on-scroll">
	<!-- <div class="container-fluid"> -->
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-index">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="${path }/main.do">
				<div class="logo-container">
					<div class="logo">
						<img src="/auction/resources/img/auction_logo.png" alt="Creative Tim Logo"
							rel="tooltip"
							title="<b>CTO AUCTION</b> 은 온라인 옥션시스템 입니다. <b>CTO Team</b>"
							data-placement="bottom" data-html="true">
					</div>
					<div class="brand">CTO AUCTION</div>
				</div>
			</a>
		</div>
		<div class="collapse navbar-collapse" id="navigation-index">
    		<ul class="nav navbar-nav navbar-left">
        		<li class="dropdown">
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
        				<i class="material-icons">phone_iphone</i> Phone <b class="caret"></b>
        			</a>
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
    		</ul>
    		<ul class="nav navbar-nav navbar-left">
        		<li class="dropdown">
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
        				<i class="material-icons">laptop_mac</i> Laptop <b class="caret"></b>
        			</a>
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
    		</ul>
    		<ul class="nav navbar-nav navbar-left">
        		<li class="dropdown">
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown">
        				<i class="material-icons">desktop_mac</i> Desktop <b class="caret"></b>
        			</a>
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
    		<ul class="nav navbar-nav navbar-left">
	            <li class="dropdown">
	               <a href="#" class=" dropdown-toggle " role="button" data-toggle="dropdown">
	                    <i class="material-icons">&#xE8B6;</i>Search
	                 </a>
	               <ul class="dropdown-menu">
	                  <li style="width:300px;">
	                     <form class="input-group input-group-lg" method="post" action="${path }/search.do">
	                        <input type="text" class="search-query form-control" name="schAll" placeholder="Search" value="${itemSch.schAll }" />
	                        <div class="input-group-btn">
	                           <button class="btn btn-default" type="submit"><i class="material-icons">&#xE8B6;</i></button>
	                        </div>
	                     </form>
	                  </li>
	               </ul>
	            </li>
            </ul>
    		<ul class="nav navbar-nav navbar-right">
	    		<c:choose>
					<c:when test="${sessionScope.mem.user_id == null }">
						<li class="pull-right"><a href="${path }/login/signUp.do"><i class="material-icons">lightbulb_outline</i> 회원가입</a></li>
						<li class="pull-right"><a href="${path }/login/login.do"><i class="material-icons">assignment_ind</i> 로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="pull-right"><a href="${path }/login/logout.do"><i class="material-icons">offline_pin</i> 로그아웃</a></li>
						<li class="dropdown pull-right"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><i class="material-icons">list</i> 마이메뉴<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="dropdown-header">기본메뉴</li>
								<li><a href="${path }/menuHome.do">메뉴홈</a></li>
								<li><a href="${path }/myPage/userInfo.do">회원정보</a></li>
								<li><a href="${path }/notice/list.do">공지/문의</a></li>
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
							<li><a>[${sessionScope.mem.user_name }]님 환영합니다.</a></li>
								<c:if test="${sessionScope.newMsg > 0 }">
									<li><a>새메세지<span class="badge">${sessionScope.newMsg}</span></a></li>
								</c:if>
								<c:if test="${sessionScope.newMsg == 0 || null}">
									<li><a>메세지 없음</a></li>
								</c:if>
							<li><a>Point :[ ${sessionScope.mem.user_point } ]</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				<c:if test="${msg=='logout' }">
					<li><a style="color: #b71c1c;"><i class="material-icons">offline_pin</i> 로그아웃되었습니다.</a></li>
				</c:if>
			</ul>
    	</div>
	</div>
</nav>