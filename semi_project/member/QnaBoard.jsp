<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

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
            <title>문의내역</title>
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


                .page_wrap {
                    text-align: center;
                    font-size: 0;
                }

                .page_nation {
                    display: inline-block;
                }

                .page_nation .none {
                    display: none;
                }

                .page_nation a {
                    display: block;
                    margin: 0 3px;
                    float: left;
                    border: 1px solid #e6e6e6;
                    width: 28px;
                    height: 28px;
                    line-height: 28px;
                    text-align: center;
                    background-color: #fff;
                    font-size: 13px;
                    color: #999999;
                    text-decoration: none;
                }

                .page_nation .arrow {
                    border: 1px solid #ccc;
                }

                .page_nation .pprev {
                    background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
                    margin-left: 0;
                }

                .page_nation .prev {
                    background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
                    margin-right: 7px;
                }

                .page_nation .next {
                    background: #f8f8f8 url('img/page_next.png') no-repeat center center;
                    margin-left: 7px;
                }

                .page_nation .nnext {
                    background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
                    margin-right: 0;
                }


                .container {
                    text-align: center;
                }

                .title {
                    font-size: 0.8rem;
                    font-weight: bold;
                }

                .section {
                    border-bottom: 1px solid lightgray;
                    font-size: 0.8rem;
                }

                .num {
                    font-weight: bold;
                }

                .accordion-body {
                    background: #d4d4d440;
                    font-weight: bold;
                }

                .csPart {
                    font-size: 0.8rem;
                }

                .content,
                .replyContent {
                    text-align: left;
                    margin-left: 100px;
                    font-size: 0.8rem;
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

            <div class="container" style="margin-top: 120px;">
                <div class="row section pb-2">
                    <div class="col-1 title">번호</div>
                    <div class="col-2 title">문의유형</div>
                    <div class="col-3 title">제목</div>
                    <div class="col-2 title">작성자</div>
                    <div class="col-2 title">처리 상태</div>
                    <div class="col-2 title">작성일</div>
                </div>
                <c:choose>
                    <c:when test="${list.size() == 0}">
                        <div class="row mt-2 section pb-2">
                            <div class="col-12">
                                <p>등록된 문의글이 없습니다.</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="dto" varStatus="status">
                            <!--첫줄 시작-->
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="FAQToggle">
                                    <div class="row mt-2 section pb-2">
                                        <div class="col-1 num">${dto.seq_qna}</div>
                                        <div class="col-2">${dto.qna_type}</div>
                                        <div class="col-3">
                                            <input type="hidden" value="${dto.seq_qna}" class="qna">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapse${dto.seq_qna}" aria-expanded="true"
                                                aria-controls="collapseOne"
                                                style="display: inline; text-align: center;">
                                                ${dto.qna_title}
                                            </button>
                                        </div>
                                        <div class="col-2">${dto.user_id}</div>
                                        <div class="col-2 status">${dto.qna_status}</div>
                                        <div class="col-2">${dto.qna_date}</div>
                                    </div>
                                </h2>
                                <div id="collapse${dto.seq_qna}" class="accordion-collapse collapse"
                                    aria-labelledby="FAQToggle" data-bs-parent="#accordionExample">
                                    <div class="accordion-body row">
                                        <div class="csPart col-2 pt-5 pb-5">
                                        </div>
                                        <div class="col-10">
                                            <p class="content pt-5 pb-5">${dto.qna_content}</p>
                                        </div>
                                    </div>
                                    <div class="accordion-body row mt-2 answer">
                                        <div class="csPart col-2 pt-5 pb-5">
                                            하이프랜드 CS담당자
                                        </div>
                                        <div class="col-10">
                                            <p class="replyContent pt-5 pb-5">${reply[status.index].qna_reply}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <c:forEach items="${reply}" var="reply">
                    <input type="hidden" class="reply" value="${reply.qna_reply}">
                </c:forEach>

                <div class="row mt-5 mb-5" style="text-align: center;">
                    <div class="col">
                        <input type="text" id="searchKeyword">
                        <select name="searchType" id="searchType">
                            <option class="type" value='qna_title'>제목</option>
                            <option class="type" value='qna_content'>내용</option>
                            <option class="type" value='qna_type'>문의유형</option>
                            <option class="type" value='qna_status'>처리상태</option>
                        </select>
                        <button type="button" id="search">검색</button>
                    </div>
                </div>

                <div class="page_wrap mb-5">
                    <div class="page_nation">
                        <c:if test="${naviMap.needPrev eq true}">
                            <a class="arrow prev" href="/toQnaBoard.mem?curPage=${naviMap.startNavi-1}">
                                < </a>
                        </c:if>
                        <c:forEach var="pageNum" begin="${naviMap.startNavi}" end="${naviMap.endNavi}" step="1">
                            <a href="/toQnaBoard.mem?curPage=${pageNum}" value="${pageNum}"
                                class="paging">${pageNum}</a>
                        </c:forEach>

                        <c:if test="${naviMap.needNext eq true}">
                            <a class="arrow next" href="/toQnaBoard.mem?curPage=${naviMap.endNavi+1}">></a>
                        </c:if>

                    </div>
                </div>

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
            const active = document.getElementsByClassName('paging');
            const searchType = document.getElementById('searchType');
            const type = searchType.options[searchType.selectedIndex].value;
            const searchKeyword = document.getElementById('searchKeyword');


            for (let i = 0; i < active.length; i++) {
                if (active[i].innerText == '${curPage}') {
                    active[i].style.cssText = "background-color: #42454c; color: #fff; border: 1px solid #42454c;";
                }
            };

            if ('${searchKeyword}' !== "" || '${searchType}' !== "") {
                for (let i = 0; i < active.length; i++) {
                    active[i].setAttribute("href", "/toSearchProc.mem?curPage=" + (i + 1) + "&searchType=" + '${searchType}' + "&searchKeyword=" + '${searchKeyword}');
                }
            };



            const status = document.getElementsByClassName('status');
            const answer = document.getElementsByClassName('answer');
            const replyContent = document.getElementsByClassName('replyContent');
            const reply = document.getElementsByClassName('reply');
            let j = 0;
            for (let i = 0; i < status.length; i++) {
                if (status[i].innerText == '답변대기') {
                    answer[i].style.display = "none";
                } else if (status[i].innerText == '답변완료') {
                    status[i].style.color = 'blue';
                    replyContent[i].innerHTML = reply[j].value;
                    j++;
                }
            };

            $('#search').on('click', function () {
                if ($('#searchType option:selected').val() == 'qna_title') {
                    location.href = "/toSearchProc.mem?curPage=" + "${curPage}" + '&searchType=qna_title&searchKeyword=' + searchKeyword.value;
                } else if ($('#searchType option:selected').val() == 'qna_content') {
                    location.href = "/toSearchProc.mem?curPage=" + "${curPage}" + '&searchType=qna_content&searchKeyword=' + searchKeyword.value;
                } else if ($('#searchType option:selected').val() == 'qna_type') {
                    location.href = "/toSearchProc.mem?curPage=" + "${curPage}" + '&searchType=qna_type&searchKeyword=' + searchKeyword.value;
                } else if ($('#searchType option:selected').val() == 'qna_status') {
                    location.href = "/toSearchProc.mem?curPage=" + "${curPage}" + '&searchType=qna_status&searchKeyword=' + searchKeyword.value;
                }
            });
        </script>

        </html>