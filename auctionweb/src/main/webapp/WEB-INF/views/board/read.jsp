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
<script type="text/javascript">
	$(document).ready(function(){
		$("#listBtn").click(function(){
			$(location).attr("href","${path}/board/list.do?auction_id="+auction_id);
		});
		$("#delBtn").click(function(){
			if (confirm("삭제하시겠습니까?")){
				$("form").attr("action", "${path}/board/delete.do");
				$("form").submit();
			}
		});
		$("#uptBtn").click(function() {
			$(location).attr("href","${path}/board/update.do?board_id=${read.board_id}&auction_id="+auction_id);
		});
		$("#replyBtn").click(function(){
			alert("${sessionScope.id}");
			alert("${sessionScope.name}");
			$(location).attr("href","${path}/board/reply.do?board_id=${read.board_id}&auction_id="+auction_id);
			
		})
	});
</script>

<form method="post">
	<div class="panel panel-default">
		<div class="panel-heading">			
			<div class="panel-title">제목 : ${read.board_title}</div>
		</div>
		<div class="panel-body">
			<div class="pull-right">
				이름: ${read.board_name } |
				작성일자: <fmt:formatDate value="${read.board_date}" pattern="yyyy-MM-dd a HH:mm" /> |
				조회수 : ${read.board_hit} |
			</div><br><hr>
			<div class="form-group">
				${read.board_content}
			</div>
		</div>
		
	</div>
	<div class="form-group" style="text-align: right;">
		<input type="hidden" name="board_id" value="${read.board_id}">
		<input class="btn btn-primary" type="button" id="listBtn" value="목록"/>
		<%-- 유저 id와 글쓴 id가 같을 경우 수정, 삭제 가능--%>
		<c:if test="${sessionScope.id == read.board_writer_id }">
			<button class="btn btn-primary" type="button" id="uptBtn">수정</button>
			<button class="btn btn-primary" type="button" id="delBtn">삭제</button>			
		</c:if>
		<%-- 유저id와 판매자 id가 같을 경우 답글 작성 가능 --%>
		<c:if test="${sessionScope.id==sessionScope.auctioneer_id}">
			<input class="btn btn-primary" type="button" id="replyBtn" value="답변하기"/>
		</c:if>
	</div>
</form>
