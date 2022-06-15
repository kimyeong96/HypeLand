<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
   rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
   crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
   crossorigin="anonymous">
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Shop</title>
<style>
i{	cursor: pointer;
  margin: 5px;
}
.navbar-light{
  width: 100%;
  position: fixed;
  top: 0;
  z-index: 99;
  left: 0%;
}
.navbar-anchor a{
  text-decoration: none;
  color: black;
  font-weight: bold;
}
#userIcon {
  text-align: center;
  font-size: 25px;
  padding: 5px;
}
#logo{
  width: 60px;
  height: 50px;
}
/* 네비바 드롭다운 */
.dropdown-toggle:hover{color: #83bf7b; border-color: aliceblue;}
.dropdown:hover .nav-category {
display: block;
margin-top: 0;
font-weight: bold;
}

/*로고*/
.container-body {
   width: 100%;
   height: 700px;
}

/*컨텐츠*/
.container-content {
   width: 100%;
   margin-bottom: 100px;
}

/*지도 버튼*/
.button {
   margin-top: 20px;
}

.button-post {
   margin-right: 20px;
}

/*테이블*/
.table {
   width: 900px;
   margin: auto;
   margin-top: 40px;
}

.map {
   margin-top: 40px;
}

/* 네비바 드롭다운 */
.dropdown-toggle:hover {
   color: #83bf7b;
   border-color: aliceblue;
}

.dropdown:hover .dropdown-menu {
   display: block;
   margin-top: 0;
   font-weight: bold;
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

   <div class="body mt-5">
      <div class="container-body mb-5">
				<img src="/resources/images/map.png" style="width:100%; height: 100%;">
      </div>

      <div class="container-content mt-5">
         <div class="row">
            <div class="col-12 d-flex justify-content-center">
               <h2 style="font-weight: bold;">오시는길</h2>
            </div>
         </div>
         <div class="row button">
            <div class="col-12 d-flex justify-content-center">
               <div class="button-post">
                  <button type="button" class="btn btn-primary btnCount post1" id = "post1">강남</button>
               </div>
               <div class="button-post">
                  <button type="button" class="btn btn-primary btnCount post2" id = "post2">종로</button>
               </div>
               <div>
                  <button type="button" class="btn btn-primary btnCount post3" id = "post3">당산</button>
               </div>
            </div>
         </div>
         <!-- 강남 -->
         <div class="row table" style="display: table;" id="gangnam">
            <div class="col-12 d-flex justify-content-center">
               <table class="table">
                  <tbody>
                     <tr>
                        <th scope="row">주소</th>
                        <td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</td>
                     </tr>
                     <tr>
                        <th scope="row">버스</th>
                        <td>역삼역.포스코P&S타워 정류장<br> 
                        <img src="resources/images/blueBus.png" alt="지선">&nbsp;146 / 740 / 341 / 360 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <img src="resources/images/redBus.png" alt="간선">&nbsp;1100 / 1700 / 2000 / 7007 / 8001
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">지하철</th>
                        <td>지하철 2호선 역삼역 3번출구 100m</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <!-- 종로 -->
         <div class="row table" style="display: none;" id="jongno">
            <div class="col-12 d-flex justify-content-center">
               <table class="table">
                  <tbody>
                     <tr>
                        <th scope="row">주소</th>
                        <td>서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</td>
                     </tr>
                     <tr>
                        <th scope="row">버스</th>
                        <td>우리은행 종로지점 정류장<br> 
                        <img src="resources/images/blueBus.png" alt="지선">&nbsp;163 / 172 / 201 / 262 / 401 / 406 / 701 / 704 / N15 / N62 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                        <img src="resources/images/greenBus.png" alt="간선">&nbsp;7017 / 7021 / 7022 
                        <img src="resources/images/redBus.png" alt="간선">&nbsp;8110
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">지하철</th>
                        <td>지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <!-- 당산 -->
         <div class="row table" style="display: none;" id="dangsan">
            <div class="col-12 d-flex justify-content-center">
               <table class="table">
                  <tbody>
                     <tr>
                        <th scope="row">주소</th>
                        <td>서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</td>
                     </tr>
                     <tr>
                        <th scope="row">버스</th>
                        <td>우리은행 종로지점 정류장<br> 
                        <img src="/resources/images/blueBus.png"alt="지선">&nbsp; 7612 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <img src="/resources/images/redBus.png" alt="간선">&nbsp;1000 / 1200 / 1300 / 1301 / 1302 / 1400 / 1500 / 1601 / M6628 / M6724<br>
                        <img src="/resources/images/blueBus.png" alt="간선">&nbsp;602 / 760 / 5620 / 5714 / 6514 / 6623 / 6631
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">지하철</th>
                        <td>지하철 2, 9호선 당산역 12번 출구 400m</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <div class="row map">
            <div class="col-12 d-flex justify-content-center">
               <div id="map" style="width: 1000px; height: 500px;"></div>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ceab26faabf0856bb87994f6fa56aaf7"></script>
   <script>
   
         // 강남지점 map
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(37.49901442259218, 127.0385217285156), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };
      
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);
      
      // 마커가 표시될 위치입니다 
      var markerPosition = new kakao.maps.LatLng(37.49901442259218, 127.0385217285156);
      
      var imageSrc = '/resources/images/marker.png', // 마커이미지의 주소입니다    
          imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
          imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
      // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
      
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          position: markerPosition,
          image: markerImage
      });
      
      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);
      
      
      var iwContent = '<div style="padding:5px;">HYPEFRIEND 강남</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
          iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
      
      // 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
          content: iwContent,
          removable: iwRemoveable
      });
      
      // 마커에 클릭이벤트를 등록합니다
      // kakao map 에서 제공하는 객체들한테 이벤트 등록을 하고싶을때에는
      // kakao.maps.event.addListener(객체, "이벤트명", 콜백함수)
      kakao.maps.event.addListener(marker, 'click', function () {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, marker);
      });
      
         //강남지점   
                   $('#post1').click(function(){
            if($("#gangnam").css("display")=="none"){
               $("#gangnam").show();
               $("#jongno").hide();
               $("#dangsan").hide();
            }
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.49901442259218, 127.0385217285156), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        
        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        
        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(37.49901442259218, 127.0385217285156);
        
        var imageSrc = '/resources/images/marker.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
            imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
        
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage
        });
        
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        
        
        var iwContent = '<div style="padding:5px;">HYPEFRIEND 강남</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
        
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable
        });
        
        // 마커에 클릭이벤트를 등록합니다
        // kakao map 에서 제공하는 객체들한테 이벤트 등록을 하고싶을때에는
        // kakao.maps.event.addListener(객체, "이벤트명", 콜백함수)
        kakao.maps.event.addListener(marker, 'click', function () {
            // 마커 위에 인포윈도우를 표시합니다
            infowindow.open(map, marker);
        });
            
         });
         
         // 종로지점
         $('#post2').click(function(){
            if($("#jongno").css("display")=="none"){
               $("#jongno").show();
               $("#gangnam").hide();
               $("#dangsan").hide();
            }
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(37.567924, 126.983083), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };
         
         // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
         var map = new kakao.maps.Map(mapContainer, mapOption);
         
         // 마커가 표시될 위치입니다 
         var markerPosition = new kakao.maps.LatLng(37.567924, 126.983083);
         
         var imageSrc = '/resources/images/marker.png', // 마커이미지의 주소입니다    
             imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
             imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
         
         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
         
         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
             position: markerPosition,
             image: markerImage
         });
         
         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);
         
         
         var iwContent = '<div style="padding:5px;">HYPEFRIEND 종로</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
             iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
         
         // 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
             content: iwContent,
             removable: iwRemoveable
         });
         
         // 마커에 클릭이벤트를 등록합니다
         // kakao map 에서 제공하는 객체들한테 이벤트 등록을 하고싶을때에는
         // kakao.maps.event.addListener(객체, "이벤트명", 콜백함수)
         kakao.maps.event.addListener(marker, 'click', function () {
             // 마커 위에 인포윈도우를 표시합니다
             infowindow.open(map, marker);
         });
         });
         
         // 당산지점
         $('#post3').click(function(){
            if($("#dangsan").css("display")=="none"){
               $("#dangsan").show();
               $("#gangnam").hide();
               $("#jongno").hide();
            }
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(37.5338151, 126.8969784), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };
         
         // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
         var map = new kakao.maps.Map(mapContainer, mapOption);
         
         // 마커가 표시될 위치입니다 
         var markerPosition = new kakao.maps.LatLng(37.5338151, 126.8969784);
         
         var imageSrc = '/resources/images/marker.png', // 마커이미지의 주소입니다    
             imageSize = new kakao.maps.Size(30, 40), // 마커이미지의 크기입니다
             imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
         
         // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
         
         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
             position: markerPosition,
             image: markerImage
         });
         
         // 마커가 지도 위에 표시되도록 설정합니다
         marker.setMap(map);
         
         
         var iwContent = '<div style="padding:5px;">HYPEFRIEND 당산</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
             iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
         
         // 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
             content: iwContent,
             removable: iwRemoveable
         });
         
         // 마커에 클릭이벤트를 등록합니다
         // kakao map 에서 제공하는 객체들한테 이벤트 등록을 하고싶을때에는
         // kakao.maps.event.addListener(객체, "이벤트명", 콜백함수)
         kakao.maps.event.addListener(marker, 'click', function () {
             // 마커 위에 인포윈도우를 표시합니다
             infowindow.open(map, marker);
         });
         });
      
      
</script>
</body>
</html>