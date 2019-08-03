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
<jsp:include page="../include/main-header.jsp"/>"/>

	<div class="container" style="max-width: 460px; padding-top: 100px; padding-bottom: 100px">
		<div id="header" class="form_header" role="banner">
			<h1>
				<span>UPDATE<br>PASSWORD</span>
			</h1>
		</div>
		<form action="<c:url value='/user'/>" method="post">
			<h3 class="form_title">
				<label class=blind>아이디</label>
			</h3>
			<span class="form_content blind">
				<input type="text" id="user_id" value=${login.userId } class="form-control input_box" maxlength="40" hidden="hidden">
			</span>

			
			<h3 class="form_title">
				<label class="blind">현재 비밀번호</label>
			</h3>
			<span class="form_content" style="margin-bottom: 33px;">
				<input type="password" id="user_pw" placeholder="현재 비밀번호" class="form-control input_box" maxlength="40">
				<span class="error_next_box" id="pwMsg" style="margin-top: 15px;"></span>
			</span>
			
			
			
			
			<h3 class="form_title">
				<label class="blind">새 비밀번호</label>
			</h3>
			<span class="form_content">
				<input type="password" id="new_user_pw" placeholder="새 비밀번호" class="form-control input_box" maxlength="40">
			</span>
			
			
			
			<h3 class="">
				<label class="blind">비밀번호 확인</label>
			</h3>
			<span class="form_content">
				<input type="password" id="new_user_pw_check" placeholder="비밀번호 확인" class="form-control input_box" maxlength="40">
				<span class="error_next_box" id="newPwMsg" style="margin-top: 15px;"></span>
			</span>
			
			
			<input type="text" id="user_name" value="${login.userName }" hidden="hidden">
			<input type="text" id="user_email" value="${login.userEmail }" hidden="hidden">
			
			
			
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
		const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		let chk1 = false, chk2 = false, chk3 = false;
		
		
		//현재 비밀번호
		$('#user_pw').on('keyup', function() {
			//비밀번호 공백 확인
			if($("#user_pw").val() === ""){
				$('#pwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
				chk1 = false;
				
				
			} else {
				const userPw = $('#user_pw').val();
				
				$.ajax({
					type: "POST",
					url: "/user/checkPw",
					headers: {
						"Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
					},
					data: userPw,
					datatype: "json",
					success: function(result) {
						console.log(result);
						
						if(result === "pwConfirmOK") {
							$('#pwMsg').html('');
							chk1 = true;
						} else {
							$('#pwMsg').html('');
							chk1 = false;
						}
						
						
					},
					error : function(error) {
		                
		                console.log("error : " + error);
		            }
				});
				
			}
			
		}); //end of old password
		
		
		//새로운 비번
		$('#new_user_pw').on('keyup', function() {
			//비밀번호 공백 확인
			if($("#new_user_pw").val() === ""){
				$('#newPwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
				chk2 = false;
			}		         
			//비밀번호 유효성검사
			else if(!getPwCheck.test($("#new_user_pw").val()) || $("#new_user_pw").val().length < 8){
				$('#newPwMsg').html('<b>특수문자 포함 8자 이상 입력하세요</b>');
				chk2 = false;
			} else {
				$('#newPwMsg').html('');
				chk2 = true;
			}
			
		}); //end of new password
		
		
		//비밀번호 확인
		$('#new_user_pw_check').on('keyup', function() {
			//비밀번호 확인란 공백 확인
			if($("#new_user_pw_check").val() === ""){
				$('#newPwMsg').html('<b">비밀번호 확인은 필수 정보입니다.</b>');
				chk3 = false;
			}		         
			//비밀번호 확인란 유효성검사
			else if($("#new_user_pw").val() != $("#new_user_pw_check").val()){
				$('#newPwMsg').html('<b>비밀번호가 일치하지 않습니다.</b>');
				chk3 = false;
			} else {
				$('#newPwMsg').html('');
				chk3 = true;
			}
			
		});//end of passwordCheck
		
		
		//비밀번호 변경 요청처리하기
		$('#mod_btn').click(function(e) {
			
			if(chk1 == false) {
				alert('현재 비밀번호가 틀렸습니다.');	
			
			}else if(chk1 && chk2 && chk3) {
				
				const id = $("#user_id").val();
				const newPw = $("#new_user_pw").val();
				const name = $("#user_name").val();
				const email = $("#user_email").val();
				const user = {
					userId: id,
		            userPw: newPw,
		            userName: name,
		            userEmail: email
				};
				console.log(user);
				
				$.ajax({
					type: "POST",
					url: "/user/updatePw",
		            headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
		            dataType: "text",
		            data: JSON.stringify(user),
		            success: function(result) {
		            	console.log("result: " + result);
		            	if(result === "updateSuccess") {
		            		alert("비밀번호 변경 성공!");
		            		self.location = "/user/mypage";
		            	} else {
		            		alert('현재 비밀번호가 틀렸습니다.');
		            	}
		            }
				});
				
			} else {
				alert('입력정보를 다시 확인하세요.');			
			}
		});
		
	});//end of function
		
		
</script>
</body>
</html>