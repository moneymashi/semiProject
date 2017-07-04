<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userInfo</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uptBtn").click(function(){
/* 			var password = $("#password").val();
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			} */
			$("form").attr("action", "${path }/myPage/locUpdate.do");
			alert("회원정보수정");
			$("form").submit();
		});
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div class="col-sm-3">
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	<div class="col-sm-9">
		<form>
			<input type="hidden" name="user_id" value="${userInfo.user_id }"/>
			<div class="form-group">
			      <label for="password">이름:</label>
			      <input type="text" class="form-control" name="real_name" id="real_name" value="${userInfo.real_name }">
			</div>
			
			<div class="form-group">
			      <label for="phone_number">전화번호:</label>
			      <input type="text" class="form-control" name="phone_number" id="phone_number" value="${userInfo.phone_number }">
			</div>
			
			<div class="form-group row">
			  <div class="col-xs-2">
			    <label for="month">우편번호:</label>
			    <input class="form-control" id="sample4_postcode" name="zip_code" type="text" value="${userInfo.zip_code }">
			  </div>
			  <div class="col-xs-2">
			  	<label for="search">&nbsp;&nbsp;&nbsp;</label>
			    <input type="button" class="form-control btn btn-success" id="search" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			  </div>
			</div>
			<div class="form-group">
			  <label for="year">도로명 주소:</label>
			  <input class="form-control" id="sample4_roadAddress" name="address" type="text" value="${userInfo.address }">
			</div>
			
			<button type="button" id="uptBtn" class="btn btn-primary">주소 수정</button>
					
		<%-- <div>
		<input type="hidden" name="user_id" value="${userInfo.user_id }"/>
			<div>이름 : <input id="real_name" type="text" name="real_name" value="${userInfo.real_name }"></div>
			<div>주소(API가능?)<input id="address" type="text" name="address" value="${userInfo.address }"></div>
			<div>우편번호(API가능?) : <input id="zip_code" type="text" name="zip_code" value="${userInfo.zip_code }"></div>
			<div>전화번호<input id="phone_number" type="text" name="phone_number" value="${userInfo.phone_number }"></div>
			<!-- TODO 비밀번호 검사 -->
			<!-- <div>현재 비밀번호(필수)<input type="password" name="password" id="password" value=""></div> -->
			<button type="button" id="uptBtn">주소 수정</button>
		</div> --%>
		</form>
	</div>
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</html>