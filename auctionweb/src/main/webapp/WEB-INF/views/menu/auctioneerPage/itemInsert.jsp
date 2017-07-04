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
<title>ItemInsert</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){		
		$("#insBtn").click(function(){
			var name = $("#item_name").val();
			var paCate = $("#parent_category_id").val();
			var subCate = $("#category_id").val();
			var amount = $("#current_bid_amount").val();
			var pic = $("#picture_location").val();
			var content = $("#item_content").val();

			if(name == ""){
				alert("제목을 입력하세요");
				$(this).focus();
				return;
			}
			if(paCate == ""){
				alert("상위 카테고리를 입력하세요.");
				$(this).focus();
				return;
			}
			if(subCate == ""){
				alert("하위 카테고리를 입력하세요.");
				$(this).focus();
				return;
			}
			if(amount == ""){
				alert("시작금액을 입력하세요.");
				$(this).focus();
				return;
			}
			if(pic == ""){
				alert("사진파일을 입력하세요.");
				$(this).focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요.");
				$(this).focus();
				return;
			}
			
			$("form").attr("action", "${path}/auctioneerPage/itemInsertProc.do");
			$("form").submit();
		});
	});
/* 	function categoryShow(cVal){
		
		var f=document.forms.form01;
		var leng = $("#category_id").length;
		
		if(cVal == ""){
			num = new Array("선택하세요");
			vnum = new Array("");
		} else if (cVal == "1") {
			num = new Array("카테고리1-1","카테고리1-2","카테고리1-3","카테고리1-4","카테고리1-5","카테고리1-6","카테고리1-7");
			vnum = new Array("101","102","103","104","105","106","107");
		} else if (cVal == "2") {
			num = new Array("카테고리2-1","카테고리2-2","카테고리2-3","카테고리2-4","카테고리2-5","카테고리2-6","카테고리2-7");
			vnum = new Array("201","202","203","204","205","206","207");
		} else if (cVal == "3") {
			num = new Array("카테고리3-1","카테고리3-2","카테고리3-3","카테고리3-4","카테고리3-5","카테고리3-6","카테고리3-7");
			vnum = new Array("301","302","303","304","305","306","307");
		} else if (cVal == "4") {
			num = new Array("카테고리4-1","카테고리4-2","카테고리4-3","카테고리4-4","카테고리4-5","카테고리4-6","카테고리4-7");
			vnum = new Array("401","402","403","404","405","406","407");
		} else if (cVal == "5") {
			num = new Array("카테고리5-1","카테고리5-2","카테고리5-3","카테고리5-4","카테고리5-5","카테고리5-6","카테고리5-7");
			vnum = new Array("501","502","503","504","505","506","507");
		} else if (cVal == "6") {
			num = new Array("카테고리6-1","카테고리6-2","카테고리6-3","카테고리6-4","카테고리6-5","카테고리6-6","카테고리6-7");
			vnum = new Array("601","602","603","604","605","606","607");
		}
		
		for( var i=0; i<leng; i++ ){
			f.category_id.options[0] = null;
		}
		
		for( j=0; j<num.length; j++ ){
			f.category_id.options[j] = new Option( num[j], vnum[j] );
		}
		
	} */
</script>
<style type="text/css">

</style>
</head>
<body>
	<form id="form01" method="post" enctype="multipart/form-data">
		<br><br><br><br><br>
		<div>
			<jsp:include page="auctioneerPageNav.jsp" flush="false" />
		</div>
		<h1>서버측 파일 업로드 위치(체크필요.)</h1>
		<table border="1">
			<tr>
				<td>
					<%-- 세션 id값으로 자동설정 --%>
					판매자 id: <input type="text" id="auctioneer_id" name="auctioneer_id" value="${sessionScope.id }" readonly="readonly"/>
				</td>
			</tr>		
			<tr>
				<td>
					품목명: <input type="text" id="item_name" name="item_name" />
				</td>
			</tr>
			<tr>
				<td>
					상위카테고리
					<input name="parent_category_id" value="2"/>
				</td>
			</tr>
			<tr>
				<td>
					하위카테고리
					<input name="category_id" value="4">
				</td>
			</tr>
			<tr>
				<td>
					경매시작가
					<input type="text" id="current_bid_amount" name="current_bid_amount" />
				</td>
			</tr>
			<tr>
				<td>
					사진
					<input type="file" id="picture_location" name="file" />
				</td>
			</tr>
			<tr>
				<td>물품상세정보
					<input type="text" id="item_content" name="item_content"
					style="text-align: center; width: 200px; height: 50px; letter-spacing: 5px;">
				</td>
			</tr>
			<tr>
				<td><input id="insBtn" type="button" value="등록하기" />
					<input type="reset" value="초기화" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>