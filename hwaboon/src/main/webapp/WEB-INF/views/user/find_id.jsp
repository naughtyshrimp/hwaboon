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
				<span>아이디 찾기</span>
			</h1>
		</div>
		
		<form action="<c:url value=''/>" method="post">
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
	
	
	
	let chk1 = false;
	
	//이메일
	$('#user_email').on('keyup', function() {
		if($("#user_email").val() === ""){
			//이메일 입력값이 검증
			$('#emailMsg').html('<b>이메일을 입력해주세요.</b>');
			chk1 = false;
		} else if(!getMail.test($("#user_email").val())) {
			//이메일 유효성 검사
			$('#emailMsg').html('<b>올바르지않는 이메일 형식입니다.</b>');	  
			chk1 = false;
		} else {
			$('#emailMsg').html('');
			chk1 = true;
		} 

	});//end of email
	
	
	//찾기 요청
	$('#find_btn').click(function(e) {
		const userEmail = $('#user_email').val();
		if(chk1 === true) {
			$.ajax({
				type: "POST",
				url: "/user/findId",
	            headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: userEmail,
	            success: function(result) {
	            	console.log("result: " + result);
	            	if(result === "") {
	            		alert('일치하는 회원정보가 없습니다.');
	            	} else {
	            		alert('회원님의 아이디는 ' + result + '입니다.');
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


