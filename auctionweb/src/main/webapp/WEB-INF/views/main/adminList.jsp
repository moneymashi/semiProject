<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>♪list</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<br>
	<div class="">
		<div class="yTitle">
			<h1>관리자용리스트</h1>
		</div>
		<hr />
		<hr />
		<form method="post">
			<table border="1">
				<tr>
					<td>userId<input type="text" name="user_id"
						value="${AUCTION_USER.user_id }" /></td>
					<td>email<input type="text" name="email"
						value="${AUCTION_USER.email }" /></td>
					<td><input type="submit" value="유저정보" /></td>
				</tr>
			</table>
		</form>
		<hr />
		<table border="1">
			<tr>
				<th>▒</th>
				<th colspan="7"><h3>AUCTION_USER(회원정보)</h3></th>
				<th>▒</th>
				<th colspan="5"><h3>AUCTION_USER(배송지정보)</h3></th>
				<th>▒</th>
			</tr>
			<tr>
				<th>▒</th>
				<th>USER_ID NUMBER (10)</th>
				<th>USER_NAME VARCHAR2 (100)</th>
				<th>EMAIL VARCHAR2 (40)</th>
				<th>PASSWORD VARCHAR2 (20)</th>
				<th>REGISTER_DATE DATE DEFAULT SYSDATE</th>
				<th>AUTH NUMBER (1) DEFAULT 1</th>
				<th>USER_POINT NUMBER (10) DEFAULT 0</th>
				<th>▒</th>
				<th>REAL_NAME VARCHAR2 (100)</th>
				<th>ADDRESS VARCHAR2 (100)</th>
				<th>ZIP_CODE VARCHAR2 (5)</th>
				<th>PHONE_NUMBER VARCHAR2 (11)</th>
				<th>PICTURE_LOCATION VARCHAR2 (500)</th>
				<th>▒</th>
			</tr>
			<c:forEach var="au1JspOnly" items="${auction_user }">
				<tr>
					<td>▒</td>
					<td>${au1JspOnly.user_id}</td>
					<td>${au1JspOnly.user_name}</td>
					<td>${au1JspOnly.email}</td>
					<td>${au1JspOnly.password}</td>
					<td>${au1JspOnly.register_date}</td>
					<td>${au1JspOnly.auth}</td>
					<td>${au1JspOnly.user_point}</td>
					<td>▒</td>
					<td>${au1JspOnly.real_name}</td>
					<td>${au1JspOnly.address}</td>
					<td>${au1JspOnly.zip_code}</td>
					<td>${au1JspOnly.phone_number}</td>
					<td>${au1JspOnly.picture_location}</td>
					<td>▒</td>
				</tr>
			</c:forEach>
		</table>
		<hr />
		<hr />
		<form method="post">
			<table border="1">
				<tr>
					<td>userId<input type="text" name="user_id"
						value="${USER_PAYMENT.user_id }" /></td>
					<td><input type="submit" value="카드정보" /></td>
				</tr>
			</table>
		</form>
		<hr />
		<table border="1">
			<tr>
				<th>▒</th>
				<th colspan="7"><h3>USER_PAYMENT(카드정보)</h3></th>
				<th>▒</th>
			</tr>
			<tr>
				<th>▒</th>
				<th>USER_ID         NUMBER (10)</th>
				<th>CARD_ID         NUMBER (10)</th>
				<th>CVC             NUMBER (3)</th>
				<th>MONTH           NUMBER (2)</th>
				<th>YEAR            NUMBER (2)</th>
				<th>CARD_COMPANY    VARCHAR2 (100)</th>
				<th>SERIAL_NUMBER   VARCHAR2 (20)</th>
				<th>▒</th>
			</tr>
			<c:forEach var="upJspOnly" items="${user_payment }">
				<tr>
					<td>▒</td>
					<td>${ai1JspOnly.user_id}</td>
					<td>${ai1JspOnly.card_id}</td>
					<td>${ai1JspOnly.cvc}</td>
					<td>${ai1JspOnly.month}</td>
					<td>${ai1JspOnly.year}</td>
					<td>${ai1JspOnly.card_company}</td>
					<td>${ai1JspOnly.serial_number}</td>
					<td>▒</td>
				</tr>
			</c:forEach>
		</table>
		<hr />
		<hr />
		<form method="post">
			<table border="1">
				<tr>
					<td>auctioneer_id<input type="text" name="auctioneer_id"
						value="${AUCTIONEER_INFO.auctioneer_id }" /></td>
					<td><input type="submit" value="판매자확인" /></td>
				</tr>
			</table>
		</form>
		<hr />
		<table border="1">
			<tr>
				<th>▒</th>
				<th colspan="6"><h3>AUCTIONEER_INFO(판매자 정보)</h3></th>
				<th>▒</th>
			</tr>
			<tr>
				<th>▒</th>
				<th>AUCTIONEER_ID      NUMBER (10)</th>
				<th>AUCTIONEER_LEVEL   NUMBER (1) DEFAULT 0</th>
				<th>SATISFACTION       NUMBER (3) DEFAULT 0</th>
				<th>BANK_NAME          VARCHAR2 (100)</th>
				<th>ACCOUNT_NAME       VARCHAR2 (100)</th>
				<th>ACCOUNT_NUMBER     VARCHAR2 (20)</th>
				<th>▒</th>
			</tr>
			<c:forEach var="ai1JspOnly" items="${auctioneer_info }">
				<tr>
					<td>▒</td>
					<td>${ai1JspOnly.auctioneer_id}</td>
					<td>${ai1JspOnly.auctioneer_level}</td>
					<td>${ai1JspOnly.satisfaction}</td>
					<td>${ai1JspOnly.bank_name}</td>
					<td>${ai1JspOnly.account_name}</td>
					<td>${ai1JspOnly.account_number}</td>
					<td>▒</td>
				</tr>
			</c:forEach>
		</table>
		<hr />
		<hr />
		<form method="post">
			<table border="1">
				<tr>
					<td>userId<input type="text" name="receiver_id"
						value="${USER_MESSAGE1.receiver_id }" /></td>
					<td><input type="submit" value="수신자확인" /></td>
				</tr>
			</table>
		</form>
		<hr />
		<table border="1">
			<tr>
				<th>▒</th>
				<th colspan="7"><h3>USER_MESSAGE(수신정보)</h3></th>
				<th>▒</th>
			</tr>
			<tr>
				<th>▒</th>
				<th>RECEIVER_ID       NUMBER (10)</th>
				<th>MESSAGE_ID        NUMBER (10)</th>
				<th>SENDER_ID         NUMBER (10)</th>
				<th>MESSAGE_TITLE     VARCHAR2 (100)</th>
				<th>MESSAGE_CONTENT   VARCHAR2 (3000)</th>
				<th>RECEIVE_CHECK     NUMBER (1) DEFAULT 0</th>
				<th>SEND_DATE         DATE DEFAULT SYSDATE</th>
				<th>▒</th>
			</tr>
			<c:forEach var="um1JspOnly" items="${user_message1 }">
				<tr>
					<td>▒</td>
					<td>${um1JspOnly.receiver_id}</td>
					<td>${um1JspOnly.message_id}</td>
					<td>${um1JspOnly.sender_id}</td>
					<td>${um1JspOnly.message_title}</td>
					<td>${um1JspOnly.message_content}</td>
					<td>${um1JspOnly.receive_check}</td>
					<td>${um1JspOnly.send_date}</td>
					<td>▒</td>
				</tr>
			</c:forEach>
		</table>
		<hr />
		<hr />
		<form method="post">
			<table border="1">
				<tr>
					<td>sender_id<input type="text" name="sender_id"
						value="${USER_MESSAGE2.sender_id }" /></td>
					<td><input type="submit" value="발신자확인" /></td>
				</tr>
			</table>
		</form>
		<hr />
		<table border="1">
			<tr>
				<th>▒</th>
				<th colspan="7"><h3>USER_MESSAGE(발신정보)</h3></th>
				<th>▒</th>
			</tr>
			<tr>
				<th>▒</th>
				<th>SENDER_ID         NUMBER (10)</th>
				<th>MESSAGE_ID        NUMBER (10)</th>
				<th>RECEIVER_ID           NUMBER (10)</th>
				<th>MESSAGE_TITLE     VARCHAR2 (100)</th>
				<th>MESSAGE_CONTENT   VARCHAR2 (3000)</th>
				<th>RECEIVE_CHECK     NUMBER (1) DEFAULT 0</th>
				<th>SEND_DATE         DATE DEFAULT SYSDATE</th>
				<th>▒</th>
			</tr>
			<c:forEach var="um2JspOnly" items="${user_message2 }">
				<tr>
					<td>▒</td>
					<td>${um2JspOnly.sender_id}</td>
					<td>${um2JspOnly.message_id}</td>
					<td>${um2JspOnly.receiver_id}</td>
					<td>${um2JspOnly.message_title}</td>
					<td>${um2JspOnly.message_content}</td>
					<td>${um2JspOnly.receive_check}</td>
					<td>${um2JspOnly.send_date}</td>
					<td>▒</td>
				</tr>
			</c:forEach>
		</table>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</body>
</html>