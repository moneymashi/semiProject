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
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<div class="container">
		<h2>탭</h2>
		<ul id="myTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a data-target="#home"
				id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
				aria-expanded="true">문의</a></li>
			<li role="presentation" class=""><a data-target="#profile"
				role="tab" id="profile-tab" data-toggle="tab"
				aria-controls="profile" aria-expanded="false">물품 상세정보</a></li>
			<li role="presentation" class="dropdown"><a data-target=""
				id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
				aria-controls="myTabDrop1-contents">안전거래 안내 <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
					id="myTabDrop1-contents">
					<li><a data-target="#dropdown1" tabindex="-1" role="tab"
						id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1">직거래 관련</a></li>
					<li><a data-target="#dropdown2" tabindex="-1" role="tab"
						id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2">배송정책</a></li>
				</ul></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="home"
				aria-labelledby="home-tab">
				<%-- choose문 시작 --%>
				<c:choose>
					<%-- 만약 서버단에서 받은 status값이 lsit면 게시판 목록이 나옴 --%>
					<c:when test="${status == 'list' }">
						<c:import url="../board/list.jsp"/>
					</c:when>
					<%-- 만약 서버단에서 받은 status값이 read면 게시글 읽기가 나옴 --%>
					<c:when test="${status == 'read' }">
						<c:import url="../board/read.jsp"/>
					</c:when>
					<%-- 만약 서버단에서 받은 status값이 update면 게시글 수정이 나옴 --%>
					<c:when test="${status == 'update' }">
						<c:import url="../board/update.jsp"/>
					</c:when>
					<%-- 만약 서버단에서 받은 status값이 reple면 답글 작성이 나옴 --%>
					<c:when test="${status == 'reple' }">
						<c:import url="../board/reply.jsp"/>
					</c:when>
					<%-- 그외는 게시글 작성이 나옴 --%>					
					<c:otherwise>
						<c:import url="../board/insert.jsp"/>
					</c:otherwise>
				</c:choose>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
				<%-- 아이템 정보 --%>
				<pre>${itemInfo.item_content }</pre>
			</div>
			<div role="tabpanel" class="tab-pane fade" id="dropdown1"
				aria-labelledby="dropdown1-tab">
				<img src='${path }/resources/upload/직거래1.JPG' />
				<img src='${path }/resources/upload/직거래2.JPG' />
			</div>
			<div role="tabpanel" class="tab-pane fade" id="dropdown2"
				aria-labelledby="dropdown2-tab">
				<img src='${path }/resources/upload/배송정책1.JPG' />
				<img src='${path }/resources/upload/배송정책2.JPG' />
			</div>
		</div>
	</div>


</body>
</html>