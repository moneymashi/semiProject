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
		$("#regBtn").click(function(){
			var title = $("#notice_title").val();
			var content = $("#notice_content").val();
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
			$(location).attr("href","${path}/notice/list.do");			
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<br><br><br>
	<form method="post" action="${path }/notice/insertProc.do">
		<div class="container">
			<div class="form-group">
				<!-- Subject field -->
				<label class="control-label " for="notice_title">제목</label>
				<input class="form-control" id="notice_title" name="notice_title" type="text" placeholder="제목을 입력하세요."/>
			</div>

			<div class="form-group">
				<!-- Message field -->
				<label class="control-label " for="notice_content">내용</label>
				<textarea class="form-control" cols="40" id="notice_content" name="notice_content" rows="10" placeholder="내용을 입력하세요."></textarea>
			</div>

			<div class="form-group">
				<button class="btn btn-primary " id="regBtn" type="button">확인</button>
				<button class="btn btn-primary " id="listBtn" type="button">취소</button>
			</div>
		</div>
	</form>

</body>
</html>