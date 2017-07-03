<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userPayment</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<style type="text/css"></style>
</head>
<body>
	<div>
		<h3>myPage(왼쪽자리 확보 후 이 메세지 삭제)</h3>
		<jsp:include page="myPageNav.jsp" flush="false" />
	</div>
	<br>
	<%--<input type="hidden" name="user_id" value="${mem.user_id }" /> --%>
	<form method="post">
		<fieldset>
			<!-- Form Name -->
			<legend>Wirte</legend>
			<div>
				<!-- 쪽지작성_기본(
				message_id/user_id/sender_id/message_title/message_conten/receive_check/send_date
				자동생성=> 메세지번호/ 발신자/ 수신여부/ 발신일) -->
				<!-- 메세지 API툴 있으면 좋을듯.. -->
				
				<label for="sender_id">SENDER_ID(자산의 user_id : ${mem.user_id }) 완성후 라벨삭제</label>
				<div>
					<input id="sender_id" type="hidden" name="sender_id"
						value="${mem.user_id }">
				</div>
				<%--
					TODO 이름으로 검색 후 삽입이 좋을 듯.. 일단은직접 아이디 입력으로 진행. 
					<div>
						<div>수신자 검색(같은 이름일수 있기때문에 검색으로 id값 받아야됨)</div>
						<input id="user_id" type="hidden" value="${msg.user_id }">
					</div>
				 --%>
				<label for="user_id">USER_ID</label>
				<div>
					<input id="user_id" type="text" name="user_id"
						placeholder="user_id" />
				</div>
				<label for="message_title">MESSAGE_TITLE</label>
				<div>
					<input id="message_title" type="text" name="message_title"
						placeholder="제목없음">
				</div>

				<label for="message_conten">MESSAGE_CONTEN</label>
				<div>
				<textarea rows="10" cols="120" name="message_conten"
					placeholder="사랑을 담아 메세지를 작성하세요~!"></textarea>
				</div>
			</div>
		</fieldset>
	</form>
	<br />

	<!-- 쪽지작성_기본(
				message_id/user_id/sender_id/message_title/message_conten/receive_check/send_date
				자동생성=> 메세지번호/ 발신자/ 수신여부/ 발신일) -->
	<div>receiveBox</div>
	<div>
		<c:if test="${receiveBox=='nothing' }">
			<div>수신된 메세지가 없습니다.</div>
		</c:if>
		<c:forEach var="receiveBoxJspOnly" items="${receiveBox }">
			<div>
				<!-- TODO 메세지 클릭시 새창으로 쪽지 띄우기 -->
				<input id="receiveBox" type="hidden" name="message_id"
					value="${receiveBoxJspOnly.message_id }" />
				<div>sender_id :</div>
				<!-- TODO sender_id를 user_name으로 변경해야함. -->
				<div>${receiveBoxJspOnly.sender_id}</div>
				<div>message_title :</div>
				<div>${receiveBoxJspOnly.message_title}</div>
				<div>message_conten :</div>
				<div>${receiveBoxJspOnly.message_conten}</div>
				<div>send_date :</div>
				<div>${receiveBoxJspOnly.send_date}</div>
				<div>receive_check :</div>
				<div>${receiveBoxJspOnly.receive_check}</div>
			</div>
		</c:forEach>
	</div>
	<br />
	<div>sendBox</div>
	<div>
		<c:if test="${sendBox=='nothing' }">
			<div>수신된 메세지가 없습니다.</div>
		</c:if>
		<c:forEach var="sendBoxJspOnly" items="${sendBox }">
			<div>
				<!-- TODO 메세지 클릭시 새창으로 쪽지 띄우기 -->
				<input id="sendBox" type="hidden" name="message_id"
					value="${sendBoxJspOnly.message_id }" />
				<!-- TODO sender_id를 user_name으로 변경해야함. -->
				<div>user_id :</div>
				<div>${sendBoxJspOnly.user_id}</div>
				<div>message_title :</div>
				<div>${sendBoxJspOnly.message_title}</div>
				<div>message_conten :</div>
				<div>${sendBoxJspOnly.message_conten}</div>
				<div>send_date :</div>
				<div>${sendBoxJspOnly.send_date}</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>