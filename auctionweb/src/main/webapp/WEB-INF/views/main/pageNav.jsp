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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	});
	
	// 변수 : ${viewName } 클릭후 돌아갈 페이지 주소(ex. notice/notice )
	
	//	$(location).attr("href","${path}/notice/list.do?curPage="+page);
	
	// 페이징 처리후 매 페이지 선택할 때마다 값을 떠넘김
	function list(page){
		$(location).attr("href","${path }/pageDiv.do?curPage="+page);
	}
</script>
<style type="text/css">
</style>
</head>
<body>
	<hr />
	<div class="text-center">
		<ul class="pagination">
			<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
			<c:if test="${map.boardPage.curPage > 1}">
				<li><a href="javascript:list('1')">[처음]</a></li>
			</c:if>

			<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPage.curBlock > 1}">
				<li><a href="javascript:list('${map.boardPage.prevPage}')">[이전]</a></li>
			</c:if>

			<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
			<c:forEach var="num" begin="${map.boardPage.blockBegin}"
				end="${map.boardPage.blockEnd}">
				<!-- **현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${num == map.boardPage.curPage}">
						<li><span style="color: red">${num}</span></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:list('${num}')">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPage.curBlock <= map.boardPage.totBlock}">
				<li><a href="javascript:list('${map.boardPage.nextPage}')">[다음]</a></li>
			</c:if>

			<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			<c:if test="${map.boardPage.curPage <= map.boardPage.totPage}">
				<li><a href="javascript:list('${map.boardPage.totPage}')">[끝]</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>