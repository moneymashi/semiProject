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
<div class="col-sm-3">
	<jsp:include page="noticeNav.jsp" flush="false" />
</div>
<div class="col-sm-1">
</div>
<div class="col-sm-7">
	<form action="${path }/mail/mailSending.do" method="post">
		<div class="form-group">
			<label for="tomail">받는사람:</label> 
			<input type="hidden" name="tomail" value="llighter.aco@gmail.com">
			<input type="text" class="form-control" name="tomail" id="tomail"
				value="옥션 서비스센터" disabled="disabled">
		</div>
		<div class="form-group">
			<label for="title">제목:</label> 
			<input type="text" class="form-control" name="title" id="title"
				placeholder="무엇에 대한 문의 입니까?">
		</div>
		<p>
		<div class="form-group">
			<label for="title">내용:</label>
			<textarea name="content" cols="120" rows="12"
				style="resize: none" placeholder="문의할 내용을 상세하게 작성해주세요."
				class="form-control"></textarea>
		</div>
		<p>
		<div align="center">
			<input type="submit" value="SEND" class="btn btn-primary">
		</div>
	</form>
</div>