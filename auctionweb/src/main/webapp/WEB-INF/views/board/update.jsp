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
<script type="text/javascript">
	$(document).ready(function() {
		$("#saveBtn").click(function() {
			var title = $("#board_title").val();
			var content = $("#board_content").val();
			if (title == "") {
				alert("제목을 입력하세요");
				$("#board_title").focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				$("#board_content").focus();
				return;
			}
			$("form").attr("action", "${path}/board/updateProc.do");
			$("form").submit();
		});
	});
</script>
<h3>게시글 수정</h3>

<form method="post">
	<div class="form-group">
		<label for="board_title">제목</label>
		<input class="form-control" name="board_title" id="board_title" value="${upt.board_title}" placeholder="제목을 입력해주세요">
	</div>
	<div class="form-group">
		<label for="board_content">내용</label>
		<textarea class="form-control" name="board_content" id="board_content" rows="4" placeholder="내용을 입력해주세요">${upt.board_content}</textarea>
	</div>
	<div class="form-group" style="text-align: center;">
		<%-- 게시물번호를 hidden으로 처리 --%>
		<input type="hidden" name="board_id" value="${upt.board_id}">
		<button class="btn btn-primary" type="button" id="saveBtn">수정완료</button>
		<button class="btn btn-primary" type="reset">다시작성</button>
	</div>
</form>