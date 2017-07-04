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
<link rel="stylesheet" href="resources/css/test.css">
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<br>
	<div class="">

		<div class="yTitle">관리자용리스트</div>

		<form method="post">
			<table border="1">
				<tr>
					<td>userId<input type="text" name="user_id"
						value="${testCtrlModelAttribute.user_id }" /></td>
					<td>email<input type="text" name="email"
						value="${testCtrlModelAttribute.email }" /></td>
					<td><input type="submit" value="???" /></td>
				</tr>
			</table>
		</form>
		<table border="1">
			<tr>
				<th>USER_ID NUMBER (10)</th>
				<th>USER_NAME VARCHAR2 (100)</th>
				<th>EMAIL VARCHAR2 (40)</th>
				<th>PASSWORD VARCHAR2 (20)</th>
				<th>REGISTER_DATE DATE DEFAULT SYSDATE</th>
				<th>AUTH NUMBER (1) DEFAULT 1</th>
				<th>USER_POINT NUMBER (10) DEFAULT 0</th>
				<th>REAL_NAME VARCHAR2 (100)</th>
				<th>ADDRESS VARCHAR2 (100)</th>
				<th>ZIP_CODE VARCHAR2 (5)</th>
				<th>PHONE_NUMBER VARCHAR2 (11)</th>
				<th>PICTURE_LOCATION VARCHAR2 (500)</th>
				<c:forEach var="acListJspOnly" items="${ttt }">
					<tr>
						<td>${acListJspOnly.user_id}</td>
						<td>${acListJspOnly.user_name}</td>
						<td>${acListJspOnly.email}</td>
						<td>${acListJspOnly.password}</td>
						<td>${acListJspOnly.register_date}</td>
						<td>${acListJspOnly.auth}</td>
						<td>${acListJspOnly.user_point}</td>
						<td>${acListJspOnly.real_name}</td>
						<td>${acListJspOnly.address}</td>
						<td>${acListJspOnly.zip_code}</td>
						<td>${acListJspOnly.phone_number}</td>
						<td>${acListJspOnly.picture_location}</td>
					</tr>
				</c:forEach>
		</table>
	</div>
</body>
</html>