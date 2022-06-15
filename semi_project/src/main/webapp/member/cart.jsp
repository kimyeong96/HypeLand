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
      <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="<%=request.getContextPath()%>/member/css/cart.css">
      <title>장바구니</title>
    </head>

    <body>
      <div class="container MainBox">
        <!-- 네비바 -->
        <nav class="navbar navbar-light bg-light fixed">
          <div class="container">
            <a class="navbar-brand" href="/Tohome" id="logo"><img id="logo" src="/resources/images/Logo3.png" alt="HypeFriend"></a>
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

      <div class="container" style="border: 1px solid lightgray; margin-top: 120px;">
        <div class="row">
          <div class="col header-comment">
            <h2>Order / Payment</h2>
          </div>
        </div>
        <div class="row">
          <div class="col mt-5 ms-2">
            <h3>장바구니</h3>
          </div>
        </div>

        <form action="/toPay.mem" id="signupForm" method="post">
          <table class="table productInfo mt-5">
            <thead>
              <tr>
                <th scope="col" style="width: 4.5rem;">전체 ${list.size()}개</th>
                <th scope="col"><input type="checkbox" id="checkAll"></th>
                <th scope="col" colspan="2">상품명(옵션)</th>
                <th scope="col">판매가</th>
                <th scope="col">수량</th>
                <th scope="col">주문금액</th>
                <th scope="col">주문관리</th>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${list.size() == 0}">
                  <tr>
                    <td colspan="8">장바구니에 담긴 물건이 없습니다.</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach items="${list}" var="dto" varStatus="status">
                    <tr>
                      <th scope="row">${status.count}</th>
                      <td><input type="checkbox" name="seq_cart" class="check" value="${dto.seq_cart}"></td>
                      <td class="col-1"><a href="/detailPage.page?seq_product=${dto.seq_product}"><img class="productImg" src="/resource/imagesClothes/${imageList[status.index].image_name}" ></a></td>
                      <td class="detailItem">
                        <div class="row">
                          <div class="col-12">
                            <p class="P-Name">${dto.cart_name}</p>
                          </div>
                          <div class="col">
                            <input type="text" class="P-Option disabled" value="옵션 : SIZE / FREE">
                          </div>
                        </div>
                      </td>

                      <td class="price">&#8361;</td>
                      <td>
                        <button class="minusBtn qty-update-btn" type="button" data-type="minus">-</button>
                        <input type="number" class="quantity" value="${dto.cart_quantity}">
                        <button class="plusBtn qty-update-btn" type="button" data-type="plus">+</button>
                      </td>
                      <td class="total">&#8361;</td>
                      <td><button class="item-delete" type="button" value="${dto.seq_cart}">삭제</button></td>
                      <input type="hidden" class="cart_price" value="${dto.cart_price}">
                      <input type="hidden" class="cart_total">
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>

          <div class="row">
            <div class="col">
              <button class="selectDelete me-1" type="button" id="btnDelAll">전체삭제</button>
              <button class="selectDelete" type="button" id="btnDelSel">선택삭제</button>
            </div>
          </div>
        </form>
        <div class="row mt-5">
          <div class="col">
            <ul class="guideline">
              <li>하이프랜드는 전 상품 무료 배송입니다.</li>
              <li>장바구니 상품은 최대 1년 보관되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
              <li>장바구니에는 최대 99개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 99개로 제한됩니다.</li>
              <li>하이프랜드에 모든 주문건은 무통장 입금이 불가능합니다.</li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div class="col mt-5 mb-5" style="text-align: center;">
            <button type="button" class="btn btn-danger btnOrder">주문하기</button>
          </div>
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
            <li class="list-inline-item"><p  style="color: red; font-weight: bold;">개인정보처리방침</p></li>

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
      window.onload = function () {
        $('.qty-update-btn').on('click', function () {
          const parent = $(this).closest('td');
          const parent2 = $(this).closest('tr');
          const qtyEl = $('.quantity', parent);
          const seq_cart = $('.item-delete', parent2);
          const calc = $(this).data('type') === 'minus' ? -1 : 1;
          const currentQty = parseInt(qtyEl.val()) || 0;

          qtyEl.val(currentQty + calc);

          if (Number(qtyEl.val()) === 0) {
            qtyEl.val(1);
            alert('1개 미만으로 수정은 불가능합니다.');
            return;
          } else if (Number(qtyEl.val()) === 100) {
            qtyEl.val(99);
            alert('최대 수량은 99개입니다.');
            return;
          }
          alert('수량이 변경되었습니다.');
          location.href =
            '/toChangeQty.mem?cart_quantity=' +
            qtyEl.val() +
            '&seq_cart=' +
            seq_cart.val();
        });

        $('.quantity').change(function () {
          const parent2 = $(this).closest('tr');
          const seq_cart = $('.item-delete', parent2);

          if (Number($(this).val()) < 1 || null || '') {
            $(this).val(1);
            alert('1개 미만으로 수정은 불가능합니다.');
            return;
          } else if (Number($(this).val()) === 100) {
            $(this).val(99);
            alert('100개 이상으로 수정은 불가능합니다.');
            return;
          }
          alert('수량이 변경되었습니다.');
          location.href =
            '/toChangeQty.mem?cart_quantity=' +
            $(this).val() +
            '&seq_cart=' +
            seq_cart.val();
        });

        const qty = document.getElementsByClassName('quantity');
        const price = document.getElementsByClassName('cart_price');
        const price2 = document.getElementsByClassName('price');
        const total = document.getElementsByClassName('total');
        const arr1 = new Array(price.length);
        const arr2 = new Array(price.length);

        for (let i = 0; i < price.length; i++) {
          arr1[i] = price[i].value;
          price2[i].innerHTML += Number(arr1[i]).toLocaleString('en-US');
        }

        for (let i = 0; i < price.length; i++) {
          arr2[i] = Number(price[i].value) * Number(qty[i].value);
          total[i].innerHTML += Number(arr2[i]).toLocaleString('en-US');
        }

        $('.item-delete').on('click', function () {
          const check = confirm('상품을 삭제 하시겠습니까?');
          if (check) {
            alert('장바구니에서 삭제되었습니다.');
            location.href = '/toDeleteCart.mem?seq_cart=' + $(this).val();
          }
        });

        document.getElementById('checkAll').addEventListener('click', function () {
          const checkboxes = document.getElementsByName('seq_cart');
          checkboxes.forEach(checkbox => {
            checkbox.checked = document.getElementById('checkAll').checked;
          });
        });

        $('.check').on('click', function () {
          const total = $('.check').length;
          const checked = $('.check:checked').length;

          if (total != checked) {
            $('#checkAll').prop('checked', false);
          } else {
            $('#checkAll').prop('checked', true);
          }
        });

        $('.btnOrder').on('click', function () {
          const checkboxes = document.getElementsByName('seq_cart');
          const checked = $('.check:checked').length;
          checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
              document.getElementById('signupForm').submit();
              return;
            }
            // console.log(checkbox.value);
            // form 제출
          });
          if (checked === 0) {
            alert('장바구니에서 물건을 선택해주세요.');
          }
        });

        $('#btnDelAll').on('click', function () {
          const check = confirm('모든 상품을 삭제하시겠습니까?');
          if (check) {
            alert('모든 상품이 삭제되었습니다.');
            location.href = '/toDelAllCart.mem';
          }
        });

        $('#btnDelSel').on('click', function () {
          const check = confirm('선택한 상품을 삭제하시겠습니까?');
          if (check) {
            alert('선택한 상품이 삭제되었습니다.');
            $('#signupForm').attr('action', '/toDelBySeqCart.mem');
            document.getElementById('signupForm').submit();
          }
        });

      };

    </script>

    </html>