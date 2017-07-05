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
		$("#writeBtn").click(function(){
				$(location).attr("href", "${path}/notice/insert.do");
				alert(session);
		});
	});

	// 페이징 처리후 매 페이지 선택할 때마다 값을 떠넘김
	function list(page){
		$(location).attr("href","${path}/notice/list.do?curPage="+page);
	}
</script>
<style type="text/css">

</style>
</head>
<body>
	<div class="col-sm-3">
		<jsp:include page="noticeNav.jsp" flush="false" />
	</div>
	<div class="col-sm-9">
		test
	</div>
</body>
</html>