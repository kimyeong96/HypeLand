<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>배송 문의</title>
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

.adminNavbar-left span, .replyDeleteIcon {
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

.boardDeleteModal {
	padding: 20px;
	height: 100%;
}

.form-group textarea {
	overflow-y: scroll;
}

/* 댓글 상자 */
.commentBox {
	border-radius: 5px;
}

.commentDate {
	color: grey;
	font-size: 10px;
}

.reply-user {
	font-weight: bold;
}

.reply-date {
	color: grey;
	font-size: 12px;
}

.reply-header:not(:first-child) {
	border-top: 1px solid lightgrey;
}
.reply-content {
	border: none;
	width: 70%;
}

textarea {
	resize: none;
}

#adminReply {
	height: 100px;
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
				<div class="container">
					<div class="boardDeleteModal">
						<h3 class="text-center">배송 문의</h3>


						<!-- 게시글 제목과 내용 -->
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								class="form-control mt-2" value="${list[0].getQna_title()}"
								readonly />
						</div>
						<div class="form-group mt-2">
							<label for="exampleFormControlTextarea1">내용</label>
							<textarea class="form-control mt-2 qnaContent" rows="4" readonly>${list[0].getQna_content()}</textarea>
						</div>

						<!-- 댓글 헤드라인 -->
						<div class="form-group mt-4 text-center">
							<label for="exampleInputEmail1" class="text-center"> <strong>댓글</strong>
							</label>
						</div>

						<!-- 댓글 출력 영역 -->
						<div class="form-group mt-4 commentContainer reply-body">
							<c:if test="${empty replyList}">
								<div class="col-12">
									<p>등록된 댓글이 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${not empty replyList}">
								<c:forEach items="${replyList}" var="reply">
									<div class="col-12 reply-header mt-2">
										<span class="ms-5 reply-user">${reply.user_id}</span>&nbsp; <span
											class="reply-date">${reply.reply_date}</span><br />
									</div>
									<div class="row mt-1">
										<div class="col-10">${reply.qna_reply}</div>
										<div class="col-2 boardDelete d-flex justify-content-center">
											<i class="fa-solid fa-trash ms-3 replyDeleteIcon"></i> <input
												type="text" value="${reply.seq_reply}" class="d-none">
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>

						<!-- 관리자 댓글 등록 -->
						<form id="replyForm" name="replyForm">
							<div class="form-group mt-5">
								<label for="exampleFormControlTextarea1"> 
									<strong>관리자 내용</strong>
								</label> 
									<input type="text" class="d-none" value="${list[0].getSeq_qna()}" name="seq_qna" id="registerContentInput"> <input type="text"
									class="form-control mt-lg-2" id="adminReply" name="adminReply" />
							</div>
						</form>

						<!--버튼-->
						<div class="boardDeleteModal-footer d-flex mt-3">
							<div class="col d-flex justify-content-center">
								<button type="button" class="btn btn-secondary ms-2 me-2"
									id="qnaReplyCancelBtn">뒤로가기</button>
								<button type="submit" class="btn btn-primary ms-2 me-2"
									id="qnaReplySubmitBtn">등록</button>
								<button type="button" class="btn btn-danger ms-2 me-2"
									id="qnaReplyDeleteModal">게시글 삭제</button>
							</div>
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

// 댓글 등록 
$("#qnaReplySubmitBtn").on("click", function(){
	
	let adminReply = $("#adminReply").val();
	let seq_qna =$("#registerContentInput").val();
	
	if(adminReply === ""){ // 댓글 입력창이 비어있다면
		alert("댓글을 입력하세요")
		return;
	} 

	// 글 쓰고 빈칸으로 만들기
	$("#adminReply").val("");
	 
	  $.ajax({
		url : "/registerReplyQna.qna",
		type : "post",
		data : {"adminReply" : adminReply, "seq_qna" : seq_qna},
		success: function(rs){
			showReply(rs);
		}, 
		error: function(e){
			console.log(e);
		}
	})    
})


// 댓글 삭제
// replyDeleteIcon 클릭시 해당 seq_reply 얻어오기 
$(".reply-body").on("click",".replyDeleteIcon", function(e) {
	let seq_reply = e.target.nextElementSibling.value;
	
	let answer = confirm("댓글을 정말 삭제하시겠습니까?");
	if(answer) {
		$.ajax({
			url : "/deleteReplyQna.qna",
			type : "post",
			data : {seq_reply: seq_reply, seq_qna: "${list[0].getSeq_qna()}"},
			success : function(data){
				showReply(data);
			}, 
			error : function(e){
				console.log(e);
			}
		})
	}

})


// 취소 버튼 
$("#qnaReplyCancelBtn").on("click",function(){
	location.href = "/boardQna.qna?curPage=1";
})


// 게시글 삭제 
$("#qnaReplyDeleteModal").on("click",function(){
	let seq_qna = "${list[0].getSeq_qna()}";
	
	let answer = confirm("게시글을 정말 삭제하시겠습니까?");
	if(answer) {
		$.ajax({
			url : "/deleteQnaBoard.qna",
			type : "post",
			data : {seq_qna: "${list[0].getSeq_qna()}"},
			success : function(data){
				alert("게시글 삭제 완료");
				location.href = "/boardQna.qna?curPage=1";
			}, 
			error : function(e){
				console.log(e);
			}
		})
	}
})


// 댓글 보여주기 함수
function showReply(rs) {
	
	let replyList = JSON.parse(rs);
	
	$(".reply-body").empty();
	
	if(replyList.length == 0) {
		let p = $("<p>").addClass("text-center").html("등록된 댓글이 없습니다.");
		let div = $("<div>").addClass("col-12");
		div.append(p);
		$(".reply-body").append(div);

	}else {
		for(let reply of replyList){
			let user = $("<span>").addClass("ms-5 reply-user").html(reply.user_id);
			let date = $("<span>").addClass("ms-2 reply-date").html(reply.reply_date);
			let header = $("<div>").addClass("col-12 reply-header mt-2");
			header.append(user, date);
			
			let content = $("<div>").addClass("row mt-1");
			let replyTextContent1 = $("<div>").addClass("col-10").html(reply.qna_reply);
			
			let deleteReplyIcon = $("<i>").addClass("fa-solid fa-trash ms-3 replyDeleteIcon");
			let deleteReplyInput = $("<input>").attr({
				type : "text",
				value : reply.seq_reply,
				class : "d-none"
			})
			
			let replyTempText = $("<div>").addClass("col-2 boardDelete d-flex justify-content-center");
			let replyTextContent2 = replyTempText.append(deleteReplyIcon,deleteReplyInput);
			
			content.append(replyTextContent1,replyTextContent2);
			
			$(".reply-body").append(header,content);
	
		}
	}
}




</script>










</body>
</html>