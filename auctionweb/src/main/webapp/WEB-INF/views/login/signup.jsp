<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>LoginSignUp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#signBtn").click(function() {
			var email = $("#email").val();
			var password = $("#password").val();
			var password2 = $("#password2").val();
			/* 			if (email == "") {
			 alert("E-mail을 입력하세요");
			 $("#email").focus();
			 return;
			 } */
			if (password == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			if (password != password2) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#password2").focus();
				return;
			}
			//인증번호 확인
			if (code == $("#signUpCode").val() && timer > 0) {
				$("form").attr("action", "${path}/login/signUpProc.do");
				$("form").submit();
			} else if (code == $("#signUpCode").val() && timer <= 0) {
				alert("시간이초과되었습니다. 인증번호를 다시 발송해주세요.");
			} else if (code != $("#signUpCode").val()) {
				alert("인증번호가 잘못되엇습니다.");
			}
			alert("code:" + code);
			alert("$(\"#signUpCode\").val():" + $("#signUpCode").val());

		});
		// 인증번호 생성
		$("#signCodeBtn").click(function() {
			var randomCode = Math.floor(Math.random() * 9999) + 1;
			if (randomCode < 10) {
				code = "000" + randomCode;
			} else if (randomCode >= 10 && randomCode < 100) {
				code = "00" + randomCode;
			} else if (randomCode >= 100 && randomCode < 1000) {
				code = "0" + randomCode;
			} else {
				code = "" + randomCode;
			}
			$("#signMailContent").val("귀하의 인증번호는 [ "+code+" ] 입니다");
			clearTimeout(timeout);
			codeTimer(180);
			
			var email = $("#email").val();
			var signMailTitle = $("#signMailTitle").val();
			var signMailContent = $("#signMailContent").val();
			
			$.ajax({
				type : 'POST',
				data : "email=" + email+"&signMailTitle="+signMailTitle+"&signMailContent="+signMailContent,
				dataType : 'text',
				url : '${path}login/codeSend.do',
				success : alert("인증번호가"+ $("#email").val()+"(으)로 발송되었습니다.")
					/* function(rData, textStatus, xhr) {
					var chkRst = rData;
					if (chkRst == 0) {
						alert("등록 가능 합니다.");
						$("#emailChk").val('Y');
					} else {
						alert("중복 되어 있습니다.");
						$("#emailChk").val('N');
					}
				} */,
				error : function(xhr, status, e) {
					alert("에러:"+e);
				}
			});
			
		});
	});
	var code = "notnull";
	var timer = 0;
	var timeout;
	function codeTimer(t) {
		timer = t;
		if (timer-- > 0) {
			timeout = setTimeout(function() {
				minutes = parseInt(timer / 60 % 60, 10);
				seconds = parseInt(timer % 60, 10);
				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;
				$('#codeTime').text(minutes + ":" + seconds);
				codeTimer(timer);
			}, 1000);
		} else {
			$('#codeTime').text("인증시간종료");
		}
	}

	//자바 랜덤수 로직
	/* public static int generateNumber(int length) {
	    String numStr = "1";
	    String plusNumStr = "1";
	    for (int i = 0; i < length; i++) {
	        numStr += "0";
	 
	        if (i != length - 1) {
	            plusNumStr += "0";
	        }
	    }
	    Random random = new Random();
	    int result = random.nextInt(Integer.parseInt(numStr)) + Integer.parseInt(plusNumStr);
	 
	    if (result > Integer.parseInt(numStr)) {
	        result = result - Integer.parseInt(plusNumStr);
	    }
	    return result;
	} */
	function chkDupEmail() {
		var prmEmail = $('#email').val();
		if ($("#email").val() == '') {
			alert('email를 입력해주세요.');
			$("#email").focus();
			return;
		}

		$.ajax({
			type : 'POST',
			data : "prmEmail=" + prmEmail,
			dataType : 'text',
			url : '${path}login/chkDupEmail.do',
			success : function(rData, textStatus, xhr) {
				var chkRst = rData;
				if (chkRst == 0) {
					alert("등록 가능 합니다.");
					$("#emailChk").val('Y');
				} else {
					alert("중복 되어 있습니다.");
					$("#emailChk").val('N');
				}
			},
			error : function(xhr, status, e) {
				alert("에러:"+e);
			}
		});
	}
	

	// 등록....
	function insertChk() {
		var frm = document.companyForm;
		if (!chkVal('email', '이메일'))
			return false;
		if ($("#emailChk").val() == 'N') {
			alert('Email 중복확인을 해주세요');
			return;
		}
	}
</script>
<style type="text/css">
body {
	padding-top: 60px;
}

form>div {
	margin: 15px 0;
}
</style>
</head>
<body>
	<div>
		<c:import url="../main/header.jsp" />
	</div>
	<br>
	<br>

	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">회원가입</div>
				</div>
				<div class="panel-body">
					<!-- Form Name -->
					<form method="post">
						<div class="form-group">
							<div class=" col-sm-12">
								<label class=" control-label" for="email">E-mail</label>
							</div>
							<div class=" col-sm-9">
								<!-- Text input-->
								<input type="hidden" id="emailChk" value="N" />
								<!-- ID체크 했는지, 안했는지. -->
								<input class=" form-control " id="email" name="email"
									type="text" placeholder="E-mail을 입력하세요." autofocus>
							</div>
							<div class=" col-sm-3">
								<input class=" form-control btn btn-primary " type="button"
									value="중복확인" onclick="javascript:chkDupEmail();" />
							</div>
						</div>
						<div class="form-group col-sm-12">
							<div class="">
								<!-- Text input-->
								<label class=" control-label" for="user_name">USER_NAME</label>
								<input class="form-control" id="user_name" name="user_name"
									type="text" placeholder="이름을 입력하세요.">
							</div>
						</div>
						<div class="form-group ">
							<div class="col-sm-12">
								<!-- Password input-->
								<label class=" control-label" for="password">PASSWORD</label> <input
									id="password" name="password" type="password"
									placeholder="비밀번호를 입력하세요" class="form-control input-md">
							</div>
						</div>
						<div class="form-group col-sm-12">
							<!-- Password input-->
							<label class=" control-label" for="password2">REPEAT
								PASSWORD</label> <input id="password2" type="password"
								placeholder="비밀번호를 다시 입력하세요." class="form-control input-md">
						</div>


						<div class="form-group">
							<div class=" col-sm-12">
								<label class=" control-label" for="signUpCode">인증번호(미구현)</label>
							</div>
							<div class=" col-sm-9">
								<input id="signUpCode" type="text" placeholder="인증번호"
									class="form-control input-md">
							</div>
							<div class=" col-sm-3">
								<div id="signCodeBtn" class="btn btn-primary">	인증번호발송</div>
								<input type="hidden" class="form-control" name="signMailTitle" id="signMailTitle"
									value="옥션 인증번호입니다.">
								<input type="hidden" class="form-control" name="signMailContent" id="signMailContent"
									value="">
							</div>
							<div class=" col-sm-12">
								<div id="signUpCode2" style="display: inline"></div>
								<span class="glyphicon glyphicon-time"></span>
								<div id="codeTime" style="display: inline"></div>
							</div>
						</div>
						<!-- Button -->
						<div class="form-group col-md-12">
							<label class=" control-label" for="submit"></label>
							<button id="signBtn" name="button" class="btn btn-primary">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>