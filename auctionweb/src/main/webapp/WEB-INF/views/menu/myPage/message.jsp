<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userPayment</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
=======
>>>>>>> dec723104346d8b1a6db58752c1e415e824b4769
<script type="text/javascript">
	$(document).ready(function() {
		$("#messageBtn").click(function(){
			$("form").attr("action", "${path }/auction/myPage/messageInsert.do");
			alert("메세지 전송");
			$("form").submit();
		});
		//수신함 클릭했을때.
		$(".receiveBox").closest("div").click(function(){
			/* if($(this+" .checkNo").html() == 0 ){ */
				alert("옹:"+$(this+" .checkNo").html());
				alert($(this).children().val());
				$(location).attr("href","${path}/auction/myPage/messageReceiveCheck.do?message_id="+$(this).children().val());
			/* } */
		});
	});
</script>
<div class="col-sm-3">
	<jsp:include page="myPageNav.jsp" flush="false" />
</div>
<br>
<%--<input type="hidden" name="user_id" value="${mem.user_id }" /> --%>
<div class="col-sm-9">
	<form method="post">
		<fieldset>
			<!-- Form Name -->
			<legend>Wirte</legend>
			<div>
				<!-- 쪽지작성_기본(
				message_id/user_id/sender_id/message_title/message_content/receive_check/send_date
				자동생성=> 메세지번호/ 발신자/ 수신여부/ 발신일) -->
				<!-- 메세지 API툴 있으면 좋을듯.. -->
				
				<label for="sender_id">SENDER_ID(user_id 확인 : ${mem.user_id })</label>
				<div>
<<<<<<< HEAD
					<!-- 쪽지작성_기본(
					message_id/user_id/sender_id/message_title/message_content/receive_check/send_date
					자동생성=> 메세지번호/ 발신자/ 수신여부/ 발신일) -->
					<!-- 메세지 API툴 있으면 좋을듯.. -->

					<label for="sender_id">SENDER_ID(user_id 확인 : ${mem.user_id })</label>
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
					<label for="receiver_id">RECEIVER_ID</label>
					<div>
						<input id="receiver_id" type="text" name="receiver_id"
							placeholder="receiver_id" />
					</div>
					<label for="message_title">MESSAGE_TITLE</label>
					<div>
						<input id="message_title" type="text" name="message_title"
							placeholder="제목없음">
					</div>

					<label for="message_content">MESSAGE_CONTENT</label>
					<div>
						<!-- <input id="message_content" type="text" name="message_content" placeholder="일단 텍스트" /> -->
						<textarea rows="10" cols="120" name="message_content"
							placeholder="사랑을 담아 메세지를 작성하세요~!"></textarea>
=======
					<input id="sender_id" type="hidden" name="sender_id" value="${mem.user_id }">
				</div>
				<%--
					TODO 이름으로 검색 후 삽입이 좋을 듯.. 일단은직접 아이디 입력으로 진행. 
					<div>
						<div>수신자 검색(같은 이름일수 있기때문에 검색으로 id값 받아야됨)</div>
						<input id="user_id" type="hidden" value="${msg.user_id }">
>>>>>>> dec723104346d8b1a6db58752c1e415e824b4769
					</div>
				 --%>
				<label for="receiver_id">RECEIVER_ID</label>
				<div>
					<input id="receiver_id" type="text" name="receiver_id"
						placeholder="receiver_id"/>
				</div>
<<<<<<< HEAD
			</fieldset>
			<button type="button" id="messageBtn" class="btn btn-primary">메세지
				발송</button>
		</form>
		<br />

		<!-- 쪽지작성_기본(
					message_id/user_id/sender_id/message_title/message_conten/receive_check/send_date
					자동생성=> 메세지번호/ 발신자/ 수신여부/ 발신일) -->
		<div>
			<h1>receiveBox</h1>
		</div>
		<div>
			<c:if test="${receiveBox=='nothing' }">
				<div>수신된 메세지가 없습니다.</div>
			</c:if>
			<c:if test="${receiveBox!='nothing' }">
				<c:forEach var="receiveBoxJspOnly" items="${receiveBox }">
					<div>
						<!-- TODO 메세지 클릭시 새창으로 쪽지 띄우기 -->
						<input class="receiveBox" type="hidden" name="message_id"
							value="${receiveBoxJspOnly.message_id }" />
						<div>sender_id :</div>
						<!-- TODO sender_id를 user_name으로 변경해야함. -->
						<div>${receiveBoxJspOnly.sender_id}</div>
						<div>message_title :</div>
						<div>${receiveBoxJspOnly.message_title}</div>
						<div>message_conten :</div>
						<div>${receiveBoxJspOnly.message_content}</div>
						<div>send_date :</div>
						<div>${receiveBoxJspOnly.send_date}</div>
						<!-- 아래 클래스값 지우지 말것 넘겨주는 데이터  -->
						<div>receive_check : 
							<div class="checkNo">${receiveBoxJspOnly.receive_check}</div>
						</div>
					</div>
					<hr />
				</c:forEach>
			</c:if>
		</div>
		<br />
		<div>
			<h1>sendBox</h1>
		</div>
		<div>
			<c:if test="${sendBox=='nothing' }">
				<div>발신된 메세지가 없습니다.</div>
			</c:if>
			<c:if test="${sendBox!='nothing' }">
				<c:forEach var="sendBoxJspOnly" items="${sendBox }">
					<div>
						<!-- TODO 메세지 클릭시 새창으로 쪽지 띄우기 -->

						<input class="sendBox" type="hidden" name="message_id"
							value="${sendBoxJspOnly.message_id }" />
						<!-- TODO sender_id를 user_name으로 변경해야함. -->
						<div>receiver_id :</div>
						<div>${sendBoxJspOnly.receiver_id}</div>
						<div>message_title :</div>
						<div>${sendBoxJspOnly.message_title}</div>
						<div>message_content :</div>
						<div>${sendBoxJspOnly.message_content}</div>
						<div>send_date :</div>
						<div>${sendBoxJspOnly.send_date}</div>
						<div>receive_check :</div>
						<div>${sendBoxJspOnly.receive_check}</div>
					</div>
					<hr />
				</c:forEach>
			</c:if>
		</div>
=======
				<label for="message_title">MESSAGE_TITLE</label>
				<div>
					<input id="message_title" type="text" name="message_title"
						placeholder="제목없음">
				</div>

				<label for="message_content">MESSAGE_CONTENT</label>
				<div>
				<!-- <input id="message_content" type="text" name="message_content" placeholder="일단 텍스트" /> -->
				<textarea rows="10" cols="120" name="message_content"
					placeholder="사랑을 담아 메세지를 작성하세요~!"></textarea>
				</div>
			</div>
		</fieldset>
		<button type="button" id="messageBtn" class="btn btn-primary">메세지 발송</button>
	</form>
	<br />

	<!-- 쪽지작성_기본(
				message_id/user_id/sender_id/message_title/message_conten/receive_check/send_date
				자동생성=> 메세지번호/ 발신자/ 수신여부/ 발신일) -->
	<div><h1>receiveBox</h1></div>
	<div>
		<c:if test="${receiveBox=='nothing' }">
			<div>수신된 메세지가 없습니다.</div>
		</c:if>
		<c:if test="${receiveBox!='nothing' }">
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
				<div>${receiveBoxJspOnly.message_content}</div>
				<div>send_date :</div>
				<div>${receiveBoxJspOnly.send_date}</div>
				<div>receive_check :</div>
				<div>${receiveBoxJspOnly.receive_check}</div>
			</div>
			<hr/>
		</c:forEach>
		</c:if>
	</div>
	<br />
	<div><h1>sendBox</h1></div>
	<div>
		<c:if test="${sendBox=='nothing' }">
			<div>발신된 메세지가 없습니다.</div>
		</c:if>
		<c:if test="${sendBox!='nothing' }">
		<c:forEach var="sendBoxJspOnly" items="${sendBox }">
			<div>
				<!-- TODO 메세지 클릭시 새창으로 쪽지 띄우기 -->
				
				<input id="sendBox" type="hidden" name="message_id"
					value="${sendBoxJspOnly.message_id }" /> 
				<!-- TODO sender_id를 user_name으로 변경해야함. -->
				<div>receiver_id :</div>
				<div>${sendBoxJspOnly.receiver_id}</div>
				<div>message_title :</div>
				<div>${sendBoxJspOnly.message_title}</div>
				<div>message_content :</div>
				<div>${sendBoxJspOnly.message_content}</div>
				<div>send_date :</div>
				<div>${sendBoxJspOnly.send_date}</div>
				<div>receive_check :</div>
				<div>${sendBoxJspOnly.receive_check}</div>
			</div>
			<hr/>
		</c:forEach>
		</c:if>
>>>>>>> dec723104346d8b1a6db58752c1e415e824b4769
	</div>
</div>
