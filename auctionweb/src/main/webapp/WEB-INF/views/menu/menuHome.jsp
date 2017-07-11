<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<c:import url="../structure/head.jsp" />
<style type="text/css">
	.main {
		margin-top: 100px;
	}
</style>
<body>
	<c:import url="../structure/header-other.jsp" />
	<div class="wrapper">
		<div class="main main-raised">
			<div class="section section-basic">
				<div class="container">
					<h1>MenuHome</h1>
					<div class="col-sm-2" role="group" aria-label="...">
						<ul class="list-group">
							<li class="list-group-item">
								<a href="${path }/notice/list.do">공지/문의</a>
							</li>
							<li class="list-group-item">
								<a href="${path }/myPage/auctionInfo.do">MY	PGAE</a>
							</li>
							<li class="list-group-item">
								<a href="${path }/auctioneerPage/auctioneerInfo.do">판매자페이지</a>
							</li>
						</ul>
					</div>
					<div class="col-sm-7">
						<img
							src="https://www.askideas.com/media/13/Welcome-Colorful-Clipart.png"
							width="100%">
					</div>
					<div class="col-sm-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<c:import url="../structure/footer.jsp" />
	</div>
</body>
<c:import url="../structure/tail.jsp" />
</html>