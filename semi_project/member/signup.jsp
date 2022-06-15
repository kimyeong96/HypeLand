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
      <script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <link rel="stylesheet" href="<%=request.getContextPath()%>css/signup.css">
      <title>회원가입</title>

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

      <div class="container" style="margin-top: 150px;">

        <!-- 약관 -->
        <div class="row">
          <div class="wrap">
            <div class="logo mt-2 mb-5">
              <h2 style="font-weight: bold;">회원가입</h2>
            </div>
            <div class="contents">
              <form action="/" method="POST" id="form__wrap">
                <div class="terms__check__all">
                  <input type="checkbox" name="checkAll" id="checkAll" class="mt-1">
                  <label for="checkAll">HYPEFRIEND 이용약관, 개인정보 수집 및 이용, 프로모션 정보
                    수신(선택)에 모두 동의합니다.</label>
                </div>
                <ul class="terms__list">
                  <li class="terms__box">
                    <div class="input__check">
                      <input type="checkbox" name="agreement" id="termsOfService" value="termsOfService" required />
                      <label for="termsOfService" class="required">HYPEFRIEND 이용약관 동의</label>
                    </div>
                    <div class="terms__content">
                      여러분을 환영합니다. 하이프랜드 서비스 및 제품(이하 ‘서비스’)을 이용해
                      주셔서 감사합니다. 본 약관은 다양한 하이프랜드 서비스의 이용과 관련하여
                      하이프랜드 서비스를 제공하는 하이프랜드 주식회사(이하 하이프랜드)와 이를 이용하는
                      하이프랜드 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
                      아울러 여러분의 하이프랜드 서비스 이용에 도움이 될 수 있는 유익한
                      정보를 포함하고 있습니다. 하이프랜드 서비스를 이용하시거나 하이프랜드 서비스
                      회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을
                      확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐
                      주시기 바랍니다.
                    </div>
                  </li>
                  <li class="terms__box">
                    <div class="input__check">
                      <input type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required />
                      <label for="privacyPolicy" class="required">개인정보 수집 및 이용 동의</label>
                    </div>
                    <div class="terms__content">
                      개인정보보호법에 따라 하이프랜드에 회원가입 신청하시는 분께 수집하는
                      개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및
                      이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내
                      드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는
                      개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등
                      대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.
                      이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제
                      서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스
                      이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                    </div>
                  </li>
                  <li class="terms__box">
                    <div class="input__check">
                      <input type="checkbox" name="agreement" id="allowPromotions" value="allowPromotions" />
                      <label for="allowPromotions">프로모션 정보 수신 동의</label>
                      <span class="star">(선택)</span>
                    </div>
                    <div class="terms__content">
                      하이프랜드에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(하이프랜드앱
                      알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도
                      회원 체계로 운영하거나 하이프랜드 가입 이후 추가 가입하여 이용하는
                      서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수
                      있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를
                      받습니다.
                    </div>
                  </li>
                </ul>
                <span class="star" style="font-size: 0.7rem;">* 동의하지 않을 경우, 온/오프라인 회원정보 통합을 통한<br> 다양한 혜택(쿠폰, 이벤트참여 등)이
                  제공되지
                  않을 수 있습니다.</span>
              </form>
            </div>
          </div>
        </div>

        <form action="/signupProc.mem" id="signupForm" method="post">
          <table class="join_table">
            <colgroup>
              <col width="20%">
              <col width="40%">
            </colgroup>
            <tbody>
              <tr>
              <tr style="height: 70px;">
                <th>
                  <label for="user_name">이름</label>
                  <span class="star">*</span>
                </th>
                <td colspan="2">
                  <input type="text" id="user_name" name="user_name">
                </td>
              </tr>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="user_id">아이디</label>
                  <span class="star">*</span>
                </th>
                <td colspan="2">
                  <input type="text" id="user_id" name="user_id" placeholder="영문, 숫자 조합으로 최소6자">
                  <button type="button" class="btn btn-dark" id="checkId"
                    style="height: 30px; font-size: 13px;">중복확인</button>
                </td>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="user_password">비밀번호</label>
                  <span class="star">*</span>
                </th>
                <td>
                  <input type="password" id="user_password" name="user_password">
                </td>
                <td rowspan="2">
                  <ul class="desc" style="font-size: 0.3rem; opacity: 0.7;">
                    <li>영문, 숫자, 특수문자를 혼합하여 최소 5자리 이상 19자리 이하로 설정해 주세요.</li>
                    <li>아이디(이메일)과 같거나 유사해서는 안됩니다.</li>
                    <li>기타 일반 정보 등으로부터 추측이 용이한 비밀번호는 피해주세요.</li>
                    <li>타사 서비스에서 사용하는 비밀번호와 동일한 비밀번호를 사용하지 마십시오.</li>
                  </ul>
                </td>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="memberChkpw">비밀번호 확인</label>
                  <span class="star">*</span>
                </th>
                <td>
                  <input type="password" id="memberChkpw" name="memberChkpw">
                </td>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="phone1">휴대폰</label>
                  <span class="star">*</span>
                </th>
                <td colspan="3">
                  <select name="selectNo" id="phone1" class="phone">
                    <option value="010" selected>010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                  </select>
                  <input type="text" class="phone" id="phone2">
                  <input type="text" class="phone" id="phone3">
                </td>
              </tr>
              <div class="col d-none">
                <input type="text" id="user_phone" name="user_phone">
              </div>
              <tr style="height: 70px;">
                <th>
                  <label for="user_date">생년월일</label>
                  <span class="star">*</span>

                </th>
                <td>
                  <input type="text" id="user_date" name="user_date" placeholder="ex)990101">
                </td>
              </tr>
              <tr style="height: 70px;">
                <th rowspan="2">
                  <label for="emailAdress">이메일</label>
                </th>
                <td colspan="2">
                  <input type="text" id="emailAdress" onchange="emailInputBox(this)" style="width: 150px; font-size: 0.8rem;"> @
                  <select name="selectEmail" id="selectEmail" onchange="emailOptionBox(this)"
                    style="font-size: 0.8rem; height: 30px;">
                    <option value='1' selected>선택해주세요</option>
                    <option value='10'>naver.com</option>
                    <option value='11'>hanmail.net</option>
                    <option value='12'>nate.com</option>
                    <option value='13'>yahoo.co.kr</option>
                    <option value='14'>hotmail.com</option>
                    <option value='15'>empal.com</option>
                    <option value='16'>paran.com</option>
                    <option value='17'>lycos.co.kr</option>
                    <option value='18'>gmail.com</option>
                    <option value='99'>직접입력</option>
                  </select>
                  <input type="text" id="emailAdress2" style="width: 100px; font-size: 0.8rem;" disabled>
                  <button type="button" class="btn btn-dark" id="checkEmail"
                    style="height: 30px; font-size: 13px;">중복확인</button>
                </td>
              </tr>
              <div class="col d-none">
                <input type="text" id="user_email" name="user_email">
                <input type="hidden" id="total" value="">
                <input type="hidden" id="total2" value="">
              </div>

              <tr>
                <td>
                  <ul class="desc mt-2" style="font-size: 0.7rem; opacity: 0.6;">
                    <li>
                      「정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 (이하 정보통신망법)」
                      제 23조의2의 "주민등록번호의 사용 제한"에 따라 하이프랜드 온라인 스토어는 주민등록번호를 수집 및 이용하지 않습니다.
                    </li>
                  </ul>
                </td>
              </tr>
              <tr>
                <th>
                  <label for="adress">주소</label>
                </th>
                <td colspan="2">
                  <div class="row p-2">
                    <div class="col">
                      <input type="text" class="form-control" id="postCode" name="user_postCode" placeholder="우편번호">
                    </div>
                    <div class="col">
                      <button type="button" class="btn btn-primary w-100" id="btnPostCode">우편번호 찾기</button>
                    </div>
                  </div>
                  <div class="row p-2">
                    <div class="col">
                      <input type="text" class="form-control" id="roadAddr" name="user_roadAddr" placeholder="도로명주소">
                    </div>
                  </div>
                  <div class="row p-2">
                    <div class="col mb-2">
                      <input type="text" class="form-control" id="detailAddr" name="user_detailAddr" placeholder="상세주소">
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="row mt-5 mb-5">
            <div class="col" style="text-align: center;">
              <p><strong>이용약관과 개인정보 수집 및 이용을 동의하십니까?</strong></p>
              <button type="button" id="submitBtn" class="btn btn-danger" disabled>회원가입</button>
            </div>
          </div>
      </div>
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

    <script src="<%=request.getContextPath()%>script/signup.js"></script>

    </html>