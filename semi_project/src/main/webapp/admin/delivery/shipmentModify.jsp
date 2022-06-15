<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}
.logoImg {
					width: 100px;
					height: 55px;
					cursor: pointer;
				}

/* navbar & maincontainer */
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
	margin-left: 16%;
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

.shipmentModifyTable {
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
				<form action="shipmentModifyProc.sh" method="post"
					class="shipmentModifyForm" id="shipmentModifyForm">
					<div class="table shipmentModifyTable">
						<div class="modifyContainer container w-100">
							<h3 class="mt-3 text-center">배송 정보 수정</h3>

							<!-- 배송 정보 수정  -->
							<div class="row mt-1">
								<div class="form-group col-md-6 mt-2">
									<label >주문 번호</label> <input type="text"
										class="form-control mt-2"
										value="${list[0].getSeq_order()}" readonly name="seq_order" />
								</div>
								<div class="form-group col-md-6 mt-2">
									<label >회원 id</label> <input type="text"
										class="form-control mt-2" 
										value="${list[0].getUser_id()}" readonly name="user_id" />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mt-2">
									<label>수취인 이름</label> <input type="text"
										class="form-control mt-2" id="customerName"
										value="${list[0].getOrder_name()}" name="order_name" />
								</div>
								<div class="form-group col-md-6 mt-2">
									<label>수취인 번호</label>
									<div class="row mt-2">
										<div class="col">
											<select class="form-select"
												aria-label="Default select example" id="phone1"
												name="phone1">
												<option selected>010</option>
												<option value="012">012</option>
												<option value="011">011</option>
												<option value="016">016</option>
											</select>
										</div>
										<div class="col">
											<input type="text" class="form-control" id="phone2"
												name="phone2" placeholder="전화번호" maxlength="4" />
										</div>
										<div class="col">
											<input type="text" class="form-control" id="phone3"
												name="phone3" placeholder="전화번호" maxlength="4" />
										</div>
									</div>
								</div>
							</div>

							<!-- 구매 리스트 -->
							<div class="row">
								<div class="form-group col-md-12 mt-2">
									<label ><strong>구매 목록</strong></label>
									<table class="table table-primary mt-2">
										<thead>
											<tr>
												<th scope="col" class="text-center">상품명</th>
												<th scope="col" class="text-center">수량</th>
												<th scope="col" class="text-center">개당 가격</th>
												<th scope="col" class="text-center">총 가격</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${buyList.size() == 0}">
													<tr>
														<td colspan=4 class="text-center">등록된 정보가 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${buyList}" var="dto">
														<tr>
															<td class="text-center">${dto.buy_name}</td>
															<td class="text-center">${dto.buy_qty}개</td>
															<td class="text-center">${dto.buy_price}원</td>
															<td class="text-center">${dto.buy_qty * dto.buy_price}원</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 배송 메세지 -->
							<div class="row">
								<div class="form-group col-md-12 mt-2">
									<label>배송 메세지</label> <input type="text"
										class="form-control mt-2" 
										value="${list[0].getOrder_msg()}" readonly />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12 mt-2">
									<label>사용자 입력 주소</label> <input type="text"
										class="form-control mt-2"
										value="${list[0].getOrder_address()}" readonly />
								</div>
							</div>



							<!-- 주소 변경 -->
							<div class="row mt-2">
								<div class="col-md-6">
									<input type="text" class="form-control" id="postCode"
										name="postCode" placeholder="우편번호" />
								</div>
								<div class="col-md-6">
									<button type="button" class="btn btn btn-outline-success w-100"
										id="btnPostCode">배송지 변경</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="roadAddr"
										name="roadAddr" placeholder="도로명주소" />
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="detailAddr"
										name="detailAddr" placeholder="상세주소" />
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>배송 상태</label>
									<c:if test="${list[0].getOrder_status() eq '상품 준비중'}">
										<select class="form-select mt-2"
											aria-label="Default select example" name="order_status">
											<option value="상품 준비중">상품 준비중</option>
											<option value="상품 출발">상품 출발</option>
											<option value="상품 도착">상품 도착</option>
										</select>
									</c:if>
									<c:if test="${list[0].getOrder_status() eq '상품 출발'}">
										<select class="form-select mt-2"
											aria-label="Default select example" name="order_status">
											<option value="상품 출발">상품 출발</option>
											<option value="상품 준비중">상품 준비중</option>
											<option value="상품 도착">상품 도착</option>
										</select>
									</c:if>
									<c:if test="${list[0].getOrder_status() eq '상품 도착'}">
										<select class="form-select mt-2"
											aria-label="Default select example" name="order_status">
											<option value="상품 도착">상품 도착</option>
											<option value="상품 준비중">상품 준비중</option>
											<option value="상품 출발">상품 출발</option>
										</select>
									</c:if>
								</div>
								
								<!-- 뒤로가기, 수정 완료 -->
								<div class="col-md-6">
									<label></label>
									<div class="row mt-2">
										<div class="col d-flex justify-content-end">
											<button type="button" class="btn btn-secondary" id="backBtn">뒤로
												가기</button>
										</div>
										<div class="col">
											<button type="button" class="btn btn-primary" id="submitBtn">수정
												완료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		</form>
	</div>
	<script>
	
	// 핸드폰 번호 받아오기(한줄로 받아짐)
	
	let phone = "${list[0].getOrder_phone()}";
   	
	let phone1 = phone.slice(0,3);
	let phone2 = phone.slice(3,7);
	let phone3 = phone.slice(7);

	
	$("#phone1").val(phone1).prop("selected", true);
	$("#phone2").val(phone2);
	$("#phone3").val(phone3);
	
	
	// 사이드 메뉴바 클릭시
	$(".arrow1").on("click", function () {
        $(".sub-menu-first").toggle("4000ms");
      });

      $(".arrow2").on("click", function () {
        $(".sub-menu-second").toggle("4000ms");
      });

      $(".arrow3").on("click", function () {
        $(".sub-menu-third").toggle("4000ms");
      });

      $(".arrow4").on("click", function () {
        $(".sub-menu-fourth").toggle("4000ms");
      });
      $(".logoImg").on("click", function () {
					location.href = "/admin.ad"
				})
      
      // 뒤로가기 버튼
      $("#backBtn").on("click",function(){
    	  location.href = "/shipManage.sh?curPage=1";
      })

		// 수정완료 버튼
		$("#submitBtn").on("click", function() {
			
			// 전화번호 정규표현식
			let check = /^[0-9]+$/; 
			let phone2Check = $("#phone2").val();
			let phone3Check = $("#phone3").val();
		
			if($("#customerName").val() === "") {
				alert("수취인 이름을 입력하세요");
				return;
			}else if(phone2Check === "" || phone2Check === "") {
				alert("전화번호를 입력하세요");
				return;
			}else if(!check.test(phone2Check) || !check.test(phone3Check)) {
				alert("전화번호는 숫자만 가능합니다");
				return;
			}else if ($("#postCode").val() === "" || !check.test($("#postCode").val())) {
				alert("우편번호를 확인해주세요(숫자만 가능)");
				return;
			} else if ($("#roadAddr").val() === "") {
				alert("도로명주소를 넣어주세요");
				return;
			} else if ($("#detailAddr").val() === "") {
				let detailAddrCheck = confirm("상세 주소를 입력하지 않았습니다.괜찮으시겠습니까?");
				if(detailAddrCheck === true) {
					$(".shipmentModifyForm").submit();
				}else {
					return;
				}
			}
			$(".shipmentModifyForm").submit();
		})

		// 우편번호 api 주소 이용
		let btnPostCode = document.getElementById("btnPostCode");
		btnPostCode.onclick = executePostcode;

		function executePostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ""; // 참고 항목 변수

							if (data.bname !== ""
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							if (data.buildingName !== ""
									&& data.apartment === "Y") {
								extraRoadAddr += extraRoadAddr !== "" ? ", "
										+ data.buildingName : data.buildingName;
							}

							if (extraRoadAddr !== "") {
								extraRoadAddr = " (" + extraRoadAddr + ")";
							}

							document.getElementById("postCode").value = data.zonecode;
							document.getElementById("roadAddr").value = roadAddr;

						},
					}).open();
		}
	</script>
</body>
</html>