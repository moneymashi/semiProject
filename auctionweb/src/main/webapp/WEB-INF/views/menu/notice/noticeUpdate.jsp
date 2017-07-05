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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#saveBtn").click(function(){
            var title = $("#notice_title").val();
            var content = $("#notice_content").val();
            if(title == ""){
                alert("제목을 입력하세요");
                $("#notice_title").focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                $("#notice_content").focus();
                return;
            }
            $("form").attr("action","${path}/notice/updateProc.do");
            $("form").submit();
        });
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- header 삽입 -->
	<c:import url="../main/header.jsp"/>
	<h2>게시글 수정</h2>
	<form method="post">
	    <div>        <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
	        작성일자 : <fmt:formatDate value="${upt.notice_date}" pattern="yyyy-MM-dd a HH:mm:ss"/>
	                <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
	    </div>
	    <div>
	        제목
	        <input name="notice_title" id="notice_title" size="80" value="${upt.notice_title}" placeholder="제목을 입력해주세요">
	    </div>
	    <div>
	        내용
	        <textarea name="notice_content" id="notice_content" rows="4" cols="80" placeholder="내용을 입력해주세요">${upt.notice_content}</textarea>
	    </div>
	    <div style="width:650px; text-align: center;">
	        <!-- 게시물번호를 hidden으로 처리 -->
	        <input type="hidden" name="notice_id" value="${upt.notice_id}">
	        <button type="button" id="saveBtn">완료</button>
	        <button type="reset">다시작성</button>
	    </div>
	</form>
</body>
</html>