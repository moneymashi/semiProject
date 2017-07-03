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
<style type="text/css">

</style>
</head>
<body>
	<form>
		<input type="hidden" name="board_id" value="${reply.board_id }"/>
		<input type="hidden" name="board_group" value="${reply.board_group }"/>
		<input type="hidden" name="board_step" value="${reply.board_step }"/>
		<input type="hidden" name="board_indent" value="${reply.board_indent }"/>
		<input type="hidden" name="board_name" value="${reply.board_name }"/>
		<table style="width: 500; cellpadding: 0; cellspacing: 0;" border="1">
			<tr>
				<th>번호</th>
				<td>${reply.board_id }</td>
			</tr>
			<tr>
				<th>히트</th>
				<td>${reply.board_hit }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="board_title" id="board_title" value="${reply.board_title }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="board_content" id="board_content">${reply.board_content }</textarea></td>
			</tr>
			<tr>
				<td>
					<input type="button" id="writeBtn" value="답변"/>
					<input type="button" id="backBtn" value="취소"/>
				</td>
			</tr>							
		</table>
	</form>
</body>
</html>