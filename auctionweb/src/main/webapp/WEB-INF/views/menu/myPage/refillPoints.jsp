<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>
	<div class="col-sm-3">
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	
	<div class="col-sm-7">
	<c:choose>
		<c:when test="${payInfo.serial_number }">
			<a href="${path }/myPage/userPayment.do"> 카드를 등록해주세요! </a>
		</c:when>
	<c:otherwise>
		<form>
			<div class="form-group">
			      <label for="payInfo_id">payInfo_id:</label>
			      <input type="text" class="form-control" id="payInfo_id" value="${payInfo.user_id}" disabled>
			</div>
										
			<div class="form-group" style = 'display: none;'>
			      <label for="session_id">session_id:</label>
			      <input type="text" class="form-control" id="session_id" value="${mem.user_id }" disabled>
			</div>
			<c:set var="payidserver" value="${payInfo.user_id }" />
			<div class="form-group">
			      <label for="session_id">카드회사:</label>
			      <input type="text" class="form-control" name="card_company" id="card_company" value="${payInfo.card_company }" disabled>
			</div>
			<div class="form-group">
			      <label for="serial_number">카드번호:</label> <a href="${path }/myPage/userPayment.do"> (혹시, 결제카드 변경을 원하시나요?) </a>
			      <input type="text" class="form-control" name="serial_number" id="serial_number" value="${payInfo.serial_number }" disabled>
			</div>
			<%-- <div class="form-group">
			      <label for="cvc">cvc번호:   (비밀번호 대체?)</label>
			      <input type="text" class="form-control" name="cvc" id="cvc" value="${payInfo.cvc }">
			</div> --%>
			<label>유효기간:</label>
			<div class="form-group row">
			  <div class="col-xs-2">
			    <label for="month" >년</label>
			    <input class="form-control" name="month" id="month" type="text" value="${payInfo.month }" disabled>
			  </div>
			  <div class="col-xs-2">
			    <label for="year">월</label>
			    <input class="form-control" name="year" id="year" type="text" value="${payInfo.year }" disabled>
			  </div>
			</div>
			<div class="form-group">
			      <label >현재 포인트: </label>
			      <input type="text" class="form-control" name="user_point_now" value="${mem.user_point }" disabled>
			</div>
			<div class="form-group">
			      <label >충전 포인트: </label>
			      <select name = "refillPoints">
			      	<option value = "0" disabled selected > 선택해주세요! </option>
			      	<option value = "1000"> 1000 </option>
			      	<option value = "3000"> 3000 </option>
			      	<option value = "5250"> 5000 + 250 (+5% 보너스) </option>
			      	<option value = "10800"> 10000 + 800 (+8% 보너스) </option>
			      	<option value = "33000"> 30000 + 3000 (+10% 보너스) </option>
			      	<option value = "115000"> 100000 + 15000 (+15% 보너스) </option>
			      
			      </select>
			</div>
			<div class="form-group">
			      <label >입금처리 후 잔여포인트: </label>
			      <input type="text" class="form-control" name="user_point" value = "${mem.user_point + param.refillPoints }" disabled >
			</div>
			<div> 주의사항 : <br /> 
				<a href="http://t.bestizdiet.net/ab-4154292-26&PB_1365066159=3&OTSKIN=layout_ptr.php&SI_F_serial_num=asc">
					주의사항 전문보기 </a>
				<div class="checkbox">
					<label><input type="checkbox" name="checkWarning">위 주의사항을 읽고 숙지했으며 위 사안들에 대해 동의합니다.</label>
				</div>
			</div>
			
			<input type="hidden" name="user_id" value="${ mem.user_id }" />
			<div>
				충전 확인 :<input type="password" name="password" value = "" placeholder = "결제확인을 위해 비밀번호를 입력해 주세요." />
			</div>
			
			<br>
			<div class="form-group">
			<input type="button" class="btn btn-primary" id="checkAllPaying" value="계약서 작성완료" />
			</div>
			<div class="form-group">
			<button type="reset" class="btn btn-primary">다시작성하기</button>
			</div>
				
		</form>
	</c:otherwise>
	</c:choose>
	
	</div>
	<div class="col-sm-2"></div>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	
		<%--
	
	<div class="footer">
		<c:import url="../../structure/footer.jsp" />
	</div>


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
	<%-- 
</body>
<c:import url="../../structure/tail.jsp" /> --%>
<script type="text/javascript">

	$(document).ready(function() {
		$('select[name = refillPoints]').change(function(){
			var userPoints = parseInt("${ mem.user_point }") + parseInt($(this).val());
			//alert("userPoints   " +  userPoints);
			$('input[name = user_point_now]').val("${ mem.user_point }");
			$('input[name = user_point]').val(userPoints);
		});
	
		$("#checkAllPaying").click(function() {
			var password = $("#password").val();
			if (password == "") {
				alert("결제확인을 위해 비밀번호를 입력해 주세요.");
				$("#password").focus();
				return;
			}
			else if (!$("input[name = checkWarning]").is(":checked")) {
				alert("계약서 유의사항에 체크해주셔야 합니다.");
				$("input[name = checkWarning]").focus();
				return;
			}
			else if ($("input[name = password]").val() != "${mem.password}") {
				alert("비밀번호가 틀리셨습니다. 다시 입력해주세요.");
				$("input[name = password]").val("");
				$("input[name = password]").focus();
				return;
			}

			$("form").attr("action", "${path }/myPage/payTheWinProc.do");
			alert("결제 완료되셨습니다. \n 즐거운 경매하세요. :) ");
			$("form").submit();

		});
			
		
	});
</script>
<!-- </html> -->