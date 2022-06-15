<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
   crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- <link href="<%=request.getContextPath()%>css/productInsert.css"
   rel="stylesheet" /> --%>
<style>
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: "Poppins", sans-serif;
}

/* navbar & maincontainer */
.logoImg{
         width:100px;
         height : 55px;
         cursor:pointer;
      }
.adminContainer {
   height: 100vh;
   background-color: black;
}

.adminNavbar {
   margin: 0;
   background-color: #212e41;
   color: #fff;
   height: 8%;
}

.adminNavbar-left {
   font-size: 26px;
}

.adminNavbar-left span {
   cursor: pointer;
}

.adminMain {
   background-color: blue;
}

.adminContent {
   margin: 0;
   height: 92%;
}

.adminSidebarContainer {
   background-color: #212e41;
   color: #fff;
}

ul {
   list-style: none;
}

.adminIcon {
   margin-right: 30px;
}

.adminIconSpan {
   margin-right: 12px;
}

.adminIconLogout {
   margin-left: 26px;
   cursor: pointer;
}

/* sidebar navlink */
.adminSidebar {
   height: 92%;
   background: #fff;
   transition: all 0.5s ease;
}

.adminSidebar .nav-links li a {
   display: flex;
   align-items: center;
   text-decoration: none;
}

.adminSidebarContainer {
   padding: 0;
}

.adminMainContainer {
   padding: 0;
}

.nav-linksContainer {
   margin-top: 25px;
   transition: 0.5s ease;
}

.nav-linksContainer:hover {
   background-color: #1d1b31;
}

.nav-links {
   font-size: 16px;
   padding-left: 0;
}

.icon-link {
   color: #fff;
}

.icon-link .icon-link-left {
   color: #fff;
}

.icon-link .icon-link-left i {
   left: 0;
   color: #fff;
}

.icon-link .icon-link-left span {
   color: #fff;
}

.sub-menu {
   margin-left: 15%;
   list-style: none;
   display: none;
   text-decoration-line: none;
}

.sub-menu li {
   margin: 10px 0px;
}

.sub-menu li a {
   font-size: 14px;
   color: #fff;
   text-decoration-line: none;
}

.sub-menu li:hover {
   border-left: 3px solid #fff;
}

.firstTable {
   background-color: #fff;
   margin-bottom: 0;
}

/* 메인 페이지  */
.firstTableTitle {
   font-size: 24px;
}

.firstTable {
   border: 0;
}

.MemberText, .searchMemberText {
   font-size: 18px;
   margin-left: 9px;
   margin-bottom: 0;
   border: 40px;
}

.searchMemberInput {
   margin-left: 9px;
}

.MemberContainer {
   height: 340px;
   overflow: auto;
}

tbody tr {
   transition: 0.7s ease;
}

.row {
   margin: auto;
}

.content-header {
   padding: 30px;
   padding-right: 0px;
   text-align: center;
}


.content-wrapper {
   margin: auto;
}

.content-body {
   height: 80px;
}

#phone2 {
   margin-left: 30px;
}

#phone3 {
   margin-left: 60px;
}
/* body */
.content-body {
   width: 60%;
   height: 70px;
   align-items: baseline;
}

.category {
   width: 100px;
   background-color: beige;
}

#product_explain {
   resize: none;
}

#submitBtn {
   width: 30%;
}

#flexRadioDefault1 {
   margin-right: 15px;
}
/* table hover시 color 변경 */
#tableBox:hover tbody tr:hover td {
   background-color: #7f7f7f;
   color: #fff;
}

/* 이모티콘 cursor pointer */
td span {
   cursor: pointer;
}
</style>
</head>
<body>
   <div class="adminContainer">
      <div class="row adminNavbar d-flex align-items-center">
         <div
            class="col-md-2 adminNavbar-left d-flex justify-content-center align-items-lg-center">
            <img class="logoImg" src="./resources/images/Logo3.png">
         </div>
         <div class="col-md-10 adminNavbar-right d-flex justify-content-end">
            <div class="adminIcon">
               <span class="adminIconSpan">Admin</span> <i
                  class="fa-solid fa-user-check"></i> <span class="adminIconLogout">로그아웃</span>
            </div>
         </div>
      </div>
      <div class="row adminSidebar adminContent d-flex">
         <div class="col-md-2 adminSidebarContainer">
            <div class="nav-linksContainer nav-linksContainer1">
               <div class="icon-link row d-flex align-items-center">
                  <div class="icon-link-left col-md-3 d-flex justify-content-end">
                     <i class="fa-solid fa-cart-shopping cart"></i>
                  </div>
                  <div class="icon-link-center col-md-6">
                     <span class="link_name cartManagement">상품 관리</span>
                  </div>
                  <div class="icon-link-right col-md-3">
                     <i class="fa-solid fa-caret-down arrow arrow1"></i>
                  </div>
               </div>
               <ul class="sub-menu sub-menu-first">
                  <li><a href="/admin/product/productInsert.jsp">상품 등록</a></li>
                  <li><a href="/modify.pc?curPage=1">상품 조회</a></li>
               </ul>
            </div>
            <div class="nav-linksContainer nav-linksContainer2">
               <div class="icon-link row d-flex align-items-center">
                  <div class="icon-link-left col-md-3 d-flex justify-content-end">
                     <i class="fa-solid fa-user-group"></i>
                  </div>
                  <div class="icon-link-center col-md-6">
                     <span class="link_name cartManagement">회원 관리</span>
                  </div>
                  <div class="icon-link-right col-md-3">
                     <i class="fa-solid fa-caret-down arrow arrow2"></i>
                  </div>
               </div>
               <ul class="sub-menu sub-menu-second">
                  <li><a href="/select.amem?curPage=1">회원 조회</a></li>
               </ul>
            </div>
            <div class="nav-linksContainer nav-linksContainer3">
               <div class="icon-link row d-flex align-items-center">
                  <div class="icon-link-left col-md-3 d-flex justify-content-end">
                     <i class="fa-solid fa-truck"></i>
                  </div>
                  <div class="icon-link-center col-md-6">
                     <span class="link_name cartManagement">배송 관리</span>
                  </div>
                  <div class="icon-link-right col-md-3">
                     <i class="fa-solid fa-caret-down arrow arrow3"></i>
                  </div>
               </div>
               <ul class="sub-menu sub-menu-third">
                  <li><a href="/shipManage.sh?curPage=1">배송 정보 변경</a></li>
               </ul>
            </div>
            <div class="nav-linksContainer nav-linksContainer4">
               <div class="icon-link row d-flex align-items-center">
                  <div class="icon-link-left col-md-3 d-flex justify-content-end">
                     <i class="fa-solid fa-clipboard-list"></i>
                  </div>
                  <div class="icon-link-center col-md-6">
                     <span class="link_name cartManagement">게시판 관리</span>
                  </div>
                  <div class="icon-link-right col-md-3">
                     <i class="fa-solid fa-caret-down arrow arrow4"></i>
                  </div>
               </div>
               <ul class="sub-menu sub-menu-fourth">
                  <li><a href="/boardQna.qna?curPage=1">문의 관리</a></li>
                  <li><a href="/review.rv?curPage=1">리뷰 관리</a></li>
               </ul>
            </div>
         </div>
         <div class="col-md-10 adminMainContainer">
            <div class="table firstTable">
               <div class="col-md-10 adminMainContainer content-wrapper">
                  <form action="/membermodifydetail.amem" method="post"
                     id="membermodifyForm">
                     <div class="row">
                        <div class=" col-md-6 d-flex justify-content-end content-header">
                           <h2>회원 수정</h2>
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>아이디</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="user_id" name="user_id"
                              value="${dto.user_id}" class="form-control" readonly />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>비밀번호</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="user_password" name="user_password"
                              value="${dto.user_password}" class="form-control" readonly />
                        </div>
                     </div>

                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>출생일</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="user_password" name="user_date"
                              value="${dto.user_date}" class="form-control" readonly />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>번호</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <div class="col-3 inputPhone">
                              <input type="text" class="form-control phoneNum" id="phone1"
                                 name="phone1" readonly>
                           </div>
                           <div class="col-3 inputPhone">
                              <input type="text" class="form-control phoneNum" id="phone2"
                                 name="phone2" readonly>
                           </div>
                           <div class="col-3">
                              <input type="text" class="form-control phoneNum" id="phone3"
                                 name="phone3" readonly>
                           </div>
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>이메일</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="user_password" name="user_date"
                              value="${dto.user_email}" class="form-control" readonly />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>우편번호</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="product_code" name="product_code"
                              value="${dto.user_postCode}" class="form-control" readonly />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>도로명 주소</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="product_size" name="product_size"
                              class="form-control" value="${dto.user_roadAddr}" readonly />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>상세 주소</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="product_size" name="product_size"
                              class="form-control" value="${dto.user_detailAddr}" readonly />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>블랙리스트</h4>
                        </div>
                        <div class="col-md-4 d-flex justify-content-center">
                           <input class="form-check-input" type="radio"
                              name="user_blacklist" id="flexRadioDefault1" value="Y" /> <label
                              class="form-check-label" for="flexRadioDefault1"> 등록 </label>
                        </div>
                        <div class="col-md-5 d-flex justify-content-center">
                           <input class="form-check-input" type="radio"
                              name="user_blacklist" id="flexRadioDefault1" value="N" /> <label
                              class="form-check-label" for="flexRadioDefault1"> 제거 </label>
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-3 d-flex justify-content-start mb-5">
                           <h4>사유</h4>
                        </div>
                        <div class="col-md-9 d-flex justify-content-start">
                           <input type="text" id="black_reason" name="black_reason"
                              class="form-control" />
                        </div>
                     </div>
                     <div class="row content-body">
                        <div class="col-md-6 d-flex justify-content-end">
                           <button type="button" id="backBtn"
                              class="btn btn-secondary btn-lg">뒤로가기</button>
                        </div>
                        <div class="col-md-6 d-flex justify-content-start">
                           <button type="button" id="submitBtn"
                              class="btn btn-primary btn-lg">완료</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   <%--    <script src="<%=request.getContextPath()%>script/productInsert.js"></script> --%>
   <script>
      $(".arrow1").on("click", function() {
         $(".sub-menu-first").toggle("4000ms");
      });

      $(".arrow2").on("click", function() {
         $(".sub-menu-second").toggle("4000ms");
      });

      $(".arrow3").on("click", function() {
         $(".sub-menu-third").toggle("4000ms");
      });
      $(".arrow4").on("click", function() {
         $(".sub-menu-fourth").toggle("4000ms");
      });
       $(".logoImg").on("click",function(){
          location.href = "/admin.ad"
       })
       $(".adminIconLogout").on("click",function(){
         location.href = "/Tohome";
      })
      let now = new Date(); // 현재 날짜 및 시간
      console.log("현재 : ", now);
      // 휴대폰 번호 셋팅
      let phone = "${dto.getUser_phone()}";
      let phone1 = phone.slice(0, 3);
      let phone2 = phone.slice(3, 7);
      let phone3 = phone.slice(7);

      // 셀렉트 박스에 default selected값 주기
      $("#phone1").val(phone1);
      $("#phone2").val(phone2);
      $("#phone3").val(phone3);
      
      $("#submitBtn").on("click", function() {
         $("#insertForm").submit();
      })
      $("#submitBtn").on("click", function() {
         $("#modifyDetailForm").submit();
      })
      $("#backBtn").on("click", function() {
         location.href = "/modify.pc?curPage=1";
      })
      $("#submitBtn").on("click",function(){
         $("#membermodifyForm").submit();
      })
      $("#backBtn").on("click",function(){
         location.href="/select.amem?curPage=1";
      })
   </script>
</body>
</html>