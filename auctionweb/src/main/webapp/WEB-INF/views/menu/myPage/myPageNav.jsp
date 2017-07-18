<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<ul class="list-group">
  <li class="list-group-item">
  	<a href="${path }/myPage/auctionInfo.do">입찰정보</a>
	<!-- TODO 입찰중인 상품 갯수 -->
  </li>
  <li class="list-group-item">
  	<a href="${path }/myPage/message.do">쪽지함</a>
  </li>
  <li class="list-group-item">
  	<a href="${path }/myPage/delivery.do">배송확인</a>
	<!-- TODO 입찰중인 상품 갯수 -->
  </li>
  <li class="list-group-item">
  	<a href="${path }/myPage/locationInfo.do">주소지등록</a>
  </li>
  <li class="list-group-item">
  	<a href="${path }/myPage/userPayment.do">신용카드</a>
  </li>
  <!-- 포인트 충전 -->
  <li class="list-group-item">
  	<a href="${path }/myPage/refillPoints.do">입찰포인트 충전</a>
  </li>
  <li class="list-group-item">
  	<a href="${path }/myPage/userInfo.do">회원개인정보</a>
  </li>
</ul>
