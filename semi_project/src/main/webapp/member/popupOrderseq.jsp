<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문번호 조회</title>
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
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/member/css/myPage.css">

</head>
<style>
	p{
	font-size: 0.7rem;}
</style>
<script>
 	$(document).ready(function(){
		
 	$("#btnClose").on("click", function(){
  		self.close();
  	});

  	$("#btnEnroll").on("click", function(e){
  		let stringVal = $('input[name="seq_order"]:checked').val();
  		let array = stringVal.split("/");
  		let seq_order = array[0];
  		let buy_name = array[1];
		
  		opener.document.getElementById("seq_order").value = seq_order;
  		opener.document.getElementById("buy_name").value = buy_name;
  		self.close();
  	});
 
		
 	});
</script>
<body>
    <div class="container" style="padding: 30px; width: 800px;text-align: center;">
        <div class="row">
            <div class="col"><h3>주문 내역</h3></div>
        </div>
        <table class="table table-striped boardTable text-center mt-3"id="tableBox">
        <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col"><p>주문번호</p></th>
                <th scope="col"><p>구매아이디</p></th>
                <th scope="col"><p>상품명</p></th>
                <th scope="col"><p>가격</p></th>
                <th scope="col"><p>수량</p></th>
                <th scope="col"><p>구매날짜</p></th>
            </tr>
        </thead>
        <tbody>
	        <c:forEach items="${list}" var="dto">
		        <tr>
		            <td><input type="radio" id="${dto.seq_order}" name="seq_order" value="${dto.seq_order}/${dto.buy_name}"></td> 
		            <td><p>${dto.seq_order}</p></td>
		            <td><p>${loginSession.user_id}</p></td>
		            <td><p>${dto.buy_name}</p></td>
		            <td><p>${dto.buy_price}</p></td>
		            <td><p>${dto.buy_qty}</p></td>
		            <td><p>${dto.buy_create}</p></td>
		         </tr>
	        </c:forEach> 
        </tbody>
      </table>
        <div class="row">
            <div class="col">
                <button id="btnClose" class="btn btn-secondary">취소하기</button>
                <button id="btnEnroll" class="btn btn-dark">등록하기</button>
            </div>
        </div>
    </div>
</body>
<%-- <script src="<%=request.getContextPath()%>script/popupOrderseq.js"></script> --%>
</html>