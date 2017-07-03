<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<%--  
/* 
 * 0703, 16:22.
 * 2.2차 작업 - 유저 가격필터적용 및 주석작업완료. - JB.
 * 
 */
--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auction Testers! CTO</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript">

	
	$(document).ready(function() {
		
		////////////// README::
		////////////// AJAX 보류.
		////////////// 버그: 필터 적용후, 검색결과 2페이지로 넘기고 다른 filter선택하면 ERROR 500 뜸.. 
		////////////// 
		////////////// 
		////////////// 
		
		
		// 각 페이지의 최대 게시물수.
		$("select[name=pageSize]").val("${itemSch.pageSize}");
		// select- option이 변할때 페이징처리.
		$("select[name=pageSize]").change(
			function() {
				var priceOrder = "${itemSch.priceOrder}" != ""? "&priceOrder="+ "${itemSch.priceOrder}": ""  ;
				var userStartDate = "${itemSch.userStartDate}" != ""?  "&userStartDate="+ "${itemSch.userStartDate}": ""  ;
				var userEndDate = "${itemSch.userEndDate}" != ""? "&userEndDate="+ "${itemSch.userEndDate}": ""  ;
				var endDateOrder = "${itemSch.endDateOrder}" != ""? "&endDateOrder="+ "${itemSch.endDateOrder}": ""  ;
				var aucStatus  = "${itemSch.aucStatus}" != ""? "&aucStatus="+ "${itemSch.aucStatus}": ""  ;
				var minCurrentBidPrice = "${itemSch.minCurrentBidPrice}" != "" ?  "&minCurrentBidPrice="+"${itemSch.minCurrentBidPrice}" : "" ;
				var maxCurrentBidPrice ="${itemSch.maxCurrentBidPrice}" != "" ? "&maxCurrentBidPrice="+"${itemSch.maxCurrentBidPrice}" :  "" ;
				$("#pageSize").attr(	"action","${path}/search.do?" + "schParentDept=" + "${itemSch.schParentDept }" 
						+ "&schDept=" + "${itemSch.schDept }" 
						+ "&schAll=" + "${itemSch.schAll }"
						+ priceOrder
						+ userStartDate
						+ userEndDate	
						+ endDateOrder
						+ aucStatus
						+ minCurrentBidPrice
						+ maxCurrentBidPrice );
				$("#pageSize").submit();
		});
	
		//filter처리용 . 기본적으로 부모, 자식, 전체검색은 url에 보이도록설정.
		var schParentDept = "${itemSch.schParentDept}" != "" ? "schParentDept=" + "${itemSch.schParentDept }" : "" ;
		var schDept = "${itemSch.schDept}" != "" ? "&schDept=" + "${itemSch.schDept }" : "" ;
		var schAll =  "${itemSch.schAll}" != "" ? "&schAll=" + "${itemSch.schAll }" : "" ;
		alert('수정8.2');
		
		// 입찰가 정렬필터  - html) select option형식
		$("select[name=priceOrder]").val("${itemSch.priceOrder}"); 
		$("select[name= priceOrder]").change(function(){
			var priceOrder = "&priceOrder="+$(this).val() ;
//			alert("priceOrder "+priceOrder);
			var sendData = schParentDept + schDept + schAll + priceOrder;
			$(location).attr("href","${path}/search.do?" + sendData);
//			alert("sendData "+sendData);
			$("#filter").submit();
			});
		
		// 물품 입찰시작, 마감날짜 필터 - input date형식
		$("select[name=userStartDate]").val("${itemSch.userStartDate}"); 
		$("select[name=userEndDate]").val("${itemSch.userEndDate}"); 
		 $("input[name=userPreferDate]").click(function(){
			var userStartDate = "${itemSch.userStartDate}" != "" ?  "&userStartDate="+"${itemSch.userStartDate}" : "" ;
			var userEndDate ="${itemSch.userEndDate}" != "" ? "&userEndDate="+"${itemSch.userEndDate}" :  "" ;
			if($("input[name=userEndDate]").val() < $("input[name=userStartDate]").val() ){
				alert("최대입찰기한이 최소입찰기한보다 빠르면 안됩니다.");
				return "";
			}
			var sendData =  schParentDept+schDept+ schAll + userStartDate + userEndDate ;
			$(location).attr("href", "search.do?"+sendData);
			$("#filter").submit();
		});
		
		 // 물품 입찰마감날짜 정렬필터 - select option형식
		$("select[name=endDateOrder]").val("${itemSch.endDateOrder}"); 
		$("select[name= endDateOrder]").change(function(){
			var endDateOrder = "&endDateOrder="+$(this).val() ;
			var sendData = schParentDept + schDept + schAll + endDateOrder;
			$(location).attr("href","${path}/search.do?" + sendData);
			$("#filter").submit();
			}); 

		// 입찰상태 필터 - select option형식
		$("select[name=aucStatus]").val("${itemSch.aucStatus}"); 
		$("select[name= aucStatus]").change(function(){
			var aucStatus = "&aucStatus="+$(this).val() ;
			var sendData = schParentDept + schDept + schAll + aucStatus;
			$(location).attr("href","${path}/search.do?" + sendData);
			$("#filter").submit();
			}); 
		
		// 유저 입찰가 필터 적용 - input text기입 형식
		$("select[name=minCurrentBidPrice]").val("${itemSch.minCurrentBidPrice}"); 
		$("select[name=maxCurrentBidPrice]").val("${itemSch.maxCurrentBidPrice}"); 
		 $("input[name=userPreferPrice]").click(function(){
			var minCurrentBidPrice = "${itemSch.minCurrentBidPrice}" != "" ?  "&minCurrentBidPrice="+"${itemSch.minCurrentBidPrice}" : "" ;
			var maxCurrentBidPrice ="${itemSch.maxCurrentBidPrice}" != "" ? "&maxCurrentBidPrice="+"${itemSch.maxCurrentBidPrice}" :  "" ;
			if($("input[name=maxCurrentBidPrice]").val() < $("input[name=minCurrentBidPrice]").val() ){
				alert("최대입찰가격이 최소입찰가격보다 적으면 안됩니다.");
				return "";
			}
			var sendData =  schParentDept+schDept+ schAll + minCurrentBidPrice + maxCurrentBidPrice ;
			$(location).attr("href", "search.do?"+sendData);
			$("#filter").submit();
		});
	
		// 현재 시각 setinterval()
		setTime();
	});
	
	//페이징처리 - 페이지번호(curPage)로 넘어갈때 ROWNUM between 처리를 한다.
	function go(curPage) {
		var priceOrder = "${itemSch.priceOrder}" != ""? "&priceOrder="+ "${itemSch.priceOrder}": ""  ;
		var userStartDate = "${itemSch.userStartDate}" != ""?  "&userStartDate="+ "${itemSch.userStartDate}": ""  ;
		var userEndDate = "${itemSch.userEndDate}" != ""? "&userEndDate="+ "${itemSch.userEndDate}": ""  ;
		var endDateOrder = "${itemSch.endDateOrder}" != ""? "&endDateOrder="+ "${itemSch.endDateOrder}": ""  ;
		var aucStatus  = "${itemSch.aucStatus}" != ""? "&aucStatus="+ "${itemSch.aucStatus}": ""  ;
		var minCurrentBidPrice = "${itemSch.minCurrentBidPrice}" != "" ?  "&minCurrentBidPrice="+"${itemSch.minCurrentBidPrice}" : "" ;
		var maxCurrentBidPrice ="${itemSch.maxCurrentBidPrice}" != "" ? "&maxCurrentBidPrice="+"${itemSch.maxCurrentBidPrice}" :  "" ;
		
		$("input[name=curPage]").val(curPage);
		$("form").attr( "action","${path}/search.do?" + "schParentDept=" + "${itemSch.schParentDept }" 
				+ "&schDept=" + "${itemSch.schDept }" 
				+ "&schAll=" + "${itemSch.schAll }"
				+ priceOrder
				+ userStartDate
				+ userEndDate	
				+ endDateOrder
				+ aucStatus
				+ minCurrentBidPrice
				+ maxCurrentBidPrice );
		$("form").submit();
	}
	
	// 현재시각 - java.util.Date
	function setTime() {
		var sysday = new Date();
		var month = sysday.getMonth() + 1; //months from 1-12
		var day = sysday.getDate();
		var year = sysday.getFullYear();
		var hours = sysday.getHours();
		var minutes = sysday.getMinutes();
		var seconds = sysday.getSeconds();
		$("#showTime").html( 
				"현재시간: " + year + "년 " + month + "월 " + day + "일 " + hours + "시 " + minutes + "분 " + seconds + "초 ");
	}
	// setInterval initiation, 매초마다.
	var count = setInterval(setTime, 1000);
	
	//검색결과없는경우 - 이전페이지로
	function goBack() {
	    window.history.back();
	}
	
</script>
<style type="text/css">
* {
	border: 1px red dotted;
}

#block {
	display: inline-block;
}
</style>
</head>
<body>
	<%
		
	%>
	<br/>  <%-- README: br br br br 이거 해결법?? 잇나요? --%>
	<br/>
	<br/>
	<br/>
	<div>
		<c:import url="header.jsp" />
	</div>
	
	
	<%-- filter
	README: toggle에 문제잇음. 클릭마다 열고 닫는방법 모색중..
	 --%>
	<button data-toggle="collapse" data-target="#demo">Adv. Search</button>
	<div id="demo" class="collapse">
		<form id = "filter" method = "post">
			<br/> 
			<%-- // 입찰가 정렬필터  - html) select option형식 --%>
			<select name = "priceOrder" class="btn btn-primary active">
				<option class="btn btn-primary active" value = ""  > 가격정렬 </option>
				<option class="btn btn-primary active" value = "asc"  > 가격올림차순 </option>
				<option class="btn btn-primary active" value = "desc" > 가격내림차순  </option>
			</select>
			<%-- // 물품 입찰마감날짜 정렬필터 - select option형식 --%>
			<select name = "endDateOrder" class="btn btn-primary active">
				<option class="btn btn-primary active" value = "" > 입찰마감 정렬 - 최신등록 </option>
				<option class="btn btn-primary active" value = "asc" > 입찰마감 - 가까운것부터 </option>
				<option class="btn btn-primary active" value = "desc" > 입찰마감 - 먼것부터 </option>
			</select>
			<%-- // 입찰상태 필터 - select option형식 --%>
			<select name = "aucStatus" class="btn btn-primary active">
				<option class="btn btn-primary active" value = "" > 물품상태 - 입찰중 </option>
				<option class="btn btn-primary active" value = "outOfAuction" > 물품상태 - 입찰종료 </option>
				<option class="btn btn-primary active" value = "allAuction" > 물품상태 - 모두 </option>
			</select>
			
			<%--  // 유저 입찰가 필터 적용 - input text기입 형식  --%>
			<br/> 최소입찰금액: <input name = "minCurrentBidPrice" value = "${itemSch.minCurrentBidPrice }" />원~
				  최대입찰금액: <input name = "maxCurrentBidPrice" value = "${itemSch.maxCurrentBidPrice }" />원까지
				<input type = "button" name = "userPreferPrice" value = "입찰가 필터적용" />
			
			<%-- // 물품 입찰시작, 마감날짜 필터 - input date형식 --%>
			<br/> 최소입찰기한:<input name ="userStartDate" type = "date" value= "${itemSch.userStartDate }" />
				 최대입찰기한:<input name ="userEndDate" type = "date" value= "${itemSch.userEndDate }" /> <input type = "button" name = "userPreferDate" value = "날짜선택완료" />
		
		</form>
	</div>

	<h3>
		<%-- 부모카테고리 - 자식카테고리 링크.  --%>
		<a href = "${path }/search.do?schParentDept=<c:out value ="${itemSch.schParentDept }"/>" > ${itemSch.schParentDept } </a> 
		<a href = "${path }/search.do?schParentDept=<c:out value ="${itemSch.schParentDept }"/>&schDept=<c:out value = "${itemSch.schDept }"/>" > ${itemSch.schDept } </a> 
		<%-- 총데이터건수. --%>
		department에 대한 데이터 건수: ${itemSch.count }건.
	</h3>
	<%-- 검색결과 조회물품이 없는경우. --%>
	<c:if test="${itemList.size() == 0 }">
		<button class="btn btn-primary active" onclick = "goBack();" > 이전 페이지로 </button>
	</c:if>
	
	<%-- 현재시간 조회 - setInterval --%>
	<h3 id = "showTime" > ~ </h3>

	<%-- 조회결과 물품목록 list. --%>
	<%-- items는 ArrayList<Item> 형태,  Model d.addAttribute로 가져옴. --%>
	<c:forEach var="item" items="${itemList }">
			<div id="block" style="width: 32%;">
				<div class="top">
					<ul><a href = '${path }/board/list.do?auction_id=<c:out value = "${item.auction_id }" />' >  <%-- //TODO: 정효형 링크 --%>
						<li><span class="converse">Parent_category:  //mybatis별명!!!</span></li>
						<li><span class="converse">Child_category:  </span></li>
					</a></ul>
				</div>
				<div class="middle">
					<a href = '${path }/board/list.do?auction_id=<c:out value = "${item.auction_id }" />' >  <%-- //TODO: 정효형 링크 --%>
						<img src="${item.picture_location }" alt="pictureNotUploaded" style="width: 32%; height: 32%;" />
					</a>
				</div>
				<div class="bottom">
					<a href = '${path }/board/list.do?auction_id=<c:out value = "${item.auction_id }" />' >  <%-- //TODO: 정효형 링크 --%>
						<div class="heading">${item.item_name }</div> 
						<div class="info" >
							time due: 
							<jsp:useBean id="nowTime" class="java.util.Date" />
							<fmt:formatDate var = "ndate" pattern="yyyy-MM-dd hh:mm:ss" value="${nowTime}" />
							<fmt:formatDate var = "edate" value="${item.end_date }"
								pattern="yyyy-MM-dd hh:mm:ss" />
							<br/>입찰마감: <c:out value = "${edate }" />
						</div>
						<div class="style">auction_hit: ${item.auction_hit }</div> 
						<div class="price">
							current_bid_amount: ${item.current_bid_amount }원 
						</div>
					</a>
				</div>
			</div>
	</c:forEach>

	<%-- 페이징 처리 - 페이지당 물품수(pageSize) --%>
	<div>
		페이지당 아이템수: 
		<span>
			<form method="post" id = "pageSize">
				<select name="pageSize">
					<option value="3">3</option>
					<option value="6" selected >6</option>
					<option value="9">9</option>
					<option value="12">12</option>
				</select> 
				<input type="hidden" name="curPage" value="1" />
			</form>
		</span>
	</div>
	
	<%-- 검색결과에따라 pageCount수 만큼 페이지번호 부여. --%>
	<c:forEach var="cnt" begin="1" end="${itemSch.pageCount}">
		<a style="text-decoration: none" href='javascript:go(${cnt})'> 
		<c:choose>
			<c:when test="${cnt==itemSch.curPage}">
				<b style="font-size: 17pt;">[${cnt}]</b>
			</c:when>
			<c:otherwise>
				<b style="font-size: 13pt; color: black; ">[${cnt}]</b>
			</c:otherwise>
		</c:choose>
		</a>
	</c:forEach>


</body>
</html>