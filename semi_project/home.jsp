<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>HypeFriend</title>
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
      <!-- css -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/home.css">
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
      <!-- 캐러셀-->
      <header class="masthead w-100" style="margin-top: 60px; ">
        <!-- 캐러셀 영역1-->
        <div id="carousel_1" class="carousel slide d-flex" data-bs-ride="false">
          <div class="wrap">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carousel_1" data-bs-slide-to="0" class="active" aria-current="true"
                aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carousel_1" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carousel_1" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
          </div>

          <!--1번 캐러셀-->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="textBox">
                <p class="textTitle">
                  <strong>HYPEFRIEND</strong>
                </p>
                <p><strong>2022 Spring / Summer Collection<br>
                    [6/13(월) 판매 개시]
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=TOP'">VIEW MORE</button>
              </div>
              <img class="carouselFimg" src="resources/images/main1-1.jpg" onclick="location.href='/ToPage.page?category=TOP'" class="d-block w-100" alt="...">
            </div>
            <!--2번 캐러셀-->
            <div class="carousel-item">
              <img class="carouselFimg" src="resources/images/main1-2.jpg" onclick="location.href='/ToPage.page?category=TOP'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>HYPEFRIEND</strong>
                </p>
                <p><strong>2022 Spring / Summer Collection<br>
                  [6/13(월) 판매 개시]
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=TOP'">VIEW MORE</button>
              </div>
            </div>
            <!--3번 캐러셀-->
            <div class="carousel-item">
              <img class="carouselFimg" src="resources/images/main1-3.jpg" onclick="location.href='/ToPage.page?category=TOP'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>HYPEFRIEND</strong>
                </p>
                <p><strong>2022 Spring / Summer Collection<br>
                  [6/13(월) 판매 개시]
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=TOP'">VIEW MORE</button>
              </div>
            </div>
          </div>
          <button class="carousel-c-prev" type="button" data-bs-target="#carousel_1" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="visually">Prev</span>
          </button>
          <button class="carousel-c-next" type="button" data-bs-target="#carousel_1" data-bs-slide="next">
            Next
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>

        <!-- 캐러셀 영역2-->
        <div id="carousel_2" class="carousel slide d-flex" data-bs-ride="false">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carousel_2" data-bs-slide-to="0" class="active" aria-current="true"
              aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carousel_2" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carousel_2" data-bs-slide-to="2" aria-label="Slide 3"></button>

          </div>
          <!--1번 캐러셀-->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="textBox">
                <p class="textTitle">
                  <strong>MASTERPIECE</strong>
                </p>
                <p><strong>Simplicity, made even better<br>
                    HYPEFRIEND는 완벽을 추구합니다.
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=ACCESSORY'">VIEW MORE</button>
              </div>
              <img class="carouselImg" src="resources/images/main2-1.jpg" onclick="location.href='/ToPage.page?category=ACCESSORY'" class="d-block w-100" alt="...">
            </div>
            <!--2번 캐러셀-->
            <div class="carousel-item">
              <img class="carouselImg" src="resources/images/main2-2.jpg" onclick="location.href='/ToPage.page?category=ACCESSORY'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>MASTERPIECE</strong>
                </p>
                <p><strong>Simplicity, made even better<br>
                  HYPEFRIEND는 완벽을 추구합니다.
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=ACCESSORY'">VIEW MORE</button>
              </div>
            </div>
            <!--3번 캐러셀-->
            <div class="carousel-item">
              <img class="carouselImg" src="/resources/images/main2-3.jpg" onclick="location.href='/ToPage.page?category=ACCESSORY'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>MASTERPIECE</strong>
                </p>
                <p><strong>Simplicity, made even better<br>
                  HYPEFRIEND는 완벽을 추구합니다.
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=ACCESSORY'">VIEW MORE</button>
              </div>
            </div>
          </div>
          <button class="carousel-c-prev" type="button" data-bs-target="#carousel_2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="visually">Prev</span>
          </button>
          <button class="carousel-c-next" type="button" data-bs-target="#carousel_2" data-bs-slide="next">
            <span class="visually">Next</span>
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>

        <!--캐러셀 영역3-->
        <div id="carousel_3" class="carousel slide d-flex" data-bs-ride="false">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carousel_3" data-bs-slide-to="0" class="active" aria-current="true"
              aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carousel_3" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carousel_3" data-bs-slide-to="2" aria-label="Slide 3"></button>

          </div>
          <!--1번 캐러셀-->
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="carouselImg" src="/resources/images/main3-1.jpg" onclick="location.href='/ToPage.page?category=BOTTOM'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>HELLO, SUMMER</strong>
                </p>
                <p><strong>다채로운 컬러와 소재의 쇼트팬츠로<br>
                    뜨거운 여름을 준비해보세요
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=BOTTOM'">VIEW MORE</button>
              </div>
            </div>
            <!--2번 캐러셀-->
            <div class="carousel-item">
              <img class="carouselImg" src="/resources/images/main3-2.jpg" onclick="location.href='/ToPage.page?category=BOTTOM'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>HELLO, SUMMER</strong>
                </p>
                <p><strong>다채로운 컬러와 소재의 쇼트팬츠로<br>
                    뜨거운 여름을 준비해보세요
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=BOTTOM'">VIEW MORE</button>
              </div>
            </div>
            <!--3번 캐러셀-->
            <div class="carousel-item">
              <img class="carouselImg" src="/resources/images/main3-3.jpg" onclick="location.href='/ToPage.page?category=BOTTOM'" class="d-block w-100" alt="...">
              <div class="textBox">
                <p class="textTitle">
                  <strong>HELLO, SUMMER</strong>
                </p>
                <p><strong>다채로운 컬러와 소재의 쇼트팬츠로<br>
                    뜨거운 여름을 준비해보세요
                  </strong></p>
                <button class="viewMore" type="button" onclick="location.href='/ToPage.page?category=BOTTOM'">VIEW MORE</button>
              </div>
            </div>
          </div>
          <button class="carousel-c-prev" type="button" data-bs-target="#carousel_3" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually">Prev</span>
          </button>
          <button class="carousel-c-next" type="button" data-bs-target="#carousel_3" data-bs-slide="next">
            <span class="visually">Next</span>
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
          </button>
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

    <script>
      let BK = '${BK}';
      if (BK == 'BK') {
        alert('차단 된 사용자입니다. CS로 문의바랍니다.');
      }
    </script>

    </html>