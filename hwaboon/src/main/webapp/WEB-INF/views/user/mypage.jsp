<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

	<div class="container" style="max-width: 500px; padding-top: 100px; padding-bottom: 100px">
		<div id="header" class="form_header" role="banner">
			<h1>
				<span>MY PAGE</span>
			</h1>
		</div>
		<div class="myinfo">
			<div class="myinfo_info">
				<strong class="myinfo_title">아이디</strong>
				<div class="myinfo_content">
					${login.userId }
				</div>
			</div>
		</div>
		<div class="myinfo">
			<div class="myinfo_info">
				<strong class="myinfo_title">이름</strong>
				<div class="myinfo_content">
					${login.userName }
				</div>
			</div>
		</div>
		<div class="myinfo">
			<div class="myinfo_info">
				<strong class="myinfo_title">이메일</strong>
				<div class="myinfo_content">
					${login.userEmail }
				</div>
			</div>
		</div>
		<div class="myinfo">
			<div class="myinfo_info">
				<strong class="myinfo_title">가입날짜</strong>
				<div class="myinfo_content">
					<fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${login.userRegDate}" />
				</div>
			</div>
		</div>
		<div class="update_info">
			<a href="<c:url value='/user/update_info'/>">회원정보 변경</a>
			<span class="bar">|</span>
			<a href="<c:url value='/user/update_pw'/>">비밀번호 변경</a>
			<span class="bar">|</span>
			<a href="<c:url value='/user/withdrawal'/>">회원 탈퇴</a>
		</div>
		
	</div>

<jsp:include page="../include/main-footer.jsp"/>

<jsp:include page="../include/plugin-js.jsp"/>
</body>
</html>