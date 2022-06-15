<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>내 정보</title>
            <!-- Favicon-->
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Bootstrap icons-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"
                type="text/css" />
            <!-- Google fonts-->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap"
                rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
                rel="stylesheet" type="text/css" />
            <!-- Core theme CSS (includes Bootstrap)-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                crossorigin="anonymous">
            <!-- fontAwessome-->
            <script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <!-- css -->
            <link rel="stylesheet" href="<%=request.getContextPath()%>/member/css/myPage.css">
        </head>

        <body>
            <div class="container MainBox">
                <!-- 네비바 -->
                <nav class="navbar navbar-light bg-light fixed">
                    <div class="container">
                        <a class="navbar-brand" href="/Tohome" id="logo"><img id="logo"
                                src="/resources/images/Logo3.png" alt="HypeFriend"></a>
                        <div class="col-md-1  navbar-anchor"><a href="/ToCompany.page">COMPANY</a></div>
                        <div class="dropdown ">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                aria-expanded="false" style="font-weight: bold;">
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

            <!-- 바디-->
            <header class="masthead w-100">
                <div class="container" id="contentBox">
                    <div class="row">
                        <div class="col">
                            <h3 class="header">${loginSession.user_id}님 환영합니다.</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h6 class="info mb-4" id="totalPrice">누적 구매 금액: </h6>
                        </div>
                    </div>
                </div>

                <div class="container" id="contentBox2">
                    <div class="row">
                        <div class="col-12 col-sm-12" style="border-bottom: 1px solid lightgrey; height: auto; ">
                            <h5 class="orderInfo">나의 주문 처리현황</h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-4 ship_info">
                            <p style="margin-top: 20px; margin-bottom: 5px;">주문건수</p>
                            <h3>${totalCnt}</h3>
                        </div>
                        <div class="col-12 col-sm-4 ship_info_right">
                            <p style="margin-top: 20px; margin-bottom: 5px;">배송중</p>
                            <h3>${deliveryCnt}</h3>
                        </div>
                        <div class="col-12 col-sm-4 ship_info_right">
                            <p style="margin-top: 20px; margin-bottom: 5px;">배송완료</p>
                            <h3>${deliveryCompletCnt}</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 mp_info" id="profile">
                            <p class="infoTextHeader d-inline-block" style="font-size: 25px ;"><Strong>Profile</Strong>
                            </p><span style="margin-left: 20px;"> 회원 정보</span><br>
                            <p class="infoText" style="font-size: 15px ;">
                                고객님께서 가입하신 회원정보를 확인 및<br>
                                수정하실 수 있습니다.
                            </p>
                        </div>
                        <div class="col-12 col-sm-6 mp_info_right" onclick="location.href='/toCart.mem'">
                            <p class="infoTextHeader d-inline-block" style="font-size: 25px ;"><Strong>Cart</Strong></p>
                            <span style="margin-left: 20px;"> 장바구니</span>
                            <p class="infoText" style="font-size: 15px ;">
                                고객님께서 장바구니에 담은 상품을 확인<br>
                                하실 수 있습니다.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 mp_info"
                            style="border-bottom: none; border-right: 1px solid lightgray;"
                            onclick="location.href='/toQnaBoard.mem?curPage=1'">
                            <p class="infoTextHeader d-inline-block" style="font-size: 25px ;"><Strong>Board</Strong>
                            </p><span style="margin-left: 20px;"> Q&A 게시물 관리</span>
                            <p class="infoText" style="font-size: 15px ;">
                                고객님께서 작성하신 상품평 및 문의글을<br>
                                한눈에 관리하실 수 있습니다.
                            </p>
                        </div>
                        <div class="col-12 col-sm-6 mp_info"
                            style="border-bottom: none; border-right: 1px solid lightgray;"
                            onclick="location.href='/toOrderList.pay'">
                            <p class="infoTextHeader d-inline-block" style="font-size: 25px ;">
                                <Strong>OrderList</Strong></p><span style="margin-left: 20px;"> 구매내역</span>
                            <p class="infoText" style="font-size: 15px ;">
                                고객님께서 구매하신 제품의 목록을<br>
                                한눈에 확인 하실 수 있습니다.
                            </p>
                        </div>
                    </div>
                </div>
            </header>
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
                                    <p style="color: red; font-weight: bold;">개인정보처리방침</p>
                                </li>

                            </ul>
                            <p class="text-muted small mb-4 mb-lg-0">하잇프랜드(주) 대표 : 이호준 | 개인정보관리책임자 : 김영완 | 사업자등록번호 :
                                22-02-22</p>
                            <p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩</p>
                            <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2022. All Rights Reserved.</p>
                        </div>
                        <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item me-4">
                                    <a href="https://ko-kr.facebook.com/" target="_blank"><i
                                            class="bi-facebook fs-3"></i></a>
                                </li>
                                <li class="list-inline-item me-4">
                                    <a href="https://twitter.com/?lang=ko" target="_blank"><i
                                            class="bi-twitter fs-3"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="https://www.instagram.com/" target="_blank"><i
                                            class="bi-instagram fs-3"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </body>
        <script>
            $("#profile").on("click", function () {
                if ('${loginSession.user_id}'.indexOf('@') === -1) {
                    location.href = '/toMemberInfo.mem?user_id=' + '${loginSession.user_id}'
                    return;
                }
                alert("카카오 계정은 접근 할 수 없습니다.");
            })

            const total = Number(${ totalPrice }).toLocaleString('en-US');
            document.getElementById('totalPrice').innerHTML += total + '원';

        </script>

        </html>