<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<ul class="list-group">
  <li class="list-group-item">
  	<a href="${path }/notice/list.do">공지사항</a>
	<!-- TODO 입찰중인 상품 갯수 -->
  </li>
  <li class="list-group-item">
  	<a href="${path }/notice/qna.do">Q & A</a>
  </li>
</ul>
