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
				<span class="blind">회원 탈퇴</span>
				<p style="font-size: 14px;">회원탈퇴를 위해 비밀번호를 다시 입력해주세요.</p>
			</h1>
		</div>
		<form action="<c:url value='/user'/>" method="post">
			
			<input type="text" id="user_id" value="${login.userId }" class="blind">
			
			<h3 class="form_title">
				<label class="blind">비밀번호</label>
			</h3>
			<span class="form_content">
				<input type="password" id="user_pw" placeholder="비밀번호" class="form-control input_box" maxlength="40">
			</span>
			<span class="error_next_box" id="pwMsg"></span>
			
			
			
			
			<button type="button" id="withdrawal_btn" class="btn_type btn-primary"  onclick="return confirm('정말 회원 탈퇴하시겠습니까?')">
				<span>회원탈퇴</span>
			</button>
			<button type="button" id="cancle_btn" class="btn_type btn-primary" style="margin-top: 5px; background-color: #e4e4e5;">
				<span>취소</span>
			</button>
		
			
			
		</form>
		
		

	
	</div>

<jsp:include page="../include/plugin-js.jsp"/>


<script type="text/javascript">
	//로그인 검증 요청
	$(function() {
		
		//패스워드 입력값 검증
		$('#user_pw').on('keyup', function() {
			if($("#user_pw").val() === ""){
				//비밀번호 공백 검사
				$('#pwMsg').html('<b>비밀번호를 입력하세요.</b>');
				chk1 = false;
			} else {
				//비밀번호 잘 입력하면 true
				$('#pwMsg').html('');
				chk1 = true;
			}
		});
		
		//로그인 버튼 클릭 이벤트
		$('#withdrawal_btn').click(function() {
			if(chk1) {
				//ajax통신으로 서버에서 값 받아오기
				const id = $('#user_id').val();
				const pw = $('#user_pw').val();
				
				console.log("id: " + id);
				console.log("pw: " + pw);
				
				const user = {
					userId : id,
					userPw : pw
				};
				
				$.ajax({
					type: "POST",
					url: "/user/withdrawal",
					headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "POST"
		            },
					data: JSON.stringify(user),
					dataType : "text",
					success: function(result) {
						console.log("result: " + result);	
						
						if(result === "Success") {
							alert('탈퇴되었습니다. 안녕!');
							self.location = '/';
					    } else {
					    	alert('비밀번호가 틀렸습니다.')
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