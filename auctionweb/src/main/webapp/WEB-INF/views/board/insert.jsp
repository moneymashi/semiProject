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
		$("#regBtn").click(function(){
			var title = $("#board_title").val();
			var content = $("#board_content").val();
			if(title==""){
				alert("제목을 입력하세요");
				alert(auction_id);
				$(this).focus();
				return;
			}
			if(content==""){
				alert("내용을 입력하세요");
				$(this).focus();
				return;
			}
/* 			if(writer==""){
				alert("이름을 입력하세요");
				$(this).focus();
				return;
			} */
			$("form").submit();
		});
		$("#listBtn").click(function(){
			$(location).attr("href","${path}/board/list.do?auction_id="+auction_id);			
		});
	});
</script>
<h3 style="text-align: left;">문의하기</h3>

<form method="post" action="${path }/board/insertProc.do">
	<div class="form-group label-floating " style="text-align: left;">
		<%-- Subject field --%>
		<label class="control-label" >제목</label>
		<input class="form-control" id="board_title" name="board_title" type="text" />
	</div>
	<div class="form-group label-floating" style="text-align: left;">
		<%-- Message field --%>
		<label class="control-label" >내용</label>
		<textarea class="form-control" id="board_content" name="board_content" rows="10"></textarea>
	</div>
	<div class="form-group" style="text-align: center;">
		<button class="btn btn-success " id="regBtn" type="button" data-toggle="tooltip" data-placement="top" title="글쓰기">확인</button>
		<button class="btn btn-default " id="listBtn" type="button" data-toggle="tooltip" data-placement="top" title="목록으로">취소</button>
	</div>
</form>
