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
				<span>UPDATE<br>INFORMATION</span>
			</h1>
		</div>
		<form action="<c:url value='/user'/>" method="post">
			<h3 class="form_title">
				<label class="blind ">아이디</label>
				<span class="error_next_box" id="idMsg"></span>
			</h3>
			<span class="form_content blind">
				<input type="text" id="user_id" value="${login.userId }" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			<h3 class="form_title">
				<label class="blind">비밀번호</label>
				<span class="error_next_box" id="pwMsg"></span>
			</h3>
			<span class="form_content blind">
				<input type="password" id="user_pw" value="${login.userPw }" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			
			<h3 class="form_title">
				<label>이름</label>
				<span class="error_next_box" id="nameMsg"></span>
			</h3>
			<span class="form_content">
				<input type="text" id="user_name" value="${login.userName }" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			<h3 class="form_title">
				<label>이메일</label>
				<span class="error_next_box" id="emailMsg"></span>
			</h3>
			<span class="form_content">
				<input type="text" id="user_email" value="${login.userEmail }" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			
			<button type="button" id="mod_btn" class="btn_type btn-primary">
				<span>확인</span>
			</button>
			<button type="button" id="cancle_btn" class="btn_type btn-primary" style="margin-top: 5px; background-color: #e4e4e5;">
				<span>취소</span>
			</button>
			
			
			
			
		</form>
	</div>


<jsp:include page="../include/plugin-js.jsp"/>


<script type="text/javascript">

$(function() {
	
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	let chk1 = false, chk2 = false;
	
	//이름
	$('#user_name').on('keyup', function() {
		//이름값 공백 확인
		if($("#user_name").val() === ""){
			$('#nameMsg').html('<b>이름은 필수 정보입니다.</b>');
			chk1 = false;
		}		         
		//이름값 유효성검사
		else if(!getName.test($("#user_name").val())){
			$('#nameMsg').html('<b>한글로 작성해주세요.</b>');
			chk1 = false;
		} else {
			$('#nameMsg').html('');
			chk1 = true;
		}
		
	});//end of name
	
	//이메일
	$('#user_email').on('keyup', function() {
		if($("#user_email").val() === ""){
			//이메일 입력값이 검증
			$('#emailMsg').html('<b>이메일은 필수 정보입니다.</b>');
			chk2 = false;
		} else if(!getMail.test($("#user_email").val())) {
			//이메일 유효성 검사
			$('#emailMsg').html('<b>올바르지않는 이메일 형식입니다.</b>');	  
			chk2 = false;
		} else {
			//아이디 중복확인 비동기 처리
			const userEmail = $('#user_email').val();
			$.ajax({
				type: "POST",
				url: "/user/emailCheck",
				headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
				data: userEmail,
				datatype: "json",
				success: function(data) {
					console.log(data);
					if(data.emailConfirm === "OK") {
						$('#emailMsg').html('');
						chk2 = true;
					} else {
						$('#emailMsg').html('<b>중복된 이메일입니다.</b>');
						chk2 = false;
					}
				},
				error : function(error) {
	                
	                console.log("error : " + error);
	            }
			});
		}
	});//end of email
	
	
	//회원정보 변경 처리 요청하기
	$('#mod_btn').click(function(e) {
		if(chk1 && chk2) {
			const id = $("#user_id").val();
			const pw = $("#user_pw").val();
			const name = $("#user_name").val();
			const email = $("#user_email").val();
			const user = {
				userId: id,
	            userPw: pw,
	            userName: name,
	            userEmail: email
			};
			console.log(user);
			
			$.ajax({
				type: "POST",
				url: "/user/updateInfo",
	            headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: JSON.stringify(user),
	            success: function(result) {
	            	console.log("result: " + result);
	            	if(result === "updateSuccess") {
	            		alert("회원정보 변경 성공!");
	            		self.location = "/user/mypage";
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