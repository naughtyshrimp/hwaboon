<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {border: 1px solid black;}
td {text-align: center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<table>
		<tr>
			<th>itemName</th>
			<th>amount</th>
			<th>itemPrice</th>
			<th>삭제</th>
		</tr>
		
		<c:forEach items="${list}" var="item">
		<tr>
			<td>${item.itemName}</td>
			<td>${item.amount}<input type="text" id="amount"><button type="submit" formaction="/shoppingcart/update?cartId=${item.cartId}">update</button></td>
			<td>${item.itemPrice}</td>
			<td><a href="/shoppingcart/delete?cartId=${item.cartId}">x</a></td>
		</tr>
		</c:forEach>
	</table>
	
	<table>
		<tr>
			<th>total price</th>
		</tr>
	
		<tr>
			<td>${sum}</td>
		</tr>
	</table>

<jsp:include page="../include/plugin-js.jsp" />

<script type="text/javascript">


/* $(function() {

	getAmount("/myapp/shoppingcart/updateAmount");
	
	function getAmount(uri) {
		$.getJSON(uri, function(data) {
			$(".itemAmount").val(data);
		});
	}
	

	
	const itemAmount = $("#itemAmount");
	
	$.ajax({
        type: "PUT",
        url: "/myapp/shoppingcart/updateAmount",
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "PUT"
        },
        dataType: "text",
        data: JSON.stringify({
        	itemAmount: itemAmount
        }),
        success: function (result) {
            console.log("result : " + result);
            if (result === "SUCCESS") {
                alert("댓글이 등록되었습니다.");
        }
    }
});
}); */

</script>



</body>
</html>