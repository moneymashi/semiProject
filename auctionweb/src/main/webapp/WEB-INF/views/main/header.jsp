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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "${sessionScope.id}";
		$("#insert").click(function(){
			alert(id);
		})
	});
</script>
<style type="text/css">

/* CSS는 복붙이라 설명 생략 ... */
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<nav class="navbar  navbar-inverse  navbar-fixed-top">
		<div class="container">
			<%-- nav 맨왼쪽 로고 부분. --%>
			<a class="navbar-brand" href="${path }/main.do">AUCTION</a>
			
			<%-- 드랍다운 카테고리부분 --%>
			<div class="form-inline form-group ">
				<div class="input-group col-8 nav navbar-nav">
					
					<%-- 부모카테고리 - Electronic --%>
					<div class="dropdown">
						<button class="dropbtn">
							<a href="${path }/search.do?schParentDept=electronics">Electronics</a>
						</button>
						<div class="dropdown-content">
							<a href="${path }/search.do?schParentDept=electronics&schDept=phone">Phone </a> 
							<a href="${path }/search.do?schParentDept=electronics&schDept=laptop">Laptop </a> 
							<a href="${path }/search.do?schParentDept=electronics&schDept=desktop">Desktop </a>
						</div>
					</div>

					<%-- 부모카테고리 - Living  // README: 아직 물품이 9개라서 카테고리 다양화는 안햇지만, 많아질때 카테고리버튼 갯수를 늘리면 됨. --%>
					<div class="dropdown">
						<button class="dropbtn">
							<a href="${path }/search.do?schParentDept=living">Living</a>
						</button>
						<div class="dropdown-content">
							<a href="${path }/search.do?schDept=homedecos">HomeDecos </a> 
							<a href="${path }/search.do?schDept=bed">Bed </a> 
							<a href="${path }/search.do?schDept=bath">Bath </a>
						</div>
					</div>
					
					<%-- 검색파트 :: //README: 검색 숨김 참고링크  https://bootsnipp.com/snippets/featured/inline-navbar-search   --%>
					<span class="input-group-btn">
						<form method="get" action="${path }/search.do">
							<%-- name = schAll 로 searchLists메서드의 전체검색담당 --%>
							<input type="text" class="search-query form-control pull-right"
								name="schAll" placeholder="Search" value="${itemSch.schAll }" />
							<%-- 검색창 꺠긋히 지우기. --%>
							<button type="reset" class="btn btn-default">
								<span class="glyphicon glyphicon-remove"><span
									class="sr-only">Close</span></span>
							</button>
							<%-- submit버튼 --%>
							<button class="btn btn-primary" type="submit">
								<span class=" glyphicon glyphicon-search"><span
									class="sr-only">Search</span></span>
							</button>
						</form>
					</span>
				</div>
				
				
				<ul class="nav navbar-nav navbar-right">
           <c:choose>
           		<%-- 만약 email 세션이 없다면 로그인과 회원가입 나오게 --%>
           		<c:when test="${sessionScope.mem.email == null }">
           			 <li class=""><a href="${path }/member/login.do">Login</a></li>
           			 <li class=""><a href="${path }/member/insert.do">Sign-Up</a></li>
           		</c:when>
           		<%-- 있을경우 ~~~님 환영합니다, 물품등록, 정보수정, 로그아웃 나오게 --%>
           		<c:otherwise>
           			 <li style="color:white;">${sessionScope.mem.user_name }님 환영합니다.</li>
           			 <li style="color:white;">${sessionScope.id}님 환영합니다.</li>
           			 <li class=""><a id="insert" href="${path }/item/insert.do">물품등록</a> </li>
           			 <li class=""><a href="${path }/member/info.do">회원정보수정</a> </li>
           			 <li class=""><a href="${path }/member/logout.do">로그아웃</a> </li>
           		</c:otherwise>
           </c:choose>
		   </ul> 
				
			</div>
		</div>
	</nav>
</body>
</html>