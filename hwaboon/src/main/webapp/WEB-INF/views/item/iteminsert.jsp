
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "<c:url value='/item/iteminsert'/>" method="post" enctype="multipart/form-data">
	<!--  제품 주제 : <input type ="text" name = "itemSubject"/> <br>-->
	제품 주제 : <select name = "itemSubject">
				<option value = "SKIN" selected> 스킨 </option>
				<option value = "LOTION"> 로션 </option>
				<option value = "TONNER"> 토너 </option>
				<option value = "SUNCREAM"> 썬크림 </option>
				<option value = "CUSHION"> 쿠션 </option>  
			</select><br> 
	제품 회사 : <input type ="text" name = "itemCompany" value="화분"/> <br>
	제품 이름 : <input type ="text" name = "itemName" placeholder="제품 이름을 입력해주세요." required="required"/> <br>
	제품 정보 : <input type ="text" name = "itemInformation" placeholder="제품 정보를 입력해주세요." required="required"/> <br>
	제품 가격 : <input type ="text" name = "itemPrice" placeholder="0" required="required" numberOnly/> 원 <br>
	<input type = "submit" value="제품 등록"/>
	<input type = "reset" value = "초기화"/><br>
	<button type = "button" id = "itemlist"> 제품 목록으로 이동 </button>
	
	<div class="form-group">
		     <label># 이미지파일: </label>
		     <input type="file" name="file">      
		  </div>
	
	</form>
	
	
	<jsp:include page="../include/plugin-js.jsp" />
	
	<script type="text/javascript">
	
	//아이템 리스트목록 으로 이동 이벤트
	$(document).ready(function(){
		$("#itemlist").on("click", function(){
			self.location = "/item/itemlist";
		});
	});
	/*
	//3자리 단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	*/
	// 숫자만 입력 가능하게하는 함수
	$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});

	</script>
	
</body>
</html>