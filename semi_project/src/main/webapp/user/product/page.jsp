<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Favicon-->
			<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
			<!-- Bootstrap icons-->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"
				type="text/css" />
			<!-- Google fonts-->
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
				rel="stylesheet" type="text/css" />
			<!-- Core theme CSS (includes Bootstrap)-->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
				crossorigin="anonymous"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
			<!-- fontAwessome-->
			<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
			<link href="user/product/css/page.css" rel="stylesheet" />
			<title>Clothes</title>
			<style>
				* {
					/*background-color:#f9f5ea;*/
				}

				i {
					cursor: pointer;
					margin: 5px;
				}

				.navbar-light {
					width: 100%;
					position: fixed;
					top: 0;
					z-index: 99;
					left: 0%;
				}

				.navbar-anchor a {
					text-decoration: none;
					color: black;
					font-weight: bold;
				}

				#userIcon {
					text-align: center;
					font-size: 25px;
					padding: 5px;
				}

				#logo {
					width: 60px;
					height: 50px;
				}

				/* 네비바 드롭다운 */
				.dropdown-toggle:hover {
					color: #83bf7b;
					border-color: aliceblue;
				}

				.dropdown:hover .nav-category {
					display: block;
					margin-top: 0;
					font-weight: bold;
				}

				/*헤더 메인 사진*/
				body {
					padding-top: 50px;
				}

				.header-img {
					height: 800px;
					width: 100%;
					margin: 0;
				}

				.header-image {
					width: 100%;
					height: 100%;
				}

				/* 상품 캐러셀 */
				.content1 {
					background-color: #f1f2ed;
					width: 100%;
					height: 600px;
					border: none;
				}

				p {
					font-size: 30px;
					font-weight: 800;
				}

				a {
					text-decoration: none;
					color: black;
				}

				.productName {
					text-align: center;
					padding: 20px;
				}

				#carouselTop {
					width: 1000px;
				}

				/*상품 캐러셀 (카드)*/
				.card {
					width: 100%;
					height: 400px;
					border: none;
					< !--background-color: #f1f2ed;
					-->
				}

				.cardimg {
					width: 100%;
					height: 300px;
				}

				.productName {
					text-align: center;
				}

				/*상품 캐러셀(버튼)*/
				.carousel-c-next {
					padding: 0;
					background: 0 0;
					border: 0;
					opacity: .5;
					transition: opacity .15s ease;
					float: right;
				}

				.carousel-c-prev {
					padding: 0;
					background: 0 0;
					border: 0;
					opacity: .5;
					transition: opacity .15s ease;
				}

				.btnImg img {
					width: 50px;
				}

				.ranknum {
					background-color: #b0323d;
				}

				.ranknum>span {
					font-size: 20px;
					font-weight: 30px;
					color: white;
				}

				.carousel-inner {
					height: 415px;
				}

				.productName>p {
					font-size: 50px;
					font-weight: 60px;
				}

				.productName>span {
					font-size: 25px;
					font-weight: bold;
				}

				/*content2*/
				.imgBox #Cimg {
					width: 400px;
					height: 400px;
					border: 1px solid lightgrey;
				}

				.imgBox:hover {
					/* transform: scale(105%); */
					opacity: 0.8;
				}

				.imgBox {
					padding-top: 30px;
				}

				.imgText {
					text-align: center;
					font-size: 18px;
					font-size: 25px;
					font-weight: 40px;
				}

				/* 3열 */
				.clothes {
					padding-top: 60px;
				}

				.imgContainer {
					text-align: center;
				}

				.category>p {
					font-size: 60px;
					font-weight: 60px;
				}

				/*풋터 영역*/
				.footerBox {
					height: 200px;

				}

				footer.footer {
					padding-top: 4rem;
					padding-bottom: 4rem;
				}

				.footer a {
					text-decoration: none;
					color: black;
					font-weight: 40px;
					font-weight: bold;
				}

				/*navibar*/
				.navbar {
					margin-left: 0;
					margin-right: 0;
				}
			</style>
		</head>

		<body>
			<div class="container MainBox">
				<!-- 네비바 -->
				<nav class="navbar navbar-light bg-light fixed">
					<div class="container">
						<a class="navbar-brand" href="/Tohome" id="logo"><img id="logo" src="/resources/images/Logo3.png"
								alt="HypeFriend"></a>
						<div class="col-md-1  navbar-anchor"><a href="/ToCompany.page">COMPANY</a></div>
						<div class="dropdown ">
							<button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"
								style="font-weight: bold;">
								CLOTHES
							</button>
							<ul class="dropdown-menu nav-category" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item" href="/ToPage.page?category=TOP">TOP</a></li>
								<li><a class="dropdown-item" href="/ToPage.page?category=BOTTOM">BOTTOM</a></li>
								<li><a class="dropdown-item" href="/ToPage.page?category=ACCESSORY">ACCESSORY</a></li>
								<li><a class="dropdown-item" href="/ToPage.page?category=BAG">BAG</a></li>
							</ul>
						</div>
						<div class="col-md-1 navbar-anchor"><a href="/TosearchMap.page">Shop</a></div>
						<div class="col-md-1 navbar-anchor"><a href="/toCs.mem">CS</a></div>

						<div class="col-md-4 navbar-anchor" id="userIcon">
							<c:choose>
								<c:when test="${not empty loginSession}">
									<!-- 로그인했으면 -->
									<a href="/toCart.mem"><i class="fa-solid fa-cart-plus"></i></a>
									<div class="dropdown" style="display: inline;">
										<i class="fa-solid fa-user" data-bs-toggle="dropdown" aria-expanded="false"></i>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
											<li><a class="dropdown-item" href="/toMypage.mem">마이페이지</a></li>
											<li><a class="dropdown-item" href="/logoutProc.mem">로그아웃</a></li>
										</ul>
									</div>
									<span style="font-size: 10px;">${loginSession.user_id}님</span>
								</c:when>

								<c:otherwise>
									<!-- 로그인 안하면 -->
									<i id="loginIcon" class="fa-solid fa-cart-plus"></i></a>
									<i id="loginIcon2" class="fa-solid fa-user"></i>
									<script>
										document.getElementById("loginIcon2").onclick = function () {
											let url = "/toLogin.mem";
											let name = "로그인";
											let option = "width=600, height=700, left=700, top=300";
											window.open(url, name, option);
										}
										document.getElementById("loginIcon").onclick = function () {
											let url = "/toLogin.mem";
											let name = "로그인";
											let option = "width=600, height=700, left=700, top=300";
											window.open(url, name, option);
										}
									</script>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</nav>
			</div>

			<input id="url" name="url" type="hidden" value="/Tohome">

			<!-- 헤더 사진 -->
			<div class="header-img" id="header">
				<c:if test="${category eq 'TOP' }">
					<img src="./resources/images/header-image-top.jpg" class="header-image">
				</c:if>
				<c:if test="${category eq 'BOTTOM' }">
					<img src="./resources/images/header-image_bottom.jpg" class="header-image">
				</c:if>
				<c:if test="${category eq 'ACCESSORY' }">
					<img src="./resources/images/header-image-acc.jpg" class="header-image">
				</c:if>
				<c:if test="${category eq 'BAG' }">
					<img src="./resources/images/header-image-bag.jpg" class="header-image">
				</c:if>
			</div>

			<!-- 상품 캐러셀 -->
			<div class="content1">
				<div class="row">
					<div class="col productName">
						<p>RANKING</p>
					</div>
				</div>

				<div class="row">
					<div class="col-12 imageBox d-flex justify-content-center">
						<div id="carouselTop" class="carousel carousel-dark slide data-bs-pause" data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="row">
										<c:forEach items="${rimgList}" var="rimgList" varStatus="status">
											<c:if test="${status.index<4}">
												<div class="col-lg-3">
													<a href="/detailPage.page?seq_product=${rimgList.seq_product}">
														<div class="card">
															<div class="row">
																<div class="col-2 ranknum d-flex justify-content-center">
																	<span>${status.index+1 }</span>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="cardimg">
																		<img src="../resource/imagesClothes/${rimgList.image_name}" class="cardimg">
																	</div>
																</div>
															</div>
															<div class="row card-text">
																<div class="col-12 productName">
																	<span>${pList[status.index].product_name }</span>
																</div>
															</div>
														</div>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<c:forEach items="${rimgList}" var="rimgList" varStatus="status">
											<c:if test="${status.index>=4}">
												<div class="col-lg-3">
													<a href="/detailPage.page?seq_product=${rimgList.seq_product}">
														<div class="card">
															<div class="row">
																<div class="col-2 ranknum d-flex justify-content-center">
																	<span>${status.index+1 }</span>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="cardimg">
																		<img src="../resource/imagesClothes/${rimgList.image_name}" class="cardimg">
																	</div>
																</div>
															</div>
															<div class="row card-text">
																<div class="col-12 productName">
																	<span>${pList[status.index].product_name }</span>
																</div>
															</div>
														</div>
													</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>

							</div>
							<div class="btnClass">
								<button class="carousel-c-prev btnImg" type="button" data-bs-target="#carouselTop" data-bs-slide="prev">
									<img src="resources/images/caret-left.png">
								</button>
								<button class="carousel-c-next btnImg" type="button" data-bs-target="#carouselTop" data-bs-slide="next">
									<img src="resources/images/caret-right.png">
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--3열 옷사진-->
			<div class="row clothes">
				<div class="col">
					<div class="content2">
						<div class="row title">
							<div class="col p-4 d-flex justify-content-center category">
								<p>${category}</p>
							</div>
						</div>
						<div class="imgContainer">
							<c:if test="${cnt <= 3}">
								<div class="row">
									<c:forEach items="${imgList}" var="imgList" varStatus="status">
										<div class="col-md-4 d-block justify-content-center p-4">
											<a href="detailPage.page?seq_product=${proList[status.index].seq_product }">
												<div class="imgBox">
													<img src="./resource/imagesClothes/${imgList.image_name}" id="Cimg">
												</div>
												<div class="imgText">
													<strong>${proList[status.index].product_name }</strong><br>
													<fmt:formatNumber value="${proList[status.index].product_price}" pattern="#,###"/>원
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${cnt>3}">
								<c:forEach items="${imgList }" var="imgList" varStatus="status">
									<c:if test="${status.index%3 eq 0 }">
										<div class="row">
											<div class="col-md-4 d-block justify-content-center p-4">
												<div class="imgBox">
													<a href="detailPage.page?seq_product=${proList[status.index].seq_product }">
														<img src="../resource/imagesClothes/${imgList.image_name}" id="Cimg">
													</a>
												</div>
												<div class="imgText">
													<strong>${proList[status.index].product_name }</strong><br>
													<fmt:formatNumber value="${proList[status.index].product_price}" pattern="#,###"/>원
												</div>
											</div>
									</c:if>
									<c:if test="${status.index%3 eq 1 }">
										<div class="col-md-4 d-block justify-content-center p-4">
											<div class="imgBox">
												<a href="detailPage.page?seq_product=${proList[status.index].seq_product }">
													<img src="../resource/imagesClothes/${imgList.image_name}" id="Cimg">
												</a>
											</div>
											<div class="imgText">
												<strong>${proList[status.index].product_name }</strong><br>
												<fmt:formatNumber value="${proList[status.index].product_price}" pattern="#,###"/>원
											</div>
										</div>
									</c:if>
									<c:if test="${status.index%3 eq 2 }">
										<div class="col-md-4 d-block justify-content-center p-4">
											<div class="imgBox">
												<a href="detailPage.page?seq_product=${proList[status.index].seq_product }">
													<img src="../resource/imagesClothes/${imgList.image_name}" id="Cimg">
												</a>
											</div>
											<div class="imgText">
												<strong>${proList[status.index].product_name }</strong><br>
												<fmt:formatNumber value="${proList[status.index].product_price}" pattern="#,###"/>원
											</div>
										</div>
						</div>
						</c:if>
						</c:forEach>
						</c:if>

					</div>

				</div>
			</div>


			<!-- 맨위로 올라가기 -->
			<div class="top" style="position: fixed; bottom: 30px; left: 95%;">
				<a href="#header"><i class="fa-solid fa-circle-arrow-up fa-3x"></i></a>
			</div>

			<!-- Footer-->
			<footer class="footer bg-light mt-5">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 h-100 text-center text-lg-start my-auto">
							<ul class="list-inline mb-2">
								<li class="list-inline-item"><a href="/ToCompany.page">COMPANY</a></li>
								<li class="list-inline-item">⋅</li>
								<li class="list-inline-item"><a href="/TosearchMap.page">매장찾기</a></li>
								<li class="list-inline-item">⋅</li>
								<li class="list-inline-item"><a href="/toCs.mem">고객센터</a></li>
								<li class="list-inline-item">⋅</li>
								<li class="list-inline-item">
									<p style="color: red; font-weight: bold; font-size: 1rem;">개인정보처리방침</p>
								</li>

							</ul>
							<p class="text-muted small mb-4 mb-lg-0">하잇프랜드(주) 대표 : 이호준 | 개인정보관리책임자 : 김영완 | 사업자등록번호 : 22-02-22</p>
							<p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩</p>
							<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2022. All Rights Reserved.</p>
						</div>
						<div class="col-lg-6 h-100 text-center text-lg-end my-auto">
							<ul class="list-inline mb-0">
								<li class="list-inline-item me-4">
									<a href="https://ko-kr.facebook.com/" target="_blank"><i class="bi-facebook fs-3"></i></a>
								</li>
								<li class="list-inline-item me-4">
									<a href="https://twitter.com/?lang=ko" target="_blank"><i class="bi-twitter fs-3"></i></a>
								</li>
								<li class="list-inline-item">
									<a href="https://www.instagram.com/" target="_blank"><i class="bi-instagram fs-3"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>

		</body>

		</html>