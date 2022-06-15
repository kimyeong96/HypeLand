<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 조회</title>
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
p {
  font-size: 1rem;
}
span{
  font-size: 0.9rem;
  color: lightgray;
}

.btnModify, .btnDelete {
  height: 40px;
  font-size: 1rem;
  border: 1px solid lightgray;
  font-weight: bold;
}
.btnSelect {
  float: right;
  height: 40px;
  font-size: 1rem;
  font-weight: bold;
}
a{
  text-decoration: none;
}
</style>
<script>
 	$(document).ready(function(){
 	$(".deliList").on("click", ".btnModify", function(e){
 		let seq_deli = $(e.target).val();
 		$("#seq_deli").val(seq_deli);
 		$("#deliForm").attr("action", "/toModifyDeli.deli");
 		$("#deliForm").submit();
  	});
 	
 	$(".deliList").on("click", ".btnDelete", function(e){
 		let seq_deli = $(e.target).val();
 		$("#seq_deli").val(seq_deli);
 		let data = $("#deliForm").serialize();
 		
 		$.ajax({
			url : "/toDeleteProc.deli"
			, type : "post"
			, data : data
			, success : function(resultData){
				if(resultData === "deleteSuccess"){
					alert("삭제 성공");
					
					opener.parent.location.reload();
					
				}else{
					alert("삭제 실패!");
				}
				location.href="/toSearchDeli.deli";
			}, error : function(e){
				console.log(e);
			}
		})
  	});
 	
 	$(".deliList").on("click", ".btnSelect", function(e){
 		let seq_deli = $(e.target).val();
 		$("#seq_deli").val(seq_deli);
 		let data = $("#deliForm").serialize(); 
 		
 		
 		$.ajax({
			url : "/toPay.deli"
			, type : "post"
			, data : data
			, dataType : "json"
			, success : function(result){
				if(result !== null){
					let deli_name = result.deli_name;
					let deli_address = result.deli_address;
					
					let deli_phone = result.deli_phone;
					opener.$("#phone").val(deli_phone);
					let deli_postCode = result.deli_postCode;
					
					let phone1 = deli_phone.substr(0, 3);
					let phone2 = deli_phone.substr(3, 4);
					let phone3 = deli_phone.substr(7, 4);
				
					opener.$("#order_name").text(deli_name); 
					opener.$("#order_address").text(deli_address);
					opener.$("#order_phone").text(phone1 +"-"+ phone2 + "-" +phone3);
					opener.$("#order_postCode").val(deli_postCode); 
					opener.$('input:radio[name=destination]:input[value='+seq_deli+']').attr("checked",true);
					self.close();
					
				}else{
					alert("error :02 ");
				}
			}, error : function(e){
				console.log(e);
			}
		})
 		
  	});
 	
 	});
</script>
<body>
  <form id="deliForm" mothod="post">
          <div class="container" style="padding: 30px; width: 900px;">
            <div class="row mb-4">
              <div class="col">
                <h3 style="font-weight: bold;">배송지 목록</h3>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <a href="/toinsertDeli.deli" style="float: right;">직접 입력 +</a>
              </div>
            </div>
        <c:choose>
        <c:when test="${empty deli_list}">
         <div class="row deliList mb-3">
              <div class="col pb-3" style="border-bottom: 1px solid lightgray;">   
            	<h5 style="font-weight: bold;">등록된 배송지가 없습니다.</h5>
           </div>
         </div>
        </c:when>  	
        <c:otherwise>
        <c:forEach items="${deli_list}" var="dto">
        <c:set var="user_phone" value="${dto.deli_phone}"/>   
            <div class="row deliList mb-3">
              <div class="col pb-3" style="border-bottom: 1px solid lightgray;">
                <h5 style="font-weight: bold;">${dto.deli_place} (${dto.deli_name}님 배송지)</h5>
                <span>${fn:substring(user_phone,0,3)}-${fn:substring(user_phone,3,7)}-${fn:substring(user_phone,7,11)}</span>
                <p>(${dto.deli_postCode}) ${dto.deli_address}</p>
                <button type="button" class="btn btn-light btnModify" value="${dto.seq_deli}">수정</button>
                <button type="button" class="btn btn-light btnDelete" value="${dto.seq_deli}">삭제</button>
                <button type="button" class="btn btn-dark btnSelect" value="${dto.seq_deli}">선택</button>
              </div>
            </div>
         </c:forEach> 
         </c:otherwise>
        </c:choose>  
          </div>
          <input type="hidden" id="seq_deli" name="seq_deli"  />
       </form>
       
</body>
</html>