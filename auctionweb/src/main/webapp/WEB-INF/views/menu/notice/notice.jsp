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
<!-- TODO. 자바스트립트가 먹지 않아서 다시 넣어줌 -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
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
<div class="col-sm-3">
	<jsp:include page="noticeNav.jsp" flush="false" />
</div>
<div class="col-sm-1">
</div>
<div class="col-sm-7">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<!-- 게시글 넘버링 처리 및 리스트 불러오기 -->
			<c:forEach var="notice" items="${map.noticeList }">
				<tr>
					<!-- 게시글 제목 클릭시 게시글 보기(상세내용) -->
					<td>${notice.notice_no }</td>
					<td>
						<a data-toggle="collapse" href=".collapse${notice.notice_no }">${notice.notice_title}</a>
					</td>
					<td><fmt:formatDate value="${notice.notice_date }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
				<tr class="collapse collapse${notice.notice_no }">
					<td colspan="3">
								${notice.notice_content }
					</td>
				</tr>
				<c:if test="${sessionScope.email.equals('admin') }">
					<tr class="collapse collapse${notice.notice_no }">
						<td colspan="3">
							<form method="post" action="${path}/notice/delete.do">
								<input  type="hidden" name="notice_id" value="${notice.notice_id }" />
								<c:set value="${notice.notice_id }" var = "notice_id"/> 
								<a class="btn btn-default" href="${path}/notice/update.do?notice_id=${notice.notice_id}">수정</a>
								<button type="submit" class="delBtn">삭제</button>	
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<!-- 게시글이 없을 경우 -->
			<c:if test="${map.noticeList.size()==0 }">
				<td colspan="5" style="text-align: center;">작성된 공지가 없습니다!!</td>
			</c:if>
		</tbody>
	</table>
	<hr />
	<c:if test="${sessionScope.email.equals('admin') }">
	<a class="btn btn-default pull-right" id="writeBtn">글쓰기</a>
	</c:if>
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
</div>
</html>