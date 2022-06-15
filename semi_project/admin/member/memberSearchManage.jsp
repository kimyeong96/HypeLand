<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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
.table>:not(:first-child) {
	border-top: none;
}

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
	margin-left: auto;
}

#tableBox>thead>tr>th:nth-child(1) {
	width: 340px;
}

tbody tr {
	transition: 0.7s ease;
	height: 41px;
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

#searchBtn {
	cursor: pointer;
}
/* 페이지 네이션*/
#pageNum {
	margin-left: 10px;
	margin-right: 10px;
}
/* 삭제 모달 */
.boardDeleteModal {
	position: fixed;
	top: 50%;
	left: 65%;
	transform: translate(-50%, -50%);
	border-radius: 5px;
	height: 120px;
	width: 300px;
	display: none;
	border: 1px solid black;
	background-color: #e8ecef;
}
/* 블랙리스트 상세 내용 모달*/
.blacklistDetailModal {
	width: 360px;
	height: 300px;
	background-color: gray;
	position: fixed;
	top: 50%;
	left: 80%;
	transform: translate(-50%, -50%);
	border-radius: 5px;
	color: #e8ecef;
	word-break: break-all;
	display: none;
}

.blacklistReviewModalBox {
	padding: 20px;
	height: 100%;
}

.blacklistDetailModalTitle {
	height: 20%;
}

.blacklistDetailModalTitle p {
	font-size: 18px;
}

.blacklistDetailModalContent {
	height: 70%;
	word-break: break-all;
}

#textAllSelect {
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
					<h3 class="text-center mt-3 firstTableTitle">회원 조회</h3>

					<div class="input-group rounded w-25 searchMemberInput mt-2 mb-3">
						<input type="search" class="form-control rounded"
							placeholder="ID 입력" aria-label="Search" id="searchWord"
							aria-describedby="search-addon"
							onKeypress="if(event.keyCode==13){enterKey()}" /> <span
							class="input-group-text border-0" id="searchBtn"> <i
							class="fas fa-search"></i>
						</span>
					</div>

					<div class="selectAll ms-4" style="border-top-width: 0px">
						<i class="fa-solid fa-folder-open"></i> <span class="ms-2"
							id="textAllSelect">전체조회</span>
					</div>

					<div class="MemberContainer" style="border-top-width: 0px">
						<table class="table table-striped memberTable text-center mt-3"
							id="tableBox">
							<thead>
								<tr>
									<th scope="col">회원ID</th>
									<th scope="col">생년월일</th>
									<th scope="col">전화번호</th>
									<th scope="col">블랙리스트</th>
									<th scope="col">수정</th>
								</tr>
							</thead>
							<tbody class="memberBoard">
								<c:choose>
									<c:when test="${list.size() == 0}">
										<tr>
											<td colspan=5>등록된 회원이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="dto">
											<tr>
												<td>${dto.getUser_id()}</td>
												<td class="d-none"><input value="${dto.getUser_id()}"></td>
												<td>${dto.getUser_date()}</td>
												<td>${dto.getUser_phone()}</td>
												<c:if test="${dto.getUser_blacklist() eq 'N' }">
													<td><span class="memberBlackList"><i
															class="fa-solid fa-user"></i></span></td>
												</c:if>
												<c:if test="${dto.getUser_blacklist() eq 'Y' }">
													<td><span class="memberBlackList"><i
															class="fa-solid fa-user-slash"></i></span></td>
												</c:if>
												<td class="d-none"><input
													value="${dto.getUser_blacklist()}"></td>
												<td id="icon"><span class="memberModify"><i
														class="fa-solid fa-pencil"></i></span></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${naviMap.Prev eq true}">
							<li class="page-item"><a class="page-link"
								href="/search.amem?curPage=${naviMap.startNavi-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}" step="1">
							<li class="page-item"><a
								class="page-link pageActive${pageNum}" id="pageNum"
								href="/search.amem?curPage=${pageNum}&&searchWord=${searchWord}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${naviMap.Next eq true}">
							<li class="page-item"><a class="page-link"
								href="/search.amem?curPage=${naviMap.endNavi+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- 블랙리스트 모달 -->
	<div class="blacklistDetailModal">
		<div class="blacklistReviewModalBox">
			<div class="row blacklistDetailModalTitle d-flex">
				<div class="col-8">
					<p>블랙리스트 사유</p>
				</div>
				<div class="col-4 d-flex justify-content-end">
					<i class="fa-solid fa-xmark closeBtn"></i>
				</div>
			</div>
			<div class="row blacklistDetailModalContent d-flex flex-column w-100">
				<div class="blacklistDetailModalText w-100"></div>
			</div>
			<div class="row blacklistDetailModalDate">
				<div class="col d-flex justify-content-center blacklistDetailDate">

				</div>
			</div>
		</div>
	</div>

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
		$("#textAllSelect").on("click", function() {
			location.href = "/select.amem?curPage=1";
		});
		 $(".logoImg").on("click",function(){
          location.href = "/admin.ad"
       })
       $(".adminIconLogout").on("click",function(){
         location.href = "/Tohome";
      })
		// 수정 클릭시
		$(".memberModify").on("click", function() {
			let thisRow = $(this).closest('tr');
			let user_id = thisRow.find('td:eq(0)').html();
			location.href = "/membermodify.amem?user_id=" + user_id;
		});
		function enterKey() {
			$("#searchBtn").click();
		}
		$("#searchBtn").on(
				"click",
				function() {
					let searchWord = $("#searchWord").val();
					console.log(searchWord);
					if (searchWord == "") {
						location.href = "/select.amem?curPage=1";
					} else if (searchWord != "") {
						location.href = "/search.amem?&curPage=1&&searchWord="
								+ searchWord;

					}
				});
		// 페이지 네이션 action
		let active = $(".page-link").text();
		let activePage = '${curPage}';
		for (let i = 0; i < active.length; i++) {
			console.log("asdasd : " + active[i]);
			if (active[i] == activePage) {
				$(".pageActive" + (i + 1)).css({
					"background-color" : "#13213c",
					"color" : "white"
				});
				break;
			}
		}

		// 블랙리스트 사유
		$(".memberBlackList").on(
				"click",
				function() {
					let thisRow = $(this).closest('tr');
					let user_id = thisRow.find('td:eq(1)').find('input').val();

					// 블랙리스트 유무 가져오기 
					let getBlacklistMember = thisRow.find('td:eq(5)').find(
							'input').val();

					// 블랙리스트 일때만 ajax 작동
					if (getBlacklistMember == "Y") {
						$.ajax({
							url : "/memberBlacklist.amem?user_id=" + user_id,
							type : "get",
							dataType : "json",
							success : function(data) {
								console.log(data);
								// 데이터 값 받아오기 
								let black_reason = data[0].black_reason;
								let black_date = data[0].black_date;

								$(".blacklistDetailModalText").html(
										black_reason);
								$(".blacklistDetailDate").html(black_date);
								// 모달 창 띄우기
								$(".blacklistDetailModal").fadeIn();

								$(".closeBtn").off().on("click", function() {
									$(".blacklistDetailModal").fadeOut();
								})

							},
							error : function(e) {
								console.log(e);
							}
						})

					} else { // 블랙리스트가 아니라면 alert로 띄워주기
						alert("해당 회원은 블랙리스트가 아닙니다");
					}

				})
	</script>
</body>
</html>