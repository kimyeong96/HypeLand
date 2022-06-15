<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>OrderList</title>
                <!-- Favicon-->
                <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
                <!-- Bootstrap icons-->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
                    rel="stylesheet" type="text/css" />
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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
                    rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                    crossorigin="anonymous">
                <!-- fontAwessome-->
                <script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
                <!-- 아이엠포트 -->
                <!-- jQuery -->
                <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
                <!-- iamport.payment.js -->
                <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
                <style>
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


                    .header-comment {
                        padding: 20px;
                        border-bottom: 1px solid lightgray;
                    }

                    .productImg {
                        width: 5rem;
                        height: 5rem;
                        margin-left: 1rem;
                    }

                    table {
                        border: 1px solid lightgray;
                    }

                    .userInfo td {
                        padding: 1rem;
                        font-size: 0.8rem;
                        font-weight: bold;
                    }

                    .productInfo td,
                    th {
                        text-align: center;
                        vertical-align: middle;
                        font-size: 0.8rem;
                    }

                    .P-Option {
                        width: 80%;
                        text-align: center;
                    }

                    .disabled {
                        pointer-events: none;
                        background-color: #00000010;
                        color: black;
                        opacity: 1;
                    }

                    .section {
                        border-top: 1px solid lightgray;
                    }

                    .destination {
                        margin-right: 5%;
                    }

                    .comment {
                        margin-left: 1rem;
                        font-size: 0.8rem;
                        color: lightgray;
                    }

                    .place-change {
                        background-color: white;
                        border: 1px solid lightgray;
                    }

                    .total td {
                        height: 3rem;
                        font-size: 1rem;
                        font-weight: bold;
                    }

                    .buyer_info {
                        width: 200px;
                    }

                    .phone {
                        width: 100px;
                        height: 30px;
                        border: 1px solid lightgray;
                        font-size: 0.8rem;
                    }



                    .guideline {
                        opacity: 0.7;
                        font-size: 0.5rem;
                    }

                    .btnOrder {
                        width: 10rem;
                        height: 4rem;
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
                </style>
                <script>

                    $(document).ready(function () {
                        $(".btnHome").on("click", function () {
                            location.href = "/Tohome";
                        })
                    });

                </script>
            </head>

            <body>
                <c:set var="user_phone" value="${loginSession.user_phone}" />
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
                                    <li><a class="dropdown-item" href="/ToPage.page?category=ACCESSORY">ACCESSORY</a>
                                    </li>
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
                                            <i class="fa-solid fa-user" data-bs-toggle="dropdown"
                                                aria-expanded="false"></i>
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

                <div class="container" style="border: 1px solid lightgray; margin-top: 150px;">
                    <div class="row">
                        <div class="col header-comment">
                            <h3 style="display: inline-block;">OrderList</h3>
                            <span class="comment">주문 내역</span>
                        </div>
                    </div>

                    <div class="row section">
                        <div class="col mt-4 ms-2">
                            <h3 style="display: inline-block;">Product Info</h3>
                            <span class="comment">상품 정보</span>
                        </div>
                    </div>
                    <table class="table productInfo mt-4">
                        <thead>
                            <tr>
                                <th scope="col" class="col-6" colspan="2">상품 정보</th>
                                <th scope="col">판매가</th>
                                <th scope="col">수량</th>
                                <th scope="col">배송비</th>
                                <th scope="col">주문금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${buyList}" var="buyList" varStatus="status">
                                <c:set var="name" value="${name + 1}" />
                                <tr>
                                    <td class="col-1"><a
                                            href="/detailPage.page?seq_product=${productList[status.index].seq_product}"><img
                                                class="productImg"
                                                src="/resource/imagesClothes/${imageList[status.index].image_name}"></a>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="col-12">
                                                <p class="P-Name">${buyList.buy_name}</p>
                                            </div>
                                            <div class="col">
                                                <input type="text" class="P-Option disabled" value="옵션 : SIZE / FREE">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="product_price">&#8361;</td>
                                    <td class="quantity">${buyList.buy_qty}개</td>
                                    <td>무료</td>
                                    <td class="total_price">&#8361;</td>
                                    <input type="hidden" class="cart_price" value="${buyList.buy_price}">
                                    <input type="hidden" class="qty" value="${buyList.buy_qty}">
                                </tr>
                            </c:forEach>
                            <tr class="total">
                                <td></td>
                                <td class="total">Total</td>
                                <td></td>
                                <td class="total" id="orderTotalCnt" name="orderTotalCnt">${qty}개</td>
                                <td class="total">무료</td>
                                <td class="total" id="total">&#8361;</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center m-4">
                            <button type="button" class="btn btn-secondary w-50" id="btnBack">뒤로가기</button>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col">
                            <ul class="guideline">
                                <li>하이프랜드는 <span>전 지역, 전 상품 무료 배송입니다.</span></li>
                                <li>하이프랜드의 모든 상품은 해외배송 불가능합니다.</li>
                                <li>하이프랜드에 모든 주문건은 무통장 입금이 불가능합니다.</li>
                                <li>낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.</li>
                                <li>환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</li>
                                <li>모든 상품은 환불 시 택배비가 발생합니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                </div>

                <input type="hidden" id="user_addr" name="user_addr"
                    value="${loginSession.user_roadAddr} ${loginSession.user_detailAddr}" />
                <input type="hidden" id="payName" value="${pay_list[0].product_name}" />
                <input type="hidden" id="payCnt" name="payCnt" value=<c:out value="${name-1}" /> />
                <input type="hidden" id="phone" name="phone" />
                <input type="hidden" id="seq_deli" name="seq_deli" />
                </form>
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
                                <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2022. All Rights Reserved.
                                </p>
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
                const qty = document.getElementsByClassName('qty');
                const price = document.getElementsByClassName('cart_price');
                const total = document.getElementsByClassName('total_price');
                const product_price = document.getElementsByClassName('product_price');
                const arr = new Array(price.length);
                const arr1 = new Array(price.length);
                const total_price = Number('${total_price}').toLocaleString('en-US');
                document.getElementById('total').innerHTML += total_price + '원';

                for (let i = 0; i < price.length; i++) {
                    arr[i] = Number(price[i].value) * Number(qty[i].value);
                    total[i].innerHTML += Number(arr[i]).toLocaleString('en-US');
                }

                for (let i = 0; i < price.length; i++) {
                    arr1[i] = price[i].value;
                    product_price[i].innerHTML += Number(arr1[i]).toLocaleString('en-US');
                }

                document.getElementById("btnBack").onclick = function () {
                    location.href = "/toMypage.mem";
                }
            </script>

            </html>