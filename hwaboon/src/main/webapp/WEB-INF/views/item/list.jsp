<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
ul{list-style-type: none;}
li{display: inline;}


.form-group{
	display: inline;
	width: 100px;
    height: 100px;
    }

th, tr, td {
	  padding: 10px;
	  text-align: center;
	  solid black;
	  }
	
tr.row:hover { background-color: skyblue; }

.table{
      border-collapse: collapse;
      }
h1, h3{color:skyblue;}


</style>

</head>
<body>

<h1 align="center"> Hwaboon </h1>
<h3 align="center"> 상품 목록 </h3>

<div class="search" align="center">
                        <div class="form-group col-sm-4">
                            <select id="condition" class="form-control" name="condition">                            	
                            <option value="itemName" <c:out value="${param.condition == 'itemName' ? 'selected' : ''}"/>>제품 이름</option>
                                <option value="itemSubject" <c:out value="${param.condition == 'itemSubject' ? 'selected' : ''}"/>>제품 주제</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-8">
                            <div class="input-group">
                                <input type="text" class="form-control" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
                                        <i class="fa fa-search"></i> 검색
                                    </button>
                                </span>
                            </div>
                        </div>
</div>


	<div class="item-list" align="center">
		<table class = "table">
		<thead>
			<tr align="center" bgcolor = "skyblue">
				<th>제품 번호</th>
				<th>제품 주제</th>
				<th>제품 회사</th>
				<th>제품 이름</th>
				<th>제품 가격</th>
				<th>제품 정보</th>
				<th>제품 등록날짜</th>
				<th>제품정보 최근 수정 날짜</th>
			</tr>
		</thead>
			<c:if test="${itemlist.size() <= 0}">
				 <tr>
				 	<td align="center" colspan="8"> <strong> 검색 결과가 없습니다. </strong> </td>
				 </tr>
			</c:if>
			<c:if test="${itemlist.size() >= 0 }">
			
			<table  class = "table">
			<c:forEach var="item" items="${itemlist}">
				<tr class = "row">
					<td>${item.itemNo}</td>
					<td>${item.itemSubject}</td>
					<td>${item.itemCompany}</td>
					<td> <a href = "<c:url value ='/item/content${PageCreator.makeSearchURI(PageCreator.criteria.page)}&itemNo=${item.itemNo}'/>"> ${item.itemName} </a> </td>
					<td>${item.itemPrice}원</td>
					<td>${item.itemInformation}</td>
					<td><fmt:formatDate value="${item.itemRegDate}" pattern="yyyy-MM-dd a hh:mm" /></td>
					<td><fmt:formatDate value="${item.itemRegupDate}" pattern="yyyy-MM-dd a hh:mm"/></td>
				</tr>
			</c:forEach>
			</table>
			</c:if>
		</table>
	</div>

	<div class="box-footer" align="center">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${PageCreator.prev}">
					<li><a
						href="<c:url value='/item/itemlist${PageCreator.makeSearchURI(PageCreator.beginPage - 1)}'/>">
							이전 </a></li>
				</c:if>
				<c:forEach var="idx" begin="${PageCreator.beginPage}" end="${PageCreator.endPage}">
					<li <c:out value="${PageCreator.criteria.page == idx ? 'class=active' : ''}"/>><a href="<c:url value='/item/itemlist${PageCreator.makeSearchURI(idx)}'/>">${idx} </a></li>
				</c:forEach>	

				<c:if test="${PageCreator.next}">
					<li><a
						href="<c:url value='/item/itemlist${PageCreator.makeSearchURI(PageCreator.endPage + 1)}'/>">
							다음 </a></li>
				</c:if>
			</ul>
		</div>
	</div>
<p align="center">
<button type = "button" name = "iteminsert" id = "iteminsert"> 제품 등록하기 </button>	 
</p>

	<jsp:include page="../include/plugin-js.jsp" />
	
	<script type="text/javascript">
	
	// 검색 버튼 이벤트
	$(document).ready(function(){
		$("#searchBtn").on("click", function() {
			self.location = "/item/itemlist${PageCreator.makeSearch(1)}"
					+ "&condition=" + $("select option:selected").val()
					+ "&keyword=" + (encodeURI($("#keywordInput").val()));	
		});
		
		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function (key) {
			 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	$("#searchBtn").click();
	        }
	    });
		
		$("#iteminsert").on("click",function(){
			self.location = "/item/iteminsert";
		})
	});
	
	
	</script>
	


</body>
</html>