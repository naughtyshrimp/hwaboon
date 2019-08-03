<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
<jsp:include page="../include/static-header.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/input-custom.css'/>">
</head>
<body>
<jsp:include page="../include/main-header.jsp"/>

	<div class="container" style="max-width: 460px; padding-top: 100px; padding-bottom: 100px">
		<div id="header" class="form_header" role="banner">
			<h1>
				<span>비밀번호 찾기</span>
			</h1>
		</div>
		
		<form action="<c:url value=''/>" method="post">
			<h3 class="form_title">
				<label class=blind>아이디</label>
			</h3>
			<span class="form_content">
				<input type="text" id="user_id" placeholder="아이디" class="form-control input_box" maxlength="40">
			</span>
			<span class="error_next_box" id="idMsg"></span>
		
		
			<h3 class="form_title">
				<label class=blind>이메일</label>
			</h3>
			<span class="form_content">
				<input type="text" id="user_email" placeholder="이메일" class="form-control input_box" maxlength="40">
			</span>
			<span class="error_next_box" id="emailMsg"></span>

			
			<button type="button" id="find_btn" class="btn_type btn-primary">
				<span>찾기</span>
			</button>
			<button type="button" id="login_btn" class="btn_type btn-primary" style="margin-top: 5px; background-color: #e4e4e5;" onclick="location.href='<c:url value='/user/login'/>'">
				<span>로그인</span>
			</button>

		</form>
		
		
		
	</div>


<jsp:include page="../include/plugin-js.jsp"/>


<script type="text/javascript">

$(function() {
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	let chk1 = false, chk2 = false;
	
	//아이디
	$('#user_id').on('keyup', function() {
		if($("#user_id").val() === ""){
			//아이디 입력값이 검증
			$('#idMsg').html('<b>이메일을 입력해주세요.</b>');
			chk1 = false;
		} else {
			$('#idMsg').html('');
			chk1 = true;
		} 
	});
	
	
	
	//이메일
	$('#user_email').on('keyup', function() {
		if($("#user_email").val() === ""){
			//이메일 입력값이 검증
			$('#emailMsg').html('<b>이메일을 입력해주세요.</b>');
			chk2 = false;
		} else if(!getMail.test($("#user_email").val())) {
			//이메일 유효성 검사
			$('#emailMsg').html('<b>올바르지않는 이메일 형식입니다.</b>');	  
			chk2 = false;
		} else {
			$('#emailMsg').html('');
			chk2 = true;
		} 

	});//end of email
	
	
	//찾기 요청
	$('#find_btn').click(function(e) {
		const userId = $("#user_id").val();
		const userEmail = $("#user_email").val();
		const user = {
            	userId: userId, 
            	userEmail: userEmail
            };
		if(chk1 && chk2) {
			$.ajax({
				type: "POST",
				url: "/user/findPw",
	            headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: JSON.stringify(user),
	            success: function(result) {
	            	console.log("result: " + result);
	            	if(result === "Success") {
	            		alert('이메일로 임시 비밀번호를 발송하였습니다.');
	            		self.location = "/user/login";
	            	} else {
	            		alert('일치하는 회원의 정보가 존재하지 않습니다.');
	            	}
	            }
			});
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});
});


</script>


</body>
</html>


