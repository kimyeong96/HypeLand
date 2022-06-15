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

<style>
.logoImg{
      	width:100px;
      	height : 55px;
      	cursor:pointer;
      }
.adminContainer {
	height: 100vh;
	background-color: black;
}

.titleLogo, .shipmentModify, #selectAllIcon, #searchIcon {
	cursor: pointer;
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

.adminMainContainer {
	background-color: none;
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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

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
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	color: #fff;
}

.icon-link .icon-link-left {
	color: #fff;
}

.icon-link .icon-link-left i {
	left: 0;
	margin-right: 16px;
	color: #fff;
}

.icon-link .icon-link-left span {
	color: #fff;
}

.sub-menu {
	margin-left: 16%;
	list-style: none;
	display: none;
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
/* 메인 페이지 */
.table>:not(:first-child) {
	border-top: none;
}

.memberDelete, .memberModify, .selectAllIcon {
	cursor: pointer;
}

.searchMemberInput {
	margin-left: auto;
}

#tableBox>tbody>tr {
	height: 41px;
}

/* 수정 모달창 */
.modal {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

.modal_content {
	width: 650px;
	height: 650px;
	background: #fff;
	border-radius: 10px;
	position: relative;
	top: 20%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
	text-align: center;
	box-sizing: border-box;
	padding: 30px 0;
	line-height: 23px;
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
			<div class="col-md-10 adminMainContainer">
				<div class="table firstTable">
					<h3 class="text-center mt-3 firstTableTitle">배송 정보</h3>

					<!-- 배송 상태 고르기 -->
					<div class="boardCategory d-flex justify-content-center mt-4"
						style="border-top-width: 0px">
						<select class="form-select w-25" id="category-Selector">
							<option>배송 상태를 고르세요</option>
							<option value="상품 준비중" class="category-Shipment"
								name="productReady">상품 준비중</option>
							<option value="상품 출발" class="category-Payment"
								name="productStart">상품 출발</option>
							<option value="상품 도착" class="category-Payment"
								name="productArrive">상품 도착</option>
						</select>
					</div>


					<!-- 검색 버튼 -->
					<div class="input-group rounded w-25 searchMemberInput mt-2 mb-3">
						<input type="search" class="form-control rounded"
							placeholder="ID를 입력하세요" id="searchKeyword"
							onKeypress="if(event.keyCode==13){enterKey()}" /> <span
							class="input-group-text border-0" id="search-addon"> <i
							class="fas fa-search" id="searchIcon"></i>
						</span>
					</div>

					<!-- 전체 조회 -->
					<div class="selectAll ms-4" style="border-top-width: 0px">
						<i class="fa-solid fa-folder-open"></i> <span class="ms-1"
							id="selectAllIcon">전체조회</span>
					</div>

					<!-- 테이블 -->
					<div class="MemberContainer" style="border-top-width: 0px">
						<table class="table table-striped memberTable text-center mt-3"
							id="tableBox">
							<thead>
								<tr>
									<th scope="col">주문 번호</th>
									<th scope="col">회원 아이디</th>
									<th scope="col">회원 이름</th>
									<th scope="col">주소</th>
									<th scope="col">배송 상태</th>
									<th scope="col">수정</th>
								</tr>
							</thead>
							<tbody class="table-body">
								<c:choose>
									<c:when test="${list.size() == 0}">
										<tr>
											<td colspan=6>등록된 정보가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="dto">
											<tr>
												<td class="align-middle">${dto.seq_order}</td>
												<td class="align-middle">${dto.user_id}</td>
												<td class="align-middle">${dto.order_name }</td>
												<td class="align-middle">${dto.order_address }</td>
												<td class="align-middle">${dto.order_status}</td>
												<td class="align-middle"><a
													href="/shipModify.sh?seq_order=${dto.seq_order}"><i
														class="fa-solid fa-pencil shipmentModify"></i></a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>



					<!-- 페이지네이션 -->
					<nav class="navPagination">
						<ul class="pagination justify-content-center">
							<c:if test="${naviMap.needPrev eq true}">
								<li class="page-item"><a class="page-link"
									href="/selectedProc.sh?curPage=${naviMap.startNavi-1}&selectedVal=${list[0].getOrder_status()}">Prev</a></li>
							</c:if>

							<c:forEach var="pageNum" begin="${naviMap.startNavi}"
								end="${naviMap.endNavi}" step="1">
								<li class="page-item"><a class="page-link"
									href="/selectedProc.sh?curPage=${pageNum}&selectedVal=${list[0].getOrder_status()}">${pageNum}</a></li>
							</c:forEach>

							<c:if test="${naviMap.needNext eq true}">
								<li class="page-item"><a class="page-link"
									href="/selectedProc.sh?curPage=${naviMap.endNavi+1}&selectedVal=${list[0].getOrder_status()}">Next</a></li>
							</c:if>
						</ul>
					</nav>

				</div>
			</div>
		</div>
	</div>

	<script>

// 왼쪽 네브바 클릭

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
  	// 검색 했을 때 출력
	$("#searchIcon").on("click",function() {
		let searchKeyword = $("#searchKeyword").val();
		console.log(searchKeyword);
		
		 $.ajax({
			url:"/searchProc.sh?searchKeyword="+searchKeyword,
			type: "get",
    		dataType: "json",
    		success: function(data) {
    			 $(".table-body").empty(); // 기존 게시글 다 삭제
    			
    			if(data.length == 0){
					let tr = $("<tr>");
					let td = $("<td colspan=6>").html("검색된 배송정보가 없습니다.");
					tr.append(td);
					$(".table-body").append(tr);
				}else{
					for(let dto of data){ 
						let tr = $("<tr>");
						let td1 = $("<td>").html(dto.seq_order);
						let td2 = $("<td>").html(dto.user_id);
						let td3 = $("<td>").html(dto.order_name);
						let td4 = $("<td>").html(dto.order_address);
						let td5 = $("<td>").html(dto.order_status);
						let iTag = $("<i>").attr("class","fa-solid fa-pencil shipmentModify");
						let tempATag = $("<a>").attr("href", "/shipModify.sh?seq_order="+dto.seq_order);
						let aTag = tempATag.append(iTag);
						let td6 = $("<td>").append(aTag);
						tr.append(td1, td2, td3, td4, td5, td6);
						$(".table-body").append(tr);
					}   					
					
					// 기존 페이지네이션 삭제
					$(".navPagination").attr("class","d-none");
				}	 
    		},
    		error : function(e) {
    			console.log(e);
    		}
		}) 
	})
	// enterKey
	function enterKey(){
 			$("#searchIcon").click();
 		}
  	
	// 전체 조회 클릭
	$("#selectAllIcon").on("click",function() {
		location.href ="/shipManage.sh?curPage=1";
	})
	
		
	
	
	// select에서 선택된 해당 value를 이용해 페이지 이동
        $(document).ready(function () {
          $("#category-Selector").change(function () {
            let selectedVal = $(this).val();
            location.href = "/selectedProc.sh?curPage=1&selectedVal="+selectedVal;
          });
        })
	
	
	
	
	
	

</script>


</body>
</html>