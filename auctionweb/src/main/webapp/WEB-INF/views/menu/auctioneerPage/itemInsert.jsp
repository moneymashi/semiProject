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
 	function categoryShow(cVal){
		
		var f=document.forms.form01;
		var leng = $("#category_id").length;
	
		if(cVal == ""){
			num = new Array("선택하세요");
			vnum = new Array("");
		} else if (cVal == "1") {
			num = new Array("Apple","Apple","LG","Motorola","Nokia","Blackberry");
			vnum = new Array("2","3","4","5","6","7");
		} else if (cVal == "8") {
			num = new Array("Apple","Acer","HP","Samsung","Sony");
			vnum = new Array("9","10","11","12","13");
		} else if (cVal == "14") {
			num = new Array("DIY","Dell","Samsung","LG","Sony","ASUS");
			vnum = new Array("15","16","17","18","19","20");
		} 
		
		for( var i=0; i<leng; i++ ){
			f.category_id.options[0] = null;
		}
		
		for( j=0; j<num.length; j++ ){
			f.category_id.options[j] = new Option( num[j], vnum[j] );
		}
		
	} 
</script>
<style type="text/css">

</style>
</head>
<body>
	<div class="col-sm-3">
		<jsp:include page="auctioneerPageNav.jsp" flush="false" />
	</div>
	<div class="container col-sm-9">
	<br><br><br><br>
		<div class="panel panel-primary">
			<div class="panel-heading" style="text-align:center;"><h2>물품등록</h2></div>
			<div class="panel-body">
				<form class="form-horizontal" id="form01" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<%-- 세션 id값으로 자동설정 --%>
						<label class="col-sm-2 control-label">판매자id:</label>
						<div class="col-sm-10"><input class="form-control" type="text" id="auctioneer_id" name="auctioneer_id" value="${sessionScope.id }"/></div>
					</div>	
					<div class="form-group">
						<label class="col-sm-2 control-label">품목명:</label>
						<div class="col-sm-10"><input class="form-control" type="text" id="item_name" name="item_name" /></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">상위카테고리:</label>
						<div class="col-sm-10">
							<select class="form-control" id="parent_category_id" name="parent_category_id" onchange="categoryShow(this.value)">
								<option value="">상위 카테고리를 선택하세요</option>
								<option value="1">Phone</option>
								<option value="8">Laptop</option>
								<option value="14">Desktop</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">하위카테고리:</label>
						<div  class="col-sm-10">
							
							<select class="form-control" id="category_id" name="category_id" >
								<option></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">경매시작가:</label>
						<div class="col-sm-10"><input class="form-control" type="text" id="current_bid_amount" name="current_bid_amount" /></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">사진:</label>
						<div class="col-sm-10"><input class="form-control" type="file" id="picture_location" name="file" /></div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">물품상세정보:</label>
						<div class="col-sm-10"><textarea class="form-control" id="item_content" rows="20" name="item_content"></textarea></div>
					</div>
					<div class="form-group" style="text-align:center;">
						<input class="btn btn-primary" id="insBtn" type="button" value="등록하기" />
						<input class="btn btn-primary" type="reset" value="초기화" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>