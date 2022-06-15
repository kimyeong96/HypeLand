<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 관리</title>
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

.reviewContainer {
	height: 450px;
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
td span, .reviewDetailModalExitIcon {
	cursor: pointer;
}

/* 리뷰 내용 */
.form-group textarea {
	overflow-y: scroll;
}

/* 리뷰 내용 스크롤 없애기 */
.form-group textarea {
	-ms-overflow-style: none;
}

.form-group textarea::-webkit-scrollbar {
	display: none;
}

.selectAll:hover, i {
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

/* 상세 내용 모달*/
.reviewDetailModal {
	width: 400px;
	height: 500px;
	background-color: gray;
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	border-radius: 5px;
	color: #e8ecef;
	display: none;
}

.reviewModalBox {
	padding: 10px;
	height: 100%;
}

.reviewDetailModalTitle {
	height: 10%;
}

.reviewDetailImg {
	text-align: center;
}

.reviewDetailText {
	margin-left: 13px;
	word-break: break-all;
}

.reviewDetailModalTitle p {
	font-size: 18px;
}

.reviewDetailModalImg {
	height: 47%;
}

.reviewDetailModalText {
	height: 38%
}

.reviewDetailModalFooter {
	height: 10%;
}

/* 리뷰 딜리트 모달 */
.reviewDeleteModal {
	position: fixed;
	top: 50%;
	left: 60%;
	transform: translate(-50%, -50%);
	border-radius: 5px;
	height: 120px;
	width: 320px;
	border: 1px solid black;
	background-color: #e8ecef;
	display: none;
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
					<h2 class="text-center mt-5 firstTableTitle">리뷰 관리</h2>

					<!-- 검색 버튼 -->
					<form id="searchForm" action="/searchProc.rv" method="post"
						style="border-top-width: 0px;">
						<div
							class="input-group rounded w-25 searchMemberInput mt-2 mb-3 me-3"
							style="border-top-width: 0px;">
							<input type="search" class="form-control rounded"
								placeholder="아이디를 입력하세요" id="searchKeyword" name="searchKeyword"
								onKeypress="if(event.keyCode==13){enterKey()}" /> <span
								class="input-group-text border-0" id="search-addon"> <i
								class="fas fa-search" id="searchIcon"></i>
							</span>
						</div>
					</form>
					<!-- 전체 조회 -->
					<div class="selectAll ms-4" style="border-top-width: 0px">
						<i class="fa-solid fa-folder-open" id="selectAllIcon"></i> <span
							class="ms-1">전체조회</span>
					</div>

					<!-- 테이블 -->
					<div class="MemberContainer" style="border-top-width: 0px">
						<table class="table table-striped memberTable text-center mt-3"
							id="tableBox">
							<thead>
								<tr>
									<th scope="col">리뷰 번호</th>
									<th scope="col">상품 번호</th>
									<th scope="col">회원 아이디</th>
									<th scope="col">내용</th>
									<th scope="col">등록일</th>
									<th scope="col">평점</th>
									<th scope="col">상세 내용보기</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody class="table-body">
								<c:choose>
									<c:when test="${list.size() == 0}">
										<tr>
											<td colspan=8>등록된 정보가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="dto">
											<tr>
												<td class="align-middle">${dto.seq_review}</td>
												<td class="align-middle">${dto.seq_product}</td>
												<td class="align-middle">${dto.user_id }</td>
												<td class="align-middle">${dto.review_content }</td>
												<td class="align-middle">${dto.review_date}</td>
												<td class="align-middle">${dto.review_rate}</td>
												<td><a href="#"><i
														class="fa-solid fa-magnifying-glass reviewDetailIcon"></i></a></td>
												<td><a href="#"><i
														class="fa-solid fa-trash reviewDeleteIcon"></i></a></td>
												<td><input type="text" value="${dto.seq_review}"
													class="reviewDetailInput d-none"></td>
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
								<li class="page-item"><a class="page-link"
									href="/review.rv?curPage=${naviMap.startNavi-1}">Prev</a></li>
							</c:if>

							<c:forEach var="pageNum" begin="${naviMap.startNavi}"
								end="${naviMap.endNavi}" step="1">
								<li class="page-item"><a
									class="page-link pageActive${pageNum}"
									href="/review.rv?curPage=${pageNum}">${pageNum}</a></li>
							</c:forEach>

							<c:if test="${naviMap.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="/review.rv?curPage=${naviMap.endNavi+1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
					<!-- 리뷰 내용 상세보기 -->
					<div class="reviewDetailModal">
						<div class="reviewModalBox">
							<div class="row reviewDetailModalTitle d-flex">
								<div class="col-10">
									<h4>내용</h4>
								</div>
								<div class="col-2 d-flex justify-content-end">
									<i class="fa-solid fa-xmark closeBtn"></i>
								</div>
							</div>
							<div
								class="row reviewDetailModalImg d-flex justify-content-center ">
								<div class="col reviewDetailImg "></div>
							</div>
							<div
								class="row reviewDetailModalText d-flex justify-content-center ">
								<div class="col reviewDetailText w-100"></div>
							</div>

							<div class="row reviewDetailModalFooter ">
								<div class="col d-flex justify-content-center reviewDetailDate">
									2022,07월 08일</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 리뷰 삭제하기 -->
				<div class="reviewDeleteModal">
					<div class="text-center mt-4">해당 리뷰를 정말로 삭제 하시겠습니까?</div>
					<div class="row mt-3">
						<div class="col-md-6 d-flex justify-content-end">
							<button type="button" class="btn btn-primary btn-sm"
								id="reviewDeleteCancelBtn">취소</button>
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-danger btn-sm"
								id="reviewDeleteBtn">삭제</button>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<script>
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
      $(".logoImg").on("click",function(){
          location.href = "/admin.ad"
       })
       $(".adminIconLogout").on("click",function(){
         location.href = "/Tohome";
      })
      // 전체 조회 클릭시 
      $("#selectAllIcon").on("click",function(){
    	  location.href = "/review.rv?curPage=1";
      })
     // 상세 내용보기 아이콘 버튼 클릭시 
     $(".reviewDetailIcon").off().on("click",function(){
    	 let thisRow = $(this).closest('tr'); 
    	 let seq_review = thisRow.find('td:eq(8)').find('input').val();
    	 let seq_product = thisRow.find('td:eq(1)').text();
    	 
    	$.ajax({
    		url:"/checkReviewDetail.rv?&seq_review="+seq_review+"&seq_product="+seq_product,
			type: "get",
    		dataType: "json",
    		success: function(data) {
    			$(".reviewDetailImg").empty("");
				console.log(data[1].image_path);
				console.log(data[1].image_name);
    			// 저장된 경로 값 가져오기
    			
    			const img = document.createElement('img');
    			img.src = "./resource/imagesClothes/" + data[1].image_name;
    			img.setAttribute("width","350");
    			img.setAttribute("height","200");
    			console.log(img.src); 
    			$(".reviewDetailImg").append(img);

    			// 데이터 값 받아오기 
    			let review_content = data[0].review_content;
    			let review_date = data[0].review_date;
    			let image_name = data[1].image_name;
    			let image_path = data[1].image_path;
    			$(".reviewDetailText").html(review_content);
    			$(".reviewDetailDate").html(review_date);
    			
    			// 모달 창 띄우기
    			$(".reviewDetailModal").fadeIn();
				
    	  		$(".closeBtn").off().on("click",function() {
    	    		$(".reviewDetailModal").fadeOut();
    	  		})
    		},
    		error : function(e) {
    			console.log(e);
    		}
    	})
      })   
      // 리뷰 삭제 버튼 클릭시 
     $(".reviewDeleteIcon").on("click",function(){
    	 
    	 let thisRow = $(this).closest('tr'); 
    	 let seq_review = thisRow.find('td:eq(8)').find('input').val();
    	 
    	 
    	 $(".reviewDeleteModal").fadeIn();

	     $("#reviewDeleteCancelBtn").off().on("click", function () {
	              $(".reviewDeleteModal").fadeOut();
	     });
    	 
    	 $("#reviewDeleteBtn").on("click",function(){
    		 $.ajax({
    	    		url:"/deleteReviewDetail.rv?seq_review="+seq_review,
    				type: "post",
    				data: {seq_review,seq_review},
    	    		dataType: "json",
    	    		success: function(data) {
    	    			location.href="/review.rv?curPage=1";
    	    		},
    	    		error : function(e) {
    	    			console.log(e);
    	    		}
    	    	})
    	 })  	 
      })
      // enterKey
		function enterKey(){
 			$("#searchIcon").click();
 		}
  	
   // 페이지 네이션 action
		let active = $(".page-link").text();
		let activePage = '${curPage}';
		for (let i = 0; i < active.length; i++) {
			if (active[i] == activePage) {
				$(".pageActive"+(i+1)).css({
					"background-color" : "#13213c",
					"color" : "white"
				});
				break;
			}
		}
      // searchIcon 클릭시
      $("#searchIcon").on("click",function(){
    	  
    	  // 검색 내용이 없을 때
    	  if($("#searchKeyword").val() === ""){
  			alert("내용을 입력하세요.");
  			$("#searchKeyword").focus();
  			return;
  		}
  			
    	  console.log($("#searchKeyword").val());
    	  $("#searchForm").submit();
      })
	</script>
</body>
</html>