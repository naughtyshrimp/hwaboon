<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- /////////////////////Header Menu//////////////////////////////// -->
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar : 검정색 부분 -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">Free shipping for standard order
					over $100</div>

				<div class="right-top-bar flex-w h-full">
					<!-- 로그인하지 않았을 때 보이는 곳  -->
					<c:if test="${empty login }">
						<a href="<c:url value='/user/join'/>" class="flex-c-m trans-04 p-lr-25"> Join </a> 
						<a href="<c:url value='/user/login'/>" class="flex-c-m trans-04 p-lr-25"> Login </a> 
					</c:if>
					
					<!-- 로그인 했을 때 보이는 곳 -->
					<c:if test="${not empty login }">
						<p style="align-items: center;">${login.userName } 님, 환영합니다.</p>
						<a href="<c:url value='/user/mypage'/>"	class="flex-c-m trans-04 p-lr-25"> My Page </a> 
						<a href="<c:url value='/user/logout'/>" class="flex-c-m trans-04 p-lr-25" onclick="return confirm('로그아웃하시겠어요?')"> Logout </a>
					</c:if>
				</div>
			</div>
		</div>

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="#" class="logo"> 
					<img src="<c:url value='/images/icons/logo-01.png'/>" alt="Hwaboon">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li class="active-menu"><a href="index.html">Home</a>
							<ul class="sub-menu">
								<li><a href="index.html">Homepage 1</a></li>
								<li><a href="home-02.html">Homepage 2</a></li>
								<li><a href="home-03.html">Homepage 3</a></li>
							</ul></li>

						<li><a href="./product.html">Shop</a></li>

						<li class="label1" data-label1="hot"><a
							href="shoping-cart.html">Features</a></li>

						<li><a href="blog.html">Blog</a></li>

						<li><a href="about.html">About</a></li>

						<li><a href="contact.html">Contact</a></li>



					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
						<i class="zmdi zmdi-search"></i>
					</div>

					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>

					<a href="#"
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
						data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
					</a>
				</div>
			</nav>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="index.html"><img src="<c:url value='/images/icons/logo-01.png'/>" alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
				<i class="zmdi zmdi-search"></i>
			</div>

			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#"
				class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="left-top-bar">Free shipping for standard orderover $100</div>
			</li>
			<c:if test="${not empty login }">
				<li>
					<p style="align-items: center;">${login.userName } 님, 환영합니다.</p>
				</li>
			</c:if>
			<li>
				<div class="right-top-bar flex-w h-full">
					<!-- 로그인하지 않았을 때 보이는 곳  -->
					<c:if test="${empty login }">
						<a href="<c:url value='/user/join'/>" class="flex-c-m p-lr-10 trans-04"> Join </a> 
						<a href="<c:url value='/user/login'/>" class="flex-c-m p-lr-10 trans-04"> Login </a>
					</c:if>
					<!-- 로그인했을 때 보이는 곳  -->
					<c:if test="${not empty login }">
						<a href="<c:url value='/user/mypage'/>" class="flex-c-m p-lr-10 trans-04"> My Page </a> 
						<a href="<c:url value='/user/logout'/>"	class="flex-c-m p-lr-10 trans-04" onclick="return confirm('로그아웃하시겠어요?')"> Logout </a>
					</c:if>
				</div>
			</li>
		</ul>

		<ul class="main-menu-m">
			<li><a href="index.html">Home</a>
				<ul class="sub-menu-m">
					<li><a href="index.html">Homepage 1</a></li>
					<li><a href="home-02.html">Homepage 2</a></li>
					<li><a href="home-03.html">Homepage 3</a></li>
				</ul> <span class="arrow-main-menu-m"> <i
					class="fa fa-angle-right" aria-hidden="true"></i>
			</span></li>

			<li><a href="product.html">Shop</a></li>

			<li><a href="shoping-cart.html" class="label1 rs1"
				data-label1="hot">Features</a></li>

			<li><a href="blog.html">Blog</a></li>

			<li><a href="about.html">About</a></li>

			<li><a href="contact.html">Contact</a></li>

		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="<c:url value='/images/icons/icon-close2.png'/> " alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search"
					placeholder="Search...">
			</form>
		</div>
	</div>
</header>
<!-- ///////////////////////////////////////////////////////////////////////////////////// -->