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
				<span class="blind">JOIN</span>
			</h1>
		</div>
		<form action="<c:url value='/user'/>" method="post">
			<h3 class="form_title">
				<label>아이디</label>
				<span class="error_next_box" id="idMsg"></span>
			</h3>
			<span class="form_content">
				<input type="text" id="user_id" placeholder="아이디" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			<h3 class="form_title">
				<label>비밀번호</label>
				<span class="error_next_box" id="pwMsg"></span>
			</h3>
			<span class="form_content">
				<input type="password" id="user_pw" placeholder="비밀번호" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			<h3 class="form_title">
				<label>비밀번호 확인</label>
				<span class="error_next_box" id="pwCkMsg"></span>
			</h3>
			<span class="form_content">
				<input type="password" id="user_pw_check" placeholder="비밀번호 확인" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			
			<h3 class="form_title">
				<label>이름</label>
				<span class="error_next_box" id="nameMsg"></span>
			</h3>
			<span class="form_content">
				<input type="text" id="user_name" placeholder="이름" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			
			<h3 class="form_title">
				<label>이메일</label>
				<span class="error_next_box" id="emailMsg"></span>
			</h3>
			<span class="form_content">
				<input type="text" id="user_email" placeholder="이메일" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			<button type="button" id="join-btn" class="btn_type btn-primary">
				<span>회원가입</span>
			</button>
		
		</form>
		
		

	
	</div>

<jsp:include page="../include/plugin-js.jsp"/>

<script type="text/javascript">
	//회원가입 검증
	$(function() {
		const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
		const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		const getName= RegExp(/^[가-힣]+$/);
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;
		
		
		//아이디
		$('#user_id').on('keyup', function() {
			if($("#user_id").val() === ""){
				//아이디 입력값이 검증
				$('#idMsg').html('<b>아이디는 필수 정보입니다.</b>');
				chk1 = false;
			} else if(!getIdCheck.test($("#user_id").val())) {
				//아이디 유효성 검사
				$('#idMsg').html('<b>영문자나 숫자로  4-14자 입력해주세요.</b>');	  
				chk1 = false;
			} else {
				//아이디 중복확인 비동기 처리
				const userId = $('#user_id').val();
				$.ajax({
					type: "POST",
					url: "/user/idCheck",
					headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
					data: userId,
					datatype: "json",
					success: function(data) {
						console.log(data);
						if(data.idConfirm === "OK") {
							$('#idMsg').html('');
							chk1 = true;
						} else {
							$('#idMsg').html('<b>중복된 아이디입니다.</b>');
							chk1 = false;
						}
					},
					error : function(error) {
		                
		                console.log("error : " + error);
		            }
				});
			}
		});//end of id
		
		//비번
		$('#user_pw').on('keyup', function() {
			//비밀번호 공백 확인
			if($("#user_pw").val() === ""){
				$('#pwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
				chk2 = false;
			}		         
			//비밀번호 유효성검사
			else if(!getPwCheck.test($("#user_pw").val()) || $("#user_pw").val().length < 8){
				$('#pwMsg').html('<b>특수문자 포함 8자 이상 입력하세요</b>');
				chk2 = false;
			} else {
				$('#pwMsg').html('');
				chk2 = true;
			}
			
		}); //end of password
		
		//비밀번호 확인
		$('#user_pw_check').on('keyup', function() {
			//비밀번호 확인란 공백 확인
			if($("#user_pw_check").val() === ""){
				$('#pwCkMsg').html('<b">비밀번호 확인은 필수 정보입니다.</b>');
				chk3 = false;
			}		         
			//비밀번호 확인란 유효성검사
			else if($("#user_pw").val() != $("#user_pw_check").val()){
				$('#pwCkMsg').html('<b>비밀번호가 일치하지 않습니다.</b>');
				chk3 = false;
			} else {
				$('#pwCkMsg').html('');
				chk3 = true;
			}
			
		});//end of passwordCheck
		
		
		
		//이름
		$('#user_name').on('keyup', function() {
			//이름값 공백 확인
			if($("#user_name").val() === ""){
				$('#nameMsg').html('<b>이름은 필수 정보입니다.</b>');
				chk4 = false;
			}		         
			//이름값 유효성검사
			else if(!getName.test($("#user_name").val())){
				$('#nameMsg').html('<b>한글로 작성해주세요.</b>');
				chk4 = false;
			} else {
				$('#nameMsg').html('');
				chk4 = true;
			}
			
		});//end of name
		
		//이메일
		$('#user_email').on('keyup', function() {
			if($("#user_email").val() === ""){
				//이메일 입력값이 검증
				$('#emailMsg').html('<b>이메일은 필수 정보입니다.</b>');
				chk5 = false;
			} else if(!getMail.test($("#user_email").val())) {
				//이메일 유효성 검사
				$('#emailMsg').html('<b>올바르지않는 이메일 형식입니다.</b>');	  
				chk5 = false;
			} else {
				//이메일 중복확인 비동기 처리
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
							chk5 = true;
						} else {
							$('#emailMsg').html('<b>중복된 이메일입니다.</b>');
							chk5 = false;
						}
					},
					error : function(error) {
		                
		                console.log("error : " + error);
		            }
				});
			}
		});//end of email
		
		
		//회원가입 요청처리하기
		$('#join-btn').click(function(e) {
			if(chk1 && chk2 && chk3 && chk4 &&chk5) {
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
					url: "/user",
		            headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
		            dataType: "text",
		            data: JSON.stringify(user),
		            success: function(result) {
		            	console.log("result: " + result);
		            	if(result === "joinSuccess") {
		            		alert("회원가입 성공!");
		            		self.location = "/user/login";
		            	}
		            }
				});
			} else {
				alert('입력정보를 다시 확인하세요.');			
			}
		});
		
	}); //end of function

</script>

</body>
</html>