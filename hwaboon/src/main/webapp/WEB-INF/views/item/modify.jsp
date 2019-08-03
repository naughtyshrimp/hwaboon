<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = <c:url value = '/item/modify'/> method = "post" >
<input type = "hidden" name = "itemNo" value = "${item.itemNo}"/>
<input type = "hidden" name = "page" value = "${PageCreator.criteria.page}"/>
<input type = "hidden" name = "countPerPage" value = "${PageCreator.criteria.countPerPage}"/>
<table border="1">
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
				<td>	<input type = "text" name = "itemNo" value = "${item.itemNo}" disabled="disabled"/> </td>
				<td>	<input type = "text" name = "itemSubject" value = "${item.itemSubject}"/> </td>
					<td><input type = "text" name = "itemCompany" value = "${item.itemCompany}"/> </td>
				<td>	<input type = "text" name = "itemName" value = "${item.itemName}"/>  </td>
				<td>	<input type = "text" name = "itemPrice" value = "${item.itemPrice}"/> </td>
				<td>	<input type = "text" name = "itemInformation" value = "${item.itemInformation}"/>
				<td>	<fmt:formatDate value="${item.itemRegDate}"
							pattern="yyyy-MM-dd a hh:mm" /> </td>
			</tr>
			</table>
			<input type = "submit" class = "modifyok" value = "제품 정보 수정 완료"/>
</form>

<script type="text/javascript">

	$(document).ready(function(){
		$("#modifyok").on("click", function(){
			self.location = "/item/itemlist?page=${PageCreator.criteria.page}&countPerPage=${PageCreator.criteria.countPerPage}";
		});
	});


</script>







</body>
</html>