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
				<img src="<c:url value='/images/icons/hwaboon_logo.png'/>" onclick="location.href='<c:url value='/'/>'">
				<span class="blind">LOGIN</span>
			</h1>
		</div>
		<form action="<c:url value='/user'/>" method="post">
			<h3 class="form_title">
				<label class=blind>아이디</label>
			</h3>
			<span class="form_content">
				<input type="text" id="user_id" placeholder="아이디" class="form-control input_box" maxlength="40">
			</span>
			<span class="error_next_box" id="idMsg"></span>
			
			
			
			<h3 class="form_title">
				<label class="blind">비밀번호</label>
			</h3>
			<span class="form_content">
				<input type="password" id="user_pw" placeholder="비밀번호" class="form-control input_box" maxlength="40">
			</span>
			<span class="error_next_box" id="pwMsg"></span>
			
			
			
			
			<button type="button" id="login-btn" class="btn_type btn-primary">
				<span>로그인</span>
			</button>
			
			<span class="login_check_box">
				<input type="checkbox" name="autoLogin" style="display: inline;">
				<label>로그인 상태 유지</label>
			</span>
			
			
			
			<div class="find_info">
				<a href="<c:url value='/user/find_id'/>">아이디 찾기</a>
				<span class="bar">|</span>
				<a href="<c:url value='/user/find_pw'/>">비밀번호 찾기</a>
				<span class="bar">|</span>
				<a href="<c:url value='/user/join'/>">회원가입</a>
			</div>
			
			
			
		</form>
		
		

	
	</div>


<jsp:include page="../include/plugin-js.jsp"/>


<script type="text/javascript">
	//로그인 검증 요청
	$(function() {
		let chk1 = false, chk2 = false;
		
		//로그인 검증
		//아이디 입력값 검증
		$('#user_id').on('keyup', function(){
			if($("#user_id").val() === ""){
				//아이디 공백 검사
				$('#idMsg').html('<b>아이디를 입력하세요.</b>');
				chk1 = false;
			} else {
				//제대로 입력했을시에 true
				$('#idMsg').html('');
				chk1 = true;
			}
		
		});
		
		//패스워드 입력값 검증
		$('#user_pw').on('keyup', function() {
			if($("#user_pw").val() === ""){
				//비밀번호 공백 검사
				$('#pwMsg').html('<b>비밀번호를 입력하세요.</b>');
				chk2 = false;
			} else {
				//비밀번호 잘 입력하면 true
				$('#pwMsg').html('');
				chk2 = true;
			}
		});
		
		//로그인 버튼 클릭 이벤트
		$('#login-btn').click(function() {
			if(chk1 && chk2) {
				//ajax통신으로 서버에서 값 받아오기
				const id = $('#user_id').val();
				const pw = $('#user_pw').val();
				const autoLogin = $("input[name=autoLogin]").is(":checked");
				
				console.log("id: " + id);
				console.log("pw: " + pw);
				console.log("autoLogin: " + autoLogin);
				
				const userInfo = {
					userId : id,
					userPw : pw,
					autoLogin: autoLogin
				};
				
				$.ajax({
					type: "POST",
					url: "/user/loginCheck",
					headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
					data: JSON.stringify(userInfo),
					dataType : "text",
					success: function(data) {
						console.log("result: " + data);	
						
						if(data === "idFail") {
							$('#idMsg').html('<b>회원가입 먼저 해주세요.</b>');
							$('#user_id').val("");
							$('#user_id').focus();
						
					    } else if(data === "pwFail") {
							$('#user_pw').val("");
							$('#user_pw').focus();
							$('#pwMsg').html('<b>비밀번호가 틀렸습니다.</b>');
						} else if(data === "loginSuccess") {
							self.location="/";
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