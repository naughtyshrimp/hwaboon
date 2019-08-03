<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">


<head>

<style type="text/css">
ul{list-style-type: none;}
li{display: inline;}

.borderlist {
    list-style-position:inside;
    border: 1px solid black;
    bordr-radius: 50%;
    text-align:center;
}

<style>
	#count-per-page {
		padding: 0 12px;
	}


.form-group{
	display: inline;
	width: 50px;
    height: 100px;
    float: left;
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
<jsp:include page="../include/static-header.jsp"/>


</head>
<body class="animsition">
	
<jsp:include page="../include/main-header.jsp"/>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10 itemName" >
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*" id = "allproduct">
						All Products
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".SKIN" id = "SKIN" value = "SKIN">
						SKIN
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".LOTION" id = "LOTION" value = "LOTION">
						LOTION
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".TONNER" id = "TONNER" value = "TONNER">
						TONNER
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".suncream" id = "SUNCREAM" value = "SUNCREAM">
						SUN CREAN
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".CUSHION" id = "CUSHION" value = "CUSHION">
						CUSHION
					</button>
					
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".iteminsert" id = "iteminsert">
						상품 등록하기
					</button>
				</div>


			
				
			

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Sort By
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Default
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Popularity
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Average rating
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Newness
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Price: Low to High
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Price: High to Low
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Price
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										All
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$0.00 - $50.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$50.00 - $100.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$100.00 - $150.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$150.00 - $200.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$200.00+
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Color
							</div>

							<ul>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Black
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Blue
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Grey
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Green
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Red
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										White
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Tags
							</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
						
					</div>
					
				</div>
				
			</div>
				</div>
	
		<div>
		
			<div style="width: 100%; float:left; padding-bottom:50px;" >
		<ul style="padding-left:300px;">
			<c:forEach var="item" begin="0" end="4" items="${itemlist}">
				<li style ="padding:10px;">
				<div style="float: left; padding-right:80px;">
					<a href="<c:url value = '/item/productdetail${PageCreator.makeSearchURI(PageCreator.criteria.page)}&itemNo=${item.itemNo}'/>">
					<div>
						<div>
							img
							<span class="line_frame"></span>
						</div>
						<div>${item.itemName}</div>
						<div>
							<span class="price">
								<span class="hide"></span><span class="n">${item.itemPrice}</span>원
							</span>
						</div>
						</div>
					</a>
				</div>
			</li>
		</c:forEach>
		
		</ul>
		</div>
		

		
		<p>
		<div style="width:100%; float:left; padding-bottom:50px; ">
		<ul style="padding-left:300px;">
			<c:forEach var="item" begin="5" end="9" items="${itemlist}">
				<li>
				<div style="float: left; padding-right:80px;">
					<a href="<c:url value = '/item/productdetail${PageCreator.makeSearchURI(PageCreator.criteria.page)}&itemNo=${item.itemNo}'/>">
					<div>
						<div>
							img
							<span class="line_frame"></span>
						</div>
						<div>${item.itemName}</div>
						<div>
							<span class="price">
								<span class="hide">판매가</span><span class="n">${item.itemPrice}</span>원
							</span>
						</div>
					</a>
				</div>
			</li>
		</c:forEach>
		</ul>
		</div>
		
		<div style = "padding-left:650px;">
			
			<ul>
				<c:if test="${PageCreator.prev}">
					<li id="count-per-page" class = "borderlist" style = padding-right:10px;><a
						href="<c:url value='/item/itemlist${PageCreator.makeSearchURI(PageCreator.beginPage - 1)}'/>">
							이전 </a></li>
				</c:if>
				<c:forEach var="idx" begin="${PageCreator.beginPage}" end="${PageCreator.endPage}">
					<li id="count-per-page" class = "borderlist" style = padding-right:10px; <c:out value="${PageCreator.criteria.page == idx ? 'class=active' : ''}"/>><a href="<c:url value='/item/${is}${PageCreator.makeSearchURI(idx)}&itemSubject=${is}'/>">${idx} </a></li>
				</c:forEach>	

				<c:if test="${PageCreator.next}">
					<li id="count-per-page" class = "borderlist" style = padding-right:10px;><a
						href="<c:url value='/item/itemlist${PageCreator.makeSearchURI(PageCreator.endPage + 1)}'/>">
							다음 </a></li>
				</c:if>
			</ul>
	</div>
	
	<!-- 
	<div class="search" align="center">
		<div class="form-group col-sm-4"></div>
                        <div class="form-group col-sm-2">
                            <select id="condition" class="form-control" name="condition">                            	
                            <option value="itemName" <c:out value="${param.condition == 'itemName' ? 'selected' : ''}"/>>제품 이름</option>
                                <option value="itemSubject" <c:out value="${param.condition == 'itemSubject' ? 'selected' : ''}"/>>제품 주제</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-2">
                            <div class="input-group">
                                <input type="text" class="form-control" name="keyword" id="keywordInput" value="${param.keyword}" placeholder="검색어">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
                                        <i class="fa fa-search"></i> 검색
                                    </button>
                                </span>
                            </div>
                        </div>
                        <div class="form-group col-sm-4"></div>
		
	</div>
	 -->
	</div>
	
		
	<jsp:include page="../include/main-footer.jsp"/>
<!--===============================================================================================-->	
	<script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/popper.js"/>"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/select2/select2.min.js"/>"></script>
	
		
	
	<script>
	
	//All product 버튼 이벤트
	$("#allproduct").on("click", function(){
		self.location = "/item/itemlist";
	});
		
	//관리자 상품 등록 이벤트
	$("#iteminsert").on("click", function(){
		self.location = "/item/iteminsert${PageCreator.makeSearchURI(1)}";
	});
	
	$("#SKIN").on("click", function(){
		self.location = "/item/skin${PageCreator.makeSearchURI(1)}"
			+ "&itemSubject=" + $("#SKIN").val();
	});
	
	$("#TONNER").on("click", function(){
		self.location = "/item/tonner${PageCreator.makeSearchURI(1)}"
			+ "&itemSubject=" + $("#TONNER").val();
	});
	
	$("#SUNCREAM").on("click", function(){
		self.location = "/item/suncream${PageCreator.makeSearchURI(1)}"
			+ "&itemSubject=" + $("#SUNCREAM").val();
	});
	
	$("#LOTION").on("click", function(){
		self.location = "/item//lotion${PageCreator.makeSearchURI(1)}"
			+ "&itemSubject=" + $("#LOTION").val();
	});
	
	$("#CUSHION").on("click", function(){
		self.location = "/item/cushion${PageCreator.makeSearchURI(1)}"
			+ "&itemSubject=" + $("#CUSHION").val();
	});
	
	
	//shop버튼 이벤트
	$("#shopBtn").on("click", function(){
		self.location = "/item/itemlist";
	});
	
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/daterangepicker/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/slick/slick.min.js"/>"></script>
	<script src="<c:url value="/resources/js/slick-custom.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/parallax100/parallax100.js"/>"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/isotope/isotope.pkgd.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/sweetalert/sweetalert.min.js"/>"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"/>"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/js/main.js"/>"></script>

</body>
</html>