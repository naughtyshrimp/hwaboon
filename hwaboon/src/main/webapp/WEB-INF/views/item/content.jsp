<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" action = "<c:url value='/item/modify'/>" method="get">
	<input type = "hidden" name = "itemNo" value = "${item.itemNo}"/>
	<input type = "hidden" name = "page" value = "${PageCreator.criteria.page}"/>
	<input type = "hidden" name = "countPerPage" value = "${PageCreator.criteria.countPerPage}"/>
	
	<table border = "1">
	<tr>
		<td>제품 번호</td>
				<td>제품 주제</td>
				<td>제품 회사</td>
				<td>제품 이름</td>
				<td>제품 가격</td>
				<td>제품 정보</td>
				<td>제품 등록날짜</td>
	</tr>
	<tr>
		<td>제품 번호</td>
				<td>${item.itemNo}</td>
				<td>${item.itemCompany}</td>
				<td>${item.itemName}</td>
				<td>${item.itemPrice}</td>
				<td>${item.itemInformation}</td>
				<td> <fmt:formatDate value="${item.itemRegDate }" pattern="yyyy-MM-dd a hh:mm"/> </td>
	</tr>
	</table>
	<input type = "submit" value = "제품 정보 수정하기"/> <br>
	<button id = "deleteBtn"> 제품 삭제하기 </button>
	</form>

<jsp:include page="../include/plugin-js.jsp" />
<script type="text/javascript">

	$(document).ready(function(){
		const formObj = $("form[role='form']");
		
		$("#deleteBtn").on("click", function(){
			formObj.attr("method", "post");
			formObj.attr("action", "delete");
			formObj.submit();
		});
	});




	</script>



</body>
</html>
