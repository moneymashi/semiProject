<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MenuHome</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

/* @@@주의@@
 * 가정용으로 코딩을위해 root-context바꿈. 
 
 <property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:xe"/>
    <property name="username" value="auction"/>
    <property name="password" value="1111"/> */

	$(document).ready(function() {
		 $("#checkAllPaying").click(function(){
			var password = $("#password").val();
			if(password == ""){
				alert("결제확인을 위해 비밀번호를 입력해 주세요.");
				$("#password").focus();
				return;
			}
			if( !$("input[name = checkWarning]").is(":checked") ){
				 alert("계약서 유의사항에 체크해주셔야 합니다.");
				 $("input[name = checkWarning]").focus();
				 return;
			 }
			if($("input[name = password]").val()  != "${mem.password}" ){
				alert("비밀번호가 틀리셨습니다. 다시 입력해주세요.");
				$("input[name = password]").val("");
				$("input[name = password]").focus();
				return;
			}
			
			$("form").attr("action", "${path }/myPage/payTheWinProc.do");
			alert("결제 완료되셨습니다. \n 물품배송은 일주일이내로 도착하게됩니다. :) ");
			$("form").submit();
			
			
			// "${mem.password}" 가 이전 페이지 비밀번호 넘기는값.
		});
		
		
		
	
	});
    
    
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<c:import url="../../main/header.jsp" />
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<div>
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	<br>
	
	<%--
		@ModelAttribute("bidSch") Bid bidSch , 
			@ModelAttribute("userSch") User userSch,
			@ModelAttribute("paymentSch") Payment paymentSch,
			Model d
			){
		d.addAttribute("bidLists", service.payTheWin01(bidSch));
		d.addAttribute("userLists", service.payTheWin02(userSch) );
		d.addAttribute("itemLists", service.payTheWin03(paymentSch) );
		
		winpay1  - item 
		winpay2 -  bid
		mem - auction_user.
	 --%>
	<form>
	<div>
		<div>${mem.user_name}님! 낙찰 축하드립니다!</div>
		<c:set var = "winpay1" value = "${winpay1 }" />
		<c:set var = "mem" value = "${mem }" />
		<div>
			<a href = '${path }/board/list.do?auction_id=<c:out value = "${winpay1.auction_id }" />' >
				낙찰물품 id: ${winpay1.auction_id }
				<br/>낙찰물품 name: ${winpay1.item_name }
			</a>
		</div>
		<div>낙찰 확정일: ${winpay1.end_date }</div>
		
		<div>낙찰자 정보 확인</div>
		<c:if test = "${mem.user_point < winpay1.current_bid_amount }" >
			<a href = "${path }/### 포인트 충전 페이지 ###" >
				포인트를 충전해주세요!
			</a>
		</c:if>
		<c:if test = "${mem.user_point >= winpay1.current_bid_amount }" >
			<div>배송 받으실분 : ${mem.real_name }</div>
			<div>배송지 : ${mem.address }</div>
			<div>현재 포인트: ${mem.user_point }</div>
			<div>낙찰 금액: ${winpay1.current_bid_amount}</div>
			<div>입금처리 후 잔여포인트: ${ mem.user_point - winpay1.current_bid_amount }</div> 
				<input type = "hidden" name = "user_id" value = "${ mem.user_id }" />
				<input type = "hidden" name = "user_point" value = "${ mem.user_point - winpay1.current_bid_amount }" />
			<div>주의사항 : <br/>
					<a href = "http://t.bestizdiet.net/ab-4154292-26&PB_1365066159=3&OTSKIN=layout_ptr.php&SI_F_serial_num=asc">
						주의사항 전문보기
					</a>
					<div class="checkbox">
				  <label><input type="checkbox" name = "checkWarning" >위 주의사항을 읽고 숙지했으며 위 사안들에 대해 동의합니다.</label>
					</div>
			</div>
		</c:if>
		<div>계약 작성 확인 :<input type="password" name="password" /></div>
		
		
		<input type="button" id="checkAllPaying" value = "계약서 작성완료" />
		<button type="reset" >다시작성하기</button>
	</div>
	</form>
</body>
</html>