<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			
			<c:if test="${empty login }">
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						" 화장품을 분석하다 "
					</div>
				<div class="right-top-bar flex-w h-full">
						<a href="<c:url value='/user/join'/>" class="flex-c-m trans-04 p-lr-25"> JOIN </a> 
						<a href="<c:url value='/user/login'/>" class="flex-c-m trans-04 p-lr-25"> LOGIN </a> 
					</div>
				</div>
			</div>
			</c:if>
			
			<!-- 로그인 했을 때 보이는 곳 -->
			<c:if test="${not empty login }">
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						${ login.userName } 님, 환영합니다.
					</div>
				<div class="right-top-bar flex-w h-full">
						<a href="<c:url value='/user/mypage'/>"	class="flex-c-m trans-04 p-lr-25"> MY PAGE </a> 
						<a href="<c:url value='/user/logout'/>" class="flex-c-m trans-04 p-lr-25" onclick="return confirm('로그아웃하시겠어요?')"> LOGOUT </a>
					</div>
				</div>
			</div>
			</c:if>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="#" class="logo">
						<img src="/resources/images/icons/hwaboon_logo.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="<c:url value='/'/>">Home</a>
							</li>

							<li>
								<a href="<c:url value='/boot/product'/>">Shop</a>
							</li>

							<li>
								<a href="<c:url value='/review/list'/>">Reviews</a>
							</li>

							<li>
								<a href="about.html">About</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
					<c:if test="${empty login}">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
							<a href="<c:url value='/user/login'/>" onclick="alert('로그인을 하세요.')"><i class="zmdi zmdi-shopping-cart"></i></a>
						</div>
					</c:if>
					<c:if test="${not empty login}">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="0">
							<a href="<c:url value='/shoppingcart/list'/>"><i class="zmdi zmdi-shopping-cart"></i></a>
						</div>
					</c:if>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="/resources/images/icons/hwaboon_logo.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<c:if test="${empty login}">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
							<a href="<c:url value='/user/login'/>" onclick="alert('로그인을 하세요.')"><i class="zmdi zmdi-shopping-cart"></i></a>
						</div>
					</c:if>
					<c:if test="${not empty login}">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="0">
							<a href="<c:url value='/shoppingcart/list'/>"><i class="zmdi zmdi-shopping-cart"></i></a>
						</div>
					</c:if>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						" 화장품을 분석하다 "
					</div>
				</li>

				<li>
				<div class="right-top-bar flex-w h-full">
					<!-- 로그인하지 않았을 때 보이는 곳  -->
					<c:if test="${empty login }">
						<a href="<c:url value='/user/join'/>" class="flex-c-m p-lr-10 trans-04"> JOIN </a> 
						<a href="<c:url value='/user/login'/>" class="flex-c-m p-lr-10 trans-04"> LOGIN </a>
					</c:if>
					<!-- 로그인했을 때 보이는 곳  -->
					<c:if test="${not empty login }">
						<a href="<c:url value='/user/mypage'/>" class="flex-c-m p-lr-10 trans-04"> MY PAGE </a> 
						<a href="<c:url value='/user/logout'/>"	class="flex-c-m p-lr-10 trans-04" onclick="return confirm('로그아웃하시겠어요?')"> LOGOUT </a>
					</c:if>
				</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html">Reviews</a>
				</li>

				<li>
					<a href="blog.html">About</a>
				</li>
			</ul>
		</div>

	</header>