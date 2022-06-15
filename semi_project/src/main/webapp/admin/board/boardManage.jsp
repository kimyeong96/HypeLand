<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문의 관리</title>
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


<style>
.logoImg{
      	width:100px;
      	height : 55px;
      	cursor:pointer;
      }
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
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

tbody tr {
	transition: 0.7s ease;
}

/* table hover시 color 변경 */
#tableBox:hover tbody tr:hover td {
	background-color: #7f7f7f;
	color: #fff;
}

/* 이모티콘 cursor pointer */
td span, .replyExit {
	cursor: pointer;
}

.selectAllIcon {
	cursor: pointer;
}

a {
	text-decoration: none;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
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

			<!-- 메인 부분 -->
			<div class="col-md-10 adminMainContainer">
				<div class="table firstTable">
					<h2 class="text-center mt-5 firstTableTitle">문의 관리</h2>

					<!-- 문의 고르기 -->
					<div class="boardCategory d-flex justify-content-center mt-4"
						style="border-top-width: 0px">
						<select class="form-select w-25" id="category-Selector">
							<option>문의 유형</option>
							<option value="배송" class="category-Shipment" name="shipment">배송</option>
							<option value="결제" class="category-Payment" name="payment">결제</option>
						</select>
					</div>

					<!-- 전체 조회 버튼 -->
					<div class="selectAll ms-4" style="border-top-width: 0px">
						<i class="fa-solid fa-folder-open"></i> <span
							class="ms-2 selectAllIcon">전체조회</span>
					</div>

					<!-- 테이블 생성 -->
					<div class="boardContainer" style="border-top-width: 0px">
						<table class="table table-striped boardTable text-center mt-3"
							id="tableBox">
							<thead>
								<tr>
									<th scope="col">문의 번호</th>
									<th scope="col">문의 유형</th>
									<th scope="col">회원ID</th>
									<th scope="col">제목</th>
									<th scope="col">날짜</th>
									<th scope="col">등록</th>
									<th scope="col">답변유무</th>
								</tr>
							</thead>
							<tbody class="table-body">
								<c:choose>
									<c:when test="${list.size() == 0}">
										<tr>
											<td colspan=7>등록된 정보가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="dto">
											<tr>
												<td class="align-middle">${dto.seq_qna}</td>
												<td class="align-middle">${dto.qna_type}</td>
												<td class="align-middle">${dto.user_id}</td>
												<td class="align-middle">${dto.qna_title}</td>
												<td class="align-middle">${dto.qna_date}</td>
												<td><a
													href="/boardQnaRegister.qna?seq_qna=${dto.seq_qna}"><i
														class="fa-solid fa-pen-to-square"></i>
												</a></td>
												<c:if test="${dto.qna_status eq '답변대기'}">
													<td class="align-middle">답변대기</td>
												</c:if>
												<c:if test="${dto.qna_status eq '답변완료'}">
													<td class="align-middle">답변완료</td>
												</c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>

					<!-- 페이지네이션 -->
					<nav style="border-top-width: 0px;" class="PageNavigation">
						<ul class="pagination justify-content-center">
							<c:if test="${naviMap.needPrev eq true}">
								<li class="page-item"><a class="page-link pageBtn1"
									href="/boardQna.qna?curPage=${naviMap.startNavi-1}">Prev</a></li>
							</c:if>

							<c:forEach var="pageNum" begin="${naviMap.startNavi}"
								end="${naviMap.endNavi}" step="1">
								<li class="page-item"><a
									class="page-link pageActive${pageNum}"
									href="/boardQna.qna?curPage=${pageNum}">${pageNum}</a></li>
							</c:forEach>

							<c:if test="${naviMap.needNext eq true}">
								<li class="page-item"><a class="page-link pageBtn3"
									href="/boardQna.qna?curPage=${naviMap.endNavi+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>

				</div>

			</div>
		</div>
	</div>
	</div>
	</div>
	<script>
		// 사이드 네브바
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
		// 페이지 네이션 action
		let active = $(".page-link").text();
		let activePage = '${curPage}';
		for (let i = 0; i < active.length; i++) {
			if (active[i] == activePage) {
				$(".pageActive" + (i + 1)).css({
					"background-color" : "#13213c",
					"color" : "white"
				});
				break;
			}
		}
		// 전체조회 클릭시 이동
		$(".selectAllIcon").on("click", function() {
			location.href = "/boardQna.qna?curPage=1";
		})

		// select에서 선택된 해당 value를 이용해 페이지 이동
		$(document)
				.ready(
						function() {
							$("#category-Selector")
									.change(
											function() {
												let selectedVal = $(this).val();
												console.log("hello");
												console.log(selectedVal);
												location.href = "/selectedProc.qna?curPage=1&selectedVal="
														+ selectedVal;
											});
						})
	</script>

</body>
</html>