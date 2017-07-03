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
	<c:forEach var="item" items="${itemList }">
		<div class="block">
			<div class="top">
				<ul>
					<li><span class="converse">물품번호: ${item.auction_id }</span></li>
					<li><span class="converse">판매자id: ${item.auctioneer_id}</span></li>
					<li><i class="fa fa-shopping-basket" aria-hidden="true"></i></li>
				</ul>
			</div>
			<div class="middle">
				<a href="${path}/board/list.do?auction_id=${item.auction_id}">
					<img src="${path }/resources/upload/${item.picture_location }" alt="pic" />
				</a>
			</div>
			<div class="bottom">
				<div class="heading">물품명: ${item.item_name}</div>
				<div class="info">경매시작일:<fmt:formatDate value="${item.start_date }" pattern="yyyy-MM-dd hh:mm:ss"/></div>
				<div class="info">경매마감일:<fmt:formatDate value="${item.end_date }" pattern="yyyy-MM-dd hh:mm:ss"/></div>
				<div class="price">
					현재입찰가: ${item.current_bid_amount }
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>