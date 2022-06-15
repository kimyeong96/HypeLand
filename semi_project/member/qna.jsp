<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/member/css/qna.css">
</head>
<script>
$(document).ready(function(){
	
	$("#btnCheck").on("click", function(){
		console.log("a");
		let url = "/toSearchSeq.mem";
		let name = "주문번호 조회";
		let option = "width=800, height=600, left=700, top=300";
		window.open(url, name, option);
	});
	
	$("#btnComplete").on("click", function(){
		if($("#seq_order").val() == "" ||$("#qna_title").val() == "" || $("#qna_content").val() == "" ){
			alert("주문번호와 제목, 내용을 입력해주세요");
			return;
		}
		
		let data = $("#qnaForm").serialize();
		
		$.ajax({
			url : "/toQnaProc.mem"
			, type : "post"
			, data : data
			, success : function(resultData){
				if(resultData === "1"){
					alert("등록이 완료되었습니다.");
					location.href = "/toCs.mem";
				}else{
					alert("등록에 실패하였습니다.");
				}
				
			}, error : function(e){
				console.log(e);
			}
			
		})//ajax종료
		
	});
	
})
	
			
</script>
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

<!-- 헤더 -->
<header class="masthead w-100">
    <div class="container headerBox" >
        <div class="row">
            <div class="col-4" style="border-left: none;">
             <p style="margin-bottom: 0px;"><strong>Tel</strong>.02-000-0000</p>
             <p style="margin-top: 0px;"><strong>평일</strong> : 09:00 ~ 18:00</p>
            </div>
         <div class="col-4">
             <h3><strong>1:1 Q&A</strong></h3>
         </div>
         <div class="col-4">
             <p style="margin-bottom: 0px;"><strong>FAQ</strong></p>
             <p style="margin-top: 0px; font-size: 16px;">자주 묻는 질문을 먼저 확인해주세요.</p>
         </div>
     </div>
 </div>
 <div class="container" style="margin-top: 100px;">
     <div class="row">
         <div class="col">
             <!--문의 작성-->
         <form id="qnaForm" action="/toQnaProc.mem" method="post">
             <div class="container inputBox">
                 <div class="row p-2">
                     <div class="col">
                         <p style="font-size: 30px; font-weight: bold; margin-bottom: 20px;">문의 작성</p>
                     </div>
                 </div>
                 <div class="row p-2" style="border-top: 1px solid lightgrey;">
                     <div class="col-3">
                         <p>상품명</p>
                     </div>
                     <div class="col-7">
                         <input class="form-control" type="hidden" id="seq_order" name="seq_order" style="width: 99% ;" readonly>
                         <input class="form-control" type="text" id="buy_name" name="buy_name" style="width: 99% ;" readonly>
                     </div>
                     <div class="col-2">
                         <button id="btnCheck" class="btn btn-secondary"  type="button">조회</button>
                     </div>
                 </div>
                 <div class="row p-2" style="border-top: 1px solid lightgrey;">
                     <div class="col-3">
                         <p>작성자</p>
                     </div>
                     <div class="col-9">
                         <input class="form-control" type="text" id="user_id" name="user_id" value	="${loginSession.user_id}" readonly>
                     </div>
                 </div>
                 <div class="row p-2" style="border-top: 1px solid lightgrey;">
                     <div class="col-3">
                         <p>문의 유형</p>
                     </div>
                     <div class="col-9">
	                     <select name="qna_type" id="qna_type" class="form-control" style="width:76.2%">
		                    <option value="배송" selected>배송</option>
		                    <option value="결제">결제</option>
	                 	 </select>
                     </div>
                 </div>
                 <div class="row p-2"  style="border-top: 1px solid lightgrey;">
                     <div class="col-3">
                             <p>제목</p>
                     </div>
                     <div class="col-9">
                             <input class="form-control" type="text" id="qna_title" name="qna_title">
                     </div>
                 </div>
                 <div class="row p-2"  style="border-bottom: 1px solid lightgrey;">
                     <div class="col-3">
                             <p>내용</p>
                     </div>
                     <div class="col-9">
                             <textarea class="form-control content" name="qna_content" id="qna_content" cols="10" rows="10"></textarea>
                     </div>
                 </div>
             </div>
         </form>
         </div>

         <!-- FAQ -->
         <div class="col">
             <div class="container faqBox">
                 <div class="row p-2">
                     <div class="col">
                         <p style="font-size: 30px; font-weight: bold; margin-bottom: 20px;">FAQ</p>
                     </div>
                 </div>
                 <div class="row p-2" style="border-top: 1px solid lightgrey;">
                     <div class="col">
                         <div class="accordion" id="FAQ">
                             <!--첫줄 시작-->
                             <div class="accordion-item">                                    
                               <h2 class="accordion-header" id="One">
                                 <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                     <Strong>Q. 온라인스토어 교환/반품신청은 어떻게 하나요?</Strong>
                                 </button>
                               </h2>
                               <div id="collapseOne" class="accordion-collapse collapse in show" aria-labelledby="One" data-bs-parent="#accordionExample">
                                 <div class="accordion-body">
                                     온라인스토어 교환/반품 가능기간은, 상품 수령일(배달완료일) 포함하여 7일 이내 가능합니다.
                                     전산 접수를 하지않은 상태로 상품만 보내주시는 경우, 교환/환불처리가 지연될 수 있으니, 주의 부탁드리겠습니다.
                                     <img src="/resources/images/refund.JPG" alt="">
                                     
                                 </div>
                               </div>
                             </div>
                             <!---->
                             <div class="accordion-item">
                               <h2 class="accordion-header" id="Two">
                                 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                     <Strong>Q. 오프라인 매장 교환 환불 규정은 어떻게 되나요?</Strong>
                                 </button>
                               </h2>
                               <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="Two" data-bs-parent="#accordionExample">
                                 <div class="accordion-body">
                                     <div ><span> 오프라인 매장에서 구매하신
                                         상품의 교환, 환불의 경우에는 아래의 사항을 지참하시어 방문하시면 가능합니다.<br>
                                         
                                         * 영수증 분실 시,  구입일로부터 30일 이내
                                         구입하신 매장 혹은 고객센터로 문의하시어,
                                         <P class="focus d-inline-block">①결제 일시 ②결제 금액 ③구매 상품 전달</P>해 주시면 영수증 재출력 가능합니다.</span></div>
                                            
                                     <div><p class="focus">[오프라인 매장 구매건 교환시]</p>
                                         <span>
                                         ①구입하신날 포함하여, 30일 이내 
                                         ②가격택 제거되지 않은 재판매가 가능한 상태의 상품
                                         ③영수증
                                         
                                         구입하신 매장 이외 다른 매장에서도 교환 가능합니다.
                                         
                                         *동일 상품의 색상, 사이즈 교환 가능
                                         *동일 금액의 다른상품으로의 교환 가능
                                         *높은 금액으로의 차액교환(1회에 한하여 가능하며, 환불 불가)
                                         </span>
                                         
                                         <p class="focus">[오프라인 매장 구매건 반품시]</p>   
                                         <span>
                                         ①구입하신날 포함하여, 30일 이내 
                                         ②가격택 제거되지 않은 재판매가 가능한 상태의 상품
                                         ③영수증
                                         ④구매당시 결제수단 필요
                                         
                                         구입하신 매장에서만 가능합니다.
                                         구입당시 결제하신 결제수단 지참하시어 방문 부탁드리겠습니다.
                                         </span>                                             
                                     </div>                                    
                                 </div>
                               </div>
                             </div>
                             <!---->
                             <div class="accordion-item">
                               <h2 class="accordion-header" id="Three">
                                 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                     <Strong>Q. 주문 확인이 안돼요</Strong>
                                 </button>
                               </h2>
                               <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="Three" data-bs-parent="#accordionExample">
                                 <div class="accordion-body">
                                     <p class="focus">주문하지 않은 다른 아이디로 주문하셨을 수 있습니다.</p>
                                     <span>
                                     - 현재 로그인하여 조회중 이신 아이디와, 주문하신 아이디가 다른 경우 이실 수 있습니다.
                                     - 정회원 혹은 소셜로그인 하시어 확인 부탁드리겠습니다.
                                 </div>
                               </div>
                             </div>
                             <!---->
                             <div class="accordion-item">
                                 <h2 class="accordion-header" id="Four">
                                   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
                                     <Strong>Q. 배송 기간은 얼마나 걸리나요?</Strong>
                                   </button>
                                 </h2>
                                 <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="Four" data-bs-parent="#accordionExample">
                                   <div class="accordion-body">
                                     <p class="focus">최근 일부 지역의 기사님 코로나 확진으로 인하여,</p>
                                     <span>
                                         평소보다 3~7일 배송이 지연되는 경우가 발생되고 있습니다.
                                         
                                         해당 지역은 순차적인 배송을 최대한 진행하고 있으며,
                                         불편을 최소화할 수 있도록 최선을 다하겠습니다.
                                         고객님의 깊은 양해를 부탁드리겠습니다.
                                     </span>
                                   </div>
                                 </div>
                               </div>
                               <div class="accordion-item">
                                 <h2 class="accordion-header" id="Five">
                                   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
                                     <Strong>Q. 반품/취소 시 환불은 얼마나 걸리나요?</Strong>
                                   </button>
                                 </h2>
                                 <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="Four" data-bs-parent="#accordionExample">
                                   <div class="accordion-body">                                           
                                     <span>
                                         온라인스토어 구매한 상품의 환불 일정은 아래와 같이 진행 됩니다.<br>
                                         상품이 수거되어 물류센터로 입고 시,
                                         영업일 기준 1~3일의 검수과정을 거쳐 환불 처리됩니다.
                                     </span>
                                   </div>
                                 </div>
                               </div>
                           </div>
                            <!--끝-->
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <div class="container btnBox" >
         <div class="row">
             <div class="col">
                 <button class="btn btn-secondary" id="btnCancel" type="button" onclick="location.href='/toCs.mem' ">취소하기</button>
                 <button class="btn btn-dark" id="btnComplete"type="button" >작성하기</button>
                </div>
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
</html>