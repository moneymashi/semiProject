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
		$("#backBtn").click(function(){
			history.go(-1);
		});
		$("#writeBtn").click(function(){
            var title = $("#board_title").val();
            var content = $("#board_content").val();
            if(title == ""){
                alert("제목을 입력하세요");
                $("#board_title").focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                $("#board_content").focus();
                return;
            }
            $("form").attr("action","${path}/board/replyProc.do");
            $("form").submit();
		});
		
	});
</script>
<h3 style="text-align: left;">답변하기</h3>

<form>
	<input type="hidden" name="board_id" value="${reply.board_id }"/>
	<input type="hidden" name="board_group" value="${reply.board_group }"/>
	<input type="hidden" name="board_step" value="${reply.board_step }"/>
	<input type="hidden" name="board_indent" value="${reply.board_indent }"/>
	<input type="hidden" name="board_name" value="${reply.board_name }"/>
	
	<div class="form-group label-floating" style="text-align: left;">
		<label class="control-label">제목</label>
		<input class="form-control" name="board_title" id="board_title" type="text" value="${reply.board_title } 의 답글입니다"/>
	</div>
	<div class="form-group label-floating" style="text-align: left;">
		<label class="control-label">내용</label>
		<textarea class="form-control" name="board_content" id="board_content" rows="15">${reply.board_content }</textarea>
	</div>
	<div class="form-group" style="text-align: center;">
		<input class="btn btn-success" type="button" id="writeBtn" data-toggle="tooltip" data-placement="top" title="답글달기" value="확인"/>
		<input class="btn btn-default" type="button" id="backBtn" data-toggle="tooltip" data-placement="top" title="전글로" value="취소"/>
	</div>
</form>
